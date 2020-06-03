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
      (:after doc-view
       :map doc-view-mode-map (
                               :n "N" #'doc-view-next-page
                               :n "E" #'doc-view-previous-page
                               :n "n" #'doc-view-scroll-up-or-next-page
                               :n "e" #'doc-view-scroll-down-or-previous-page
                               ))
      (:after org
        :map evil-org-mode-map (
          :n "M-N" #'org-move-subtree-down
          :n "M-E" #'org-move-subtree-up
          :n "M-H" #'org-demote-subtree
          :n "M-I" #'org-promote-subtree
          :nv "h" #'evil-backward-char
          :nv "i" #'evil-forward-char
          :nv "e" #'evil-previous-line
          :nv "n" #'evil-next-line
        ))
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
(map! :leader :desc "Next Workspace" "]" (lambda! (+workspace/switch-right))
      :leader :desc "Previous Workspace" "[" (lambda! (+workspace/switch-left))
      :leader :desc "Open Eshell" "T" 'eshell)

(define-key evil-visual-state-map "n" 'evil-next-line)
(define-key evil-normal-state-map (kbd "M-/") 'comment-line)

(global-set-key (kbd "M--") 'doom/decrease-font-size)
(global-set-key (kbd "M-=") 'doom/increase-font-size)

(global-set-key (kbd "M-n") 'shrink-window)
(global-set-key (kbd "M-e") 'enlarge-window)

;; Iedit
(after! iedit
  (define-key evil-normal-state-map (kbd "<tab>") 'iedit-toggle-selection)
  (define-key evil-normal-state-map (kbd "k") 'iedit-next-occurrence)
  (define-key evil-normal-state-map (kbd "K") 'iedit-prev-occurrence)
  (define-key evil-normal-state-map (kbd "f") 'iedit-restrict-function)
  (define-key evil-normal-state-map (kbd "l") 'iedit-restrict-current-line)
  (define-key evil-normal-state-map (kbd "'") 'iedit-show/hide-unmatched-lines)
  (define-key! iedit-mode-occurrence-keymap "<tab>" 'iedit-toggle-selection))
