;;; ~/.doom.d/bindings.el -*- lexical-binding: t; -*-
(when (eq 'system-type 'darwin)
  (setq mac-command-modifier 'meta))

(map! :n "t" 'evil-insert
      :n "T" 'evil-insert-line
      :n "l" 'evil-open-below
      :n "L" 'evil-open-above
      :nv "T" 'project-eshell
      :n (kbd "s-t") #'eshell
      :nv (kbd "s-t") #'eshell
      :n (kbd "s-c") 'recenter
      :nv (kbd "s-c") 'recenter
      :n "f" 'evil-ex-search-next
      :n "F" 'evil-ex-search-previous
      :n "h" 'evil-backward-char
      :n "n" 'evil-next-line
      :n (kbd "s-s") 'counsel-search
      :n "e" 'evil-previous-line
      :nv (kbd "s-i") #'indent-region
      :n "i" 'evil-forward-char
      :n "u" 'evil-insert
      :n (kbd "s-m") #'evil-make
      :n (kbd "s-b") 'evil-switch-to-windows-last-buffer
      (:after iedit
       :n "k" #'iedit-next-occurrence
       :n "K" #'iedit-prev-occurrence
       :n "f" #'iedit-restrict-function
       :n "l" #'iedit-restrict-current-line
       :n "'" #'iedit-show/hide-unmatched-lines
       :n "t" #'iedit-toggle-selection
       )
      (:leader
       (:prefix "b"
        :desc "List Buffers" "b" #'ivy-switch-buffer)
       (:prefix "i"
        :desc "Insert Snippet" "s" #'ivy-yasnippet)
       (:prefix "q"
        :desc "Kill Frame" "q" #'delete-frame)
       )
      (:after doc-view
       :map doc-view-mode-map (
                               :n "N" #'doc-view-next-page
                               :n "E" #'doc-view-previous-page
                               :n "n" #'doc-view-scroll-up-or-next-page
                               :n "e" #'doc-view-scroll-down-or-previous-page
                               ))
      (:after calc
       :map calc-mode-map (
                           :n "n" #'next-line
                           :n "e" #'previous-line
                           )
       )
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
      (:after smerge-mode
       :map smerge-mode-map(
          :n (kbd "M-h") 'smerge-keep-other
          :n (kbd "M-i") 'smerge-keep-current
          :n (kbd "M-n") 'smerge-next
          :n (kbd "M-e") 'smerge-prev
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
      )

(define-key evil-visual-state-map "n" 'evil-next-line)
(define-key evil-normal-state-map (kbd "M-/") 'comment-line)

(global-set-key (kbd "M--") 'doom/decrease-font-size)
(global-set-key (kbd "M-=") 'doom/increase-font-size)

(global-set-key (kbd "M-n") 'shrink-window)
(global-set-key (kbd "M-e") 'enlarge-window)
