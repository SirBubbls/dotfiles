;;; ../.dotfiles/doom/doom.d/configurations/lsp-config.el -*- lexical-binding: t; -*-

(setq gc-cons-threshold 300000000)

(setq read-process-output-max (* 1024 2048)) ;; 1mb


(after! company
  (setq company-idle-delay 0.2)

  ;; company-box settings
  (setq
   company-box-doc-delay 2  ;; 2 second delay until documentation is shown
   company-box-scrollbar -1  ;; disable scrollbar
   company-box-max-candidates 10)
  )

(after! lsp-mode
  (setq
   lsp-idle-delay 2
   lsp-ui-doc-delay 3
   ;; lsp-ui-sideline-delay 4
   lsp-log-io nil)  ;; disable logging
  )
