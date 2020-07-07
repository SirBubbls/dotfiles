;;; ~/Dropbox/Configurations/dotfiles/doom/doom.d/configurations/yasnippet-integration.el -*- lexical-binding: t; -*-

(global-company-mode)
(after! company
  (setq company-transformers '(company-sort-by-occurrence))
  (defvar company-mode/enable-yas t)
  (defun company-mode/backend-with-yas (backend)
    (if (and (listp backend) (member 'company-yasnippet backend))
        backend
      (append (if (consp backend) backend (list backend))
              '(:with company-yasnippet))))
  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
  )

(set-file-template! "Readme\\.org" :trigger "__readme")
(set-file-template! "README\\.org" :trigger "__readme")
(set-file-template! ".*Presentation.*\\.org" :trigger "__presentation")
(set-file-template! ".*presentation.*\\.org" :trigger "__presentation")
