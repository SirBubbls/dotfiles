;;; ~/.doom.d/bindings.el -*- lexical-binding: t; -*-
(when (eq 'system-type 'darwin)
  (setq mac-command-modifier 'meta))

(map! :n "t" 'evil-insert
      :n "T" 'evil-insert-line
      :n "l" 'evil-open-below
      :n "L" 'evil-open-above
      :n "f" 'evil-ex-search-next
      :n "F" 'evil-ex-search-previous
      :n "h" 'evil-backward-char
      :n "n" 'evil-next-line
      :n "e" 'evil-previous-line
      :n "i" 'evil-forward-char
      :n "u" 'evil-insert
      :n (kbd "s-b") 'evil-switch-to-windows-last-buffer
      (:after company
        :map company-active-map
        "C-n"         #'company-select-next
        "C-e"         #'company-select-previous
        "C-d"         #'company-show-doc-buffer
        )
      :after evil-mode
      :map evil-visual-state-map
      :nv "n" 'evil-next-line
      :nv "e" 'evil-previous-line
      :leader (:prefix "b"
                :desc "list-buffers" "b" #'ivy-switch-buffer)
      )

(define-key evil-visual-state-map "n" 'evil-next-line)
(define-key evil-normal-state-map (kbd "M-/") 'comment-line)

(global-set-key (kbd "s-t") (eshell))
(global-set-key (kbd "M--") 'doom/decrease-font-size)
(global-set-key (kbd "M-=") 'doom/increase-font-size)