;;; ~/Dropbox/Configurations/dotfiles/doom/doom.d/experimental/binding.el -*- lexical-binding: t; -*-

(map!
 :leader
 ;; Eshell
 :desc "Open Eshell" "T" #'eshell
 :desc "New REST Client Buffer" "b R" (lambda!()
                                       (let ((buffer (generate-new-buffer "*REST*")))
                                        (set-window-buffer nil buffer)
                                        (with-current-buffer buffer
                                        (restclient-mode))))
 ;; Treemacs Settings
 :after treemacs(
  :leader
  :desc "workspace" "p w" #'treemacs-switch-workspace
  :desc "workspace" "p W" #'treemacs-edit-workspaces
 )
 )
