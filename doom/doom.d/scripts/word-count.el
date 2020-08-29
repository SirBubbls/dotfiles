(defun in-comment-p ()
  "Return non-nil if point is in a comment."
  (if (or (null comment-start-skip)
          (eq (preceding-char) ?\r))
      nil
    (save-excursion
      (let ((pos (point)))
        (re-search-backward "^\\|\r" nil t)
        (or (looking-at comment-start-skip)
            (re-search-forward comment-start-skip pos t))))))

(defun in-org-table-p ()
  "Return non-nil if point is in an org-mode table."
  (if (or (not (boundp 'org-table-any-line-regexp))
          (null org-table-any-line-regexp)
          (eq (preceding-char) ?\r))
      nil
    (save-excursion
      (let ((pos (point)))
        (re-search-backward "^\\|\r" nil t)
        (looking-at org-table-any-line-regexp)))))


(defvar latex-macro-regexp "\\\\[A-Za-z]+\\(\\[[^]]*\\]\\|\\){\\([^}]*\\)}")

(defun org-word-count (beg end)
  "Retuns the number of words in the buffer (without src blocks or comments)"
  (interactive "r")
  (unless mark-active
    (setf beg (point-min)
          end (point-max)))
  (let ((wc 0))
    (save-excursion
      (goto-char beg)
      (while (< (point) end)
        (re-search-forward "\\w+\\W*")
        (cond
         ((or (in-comment-p) (in-org-table-p) (org-in-src-block-p))
          nil)
         ((looking-at org-any-link-re)
          (goto-char (match-end 0)))
         ((save-excursion
            (backward-char)
            (looking-at latex-macro-regexp))
          (goto-char (match-end 0))
          (setf wc (+ 2 wc)))
         (t
          (incf wc)))))
    (message (format "%d words in %s." wc
                     (if mark-active "region" "buffer")))))
