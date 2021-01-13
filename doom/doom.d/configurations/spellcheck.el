(after! ispell
  (if (executable-find "languagetool")
      (setq langtool-mother-tongue "de")
    (setq langtool-default-language "de-DE")
    ;; Unicode Support
    (setq langtool-java-user-arguments '("-Dfile.encoding=UTF-8"))
    )

  (if (and (file-exists-p "~/Library/Spelling/de_DE.aff")
           (file-exists-p "~/Library/Spelling/en_US.aff")
           (executable-find "hunspell"))
      (with-eval-after-load "ispell"
        (setenv "LANG" "en_US,de_DE")
        (setq ispell-really-hunspell t)
        (setq ispell-program-name "hunspell")
        (setq ispell-dictionary "en_US,de_DE")
        (setq ispell-personal-dictionary "~/.doom.d/personal_dict")
        (ispell-set-spellchecker-params)
        (ispell-hunspell-add-multi-dic "en_US,de_DE")
        )
    )

  ;; Add word under cursor to personal dictionary and refresh errors in buffer
  (defun add-word-to-personal-dict ()
    (interactive)
    (let ((current-location (point))
          (word (flyspell-get-word)))
      (when (consp word)
        (append-to-file (concat (car word) "\n") nil ispell-personal-dictionary)
        (flyspell-lazy-check-buffer))))
  )
