(with-eval-after-load "ispell"
  (setenv "LANG" "en_US, de_DE")
  (setq ispell-really-hunspell t)
  (setq ispell-program-name "hunspell")
  (setq ispell-dictionary "en_US,de_DE")
  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "en_US,de_DE")
  (setq ispell-personal-dictionary "~/.doom.d/personal_dict")
)


;;
;; LangTool
;;
(setq langtool-mother-tongue "de")

;; Default Language
(setq langtool-default-language "de-DE")
;; Unicode Support
(setq langtool-java-user-arguments '("-Dfile.encoding=UTF-8"))
