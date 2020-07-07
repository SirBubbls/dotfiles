;;; ~/Dropbox/Configurations/dotfiles/doom/doom.d/configurations/latex-fragment.el -*- lexical-binding: t; -*-

;; (setq org-preview-latex-default-process 'dvisvgm)

;; Latex Fragments
(after! org
  ;; Preview on Startup
  (setq org-startup-with-latex-preview 't)

  ;; Auto render latex fragments
  (add-hook 'org-mode-hook 'org-fragtog-mode)
)
