;;; ~/Dropbox/Configurations/dotfiles/doom/doom.d/configurations/look.el -*- lexical-binding: t; -*-

(setq doom-themes-treemacs-theme "doom-colors")
(doom-themes-visual-bell-config)
(doom-themes-treemacs-config)

;; ivy-posframe configuration
(after! ivy-posframe
  (setq ivy-posframe-display-functions-alist
        '((complete-symbol   . ivy-posframe-display-at-point)
          (counsel-M-x       . ivy-posframe-display-at-frame-center)
          (counsel-find-file . ivy-posframe-display-at-frame-center)
          (ivy-switch-buffer . ivy-posframe-display-at-frame-center)
          (t                 . ivy-posframe-display-at-frame-center)))
  (setq ivy-posframe-hide-minibuffer t)
  )
