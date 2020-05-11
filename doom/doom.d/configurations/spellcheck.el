

;; ;;
;; ;; LangTool
;; ;;

;; ;; ;; Default Language
;; ;; ;; Unicode Support
;; (setq langtool-java-user-arguments '("-Dfile.encoding=UTF-8"))

(if (executable-find "languagetool")
  (setq langtool-mother-tongue "de")
  (setq langtool-default-language "de-DE")
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
