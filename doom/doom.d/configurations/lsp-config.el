;;; ../.dotfiles/doom/doom.d/configurations/lsp-config.el -*- lexical-binding: t; -*-

(setq gc-cons-threshold 100000000)

(setq read-process-output-max (* 1024 1024)) ;; 1mb


(after! company
  (setq company-idle-delay 0.05)
  )
(after! lsp-mode
  (setq lsp-log-io nil)
  (setq lsp-idle-delay 0.05)
  )
