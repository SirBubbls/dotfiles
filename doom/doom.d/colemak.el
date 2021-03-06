;;; ~/Dropbox/Configurations/dotfiles/doom/doom.d/colemak.el -*- lexical-binding: t; -*-

;; Evil Movement
(define-key evil-normal-state-map (kbd "<backtab>") 'imenu)
(define-key evil-normal-state-map (kbd "C-i") 'imenu)
(define-key evil-normal-state-map "u" 'evil-insert)
(define-key evil-normal-state-map "n" 'evil-next-line)
(define-key evil-normal-state-map "e" 'evil-previous-line)
(define-key evil-normal-state-map "i" 'forward-char)
(define-key evil-visual-state-map "i" 'forward-char)
(define-key evil-visual-state-map "n" 'evil-next-line)
(define-key evil-visual-state-map "e" 'evil-previous-line)
(define-key evil-visual-state-map "i" 'forward-char)
(define-key evil-normal-state-map "k" 'evil-ex-search-previous)
(define-key evil-normal-state-map "K" 'evil-ex-search-next)
(define-key evil-normal-state-map "F" 'evil-forward-WORD-end)
(define-key evil-normal-state-map "f" 'evil-forward-word-end)
(define-key evil-visual-state-map "F" 'evil-forward-WORD-end)
(define-key evil-visual-state-map "f" 'evil-forward-word-end)
(define-key evil-normal-state-map "I" 'evil-window-bottom)
(define-key evil-visual-state-map "I" 'evil-window-bottom)
(define-key evil-normal-state-map "N" 'evil-join)

(map! :n "h" 'evil-backward-char
      :n "n" 'evil-next-line
      :n "e" 'evil-previous-line
      :n "i" 'evil-forward-char)
;; drag-stuff
(define-key evil-visual-state-map (kbd "M-n") 'drag-stuff-down)
(define-key evil-visual-state-map (kbd "M-e") 'drag-stuff-up)
(define-key! evil-normal-state-map (kbd "M-e") 'drag-stuff-up)
(define-key! evil-normal-state-map (kbd "M-n") 'drag-stuff-down)

;; Special Symbols
(define-key key-translation-map (kbd "M-u") "ü")
(define-key key-translation-map (kbd "M-U") "Ü")
(define-key key-translation-map (kbd "M-o") "ö")
(define-key key-translation-map (kbd "M-O") "Ö")
(define-key key-translation-map (kbd "M-a") "ä")
(define-key key-translation-map (kbd "M-A") "Ä")
(define-key key-translation-map (kbd "M-S") "ß")
(define-key key-translation-map (kbd "M-s") "ß")


;; Treemacs
(after! treemacs
  (define-key evil-treemacs-state-map "S" 'treemacs-switch-workspace)
  (define-key evil-treemacs-state-map "n" 'treemacs-next-line)
  (define-key evil-treemacs-state-map "e" 'treemacs-previous-line)
  (define-key treemacs-mode-map "n" 'treemacs-next-line)
  (define-key treemacs-mode-map "e" 'treemacs-previous-line))

;; IVY
(with-eval-after-load "ivy"
  (define-key ivy-mode-map (kbd "C-e") 'ivy-previous-line))

(map! :leader (:prefix "w"
                :desc "evil-window-right" "i" #'evil-window-right
                :desc "evil-window-down" "n" #'evil-window-down
                :desc "evil-window-down" "e" #'evil-window-up
                :desc "evil-window-up" "u" #'evil-window-up)
      :leader (:prefix "s"
                :desc "i-edit" "e" #'iedit-mode)
      :leader (:prefix "f"
                :desc "treemacs" "t" #'treemacs))

;; Magit
;; TODO cleanup
(after! magit-gitflow
  (define-key evil-motion-state-map "n" 'evil-next-visual-line)
  (define-key evil-motion-state-map "e" 'evil-previous-line)
  (define-key evil-normal-state-map "e" 'evil-previous-line)
  (evil-define-key 'visual magit-mode-map "n" 'evil-next-visual-line)
  (evil-define-key 'normal magit-mode-map "n" 'evil-next-visual-line)
  (evil-define-key 'normal evil-magit-state magit-mode-map "n" 'evil-next-visual-line)
  (evil-define-key 'normal evil-magit-state magit-mode-map "e" 'evil-previous-visual-line)
  (unbind-key "e" magit-mode-map)
  (unbind-key "n" magit-mode-map)
  )

(after! evil-org-agenda
  (define-key evil-motion-state-map "n" 'org-agenda-next-line)
  (define-key evil-motion-state-map "e" 'org-agenda-previous-line)
  (evil-define-key evil-org-agenda-mode evil-org-agenda-mode-map "n" 'org-agenda-next-line)
  (evil-define-key evil-magit-state magit-mode-map "e" 'org-agenda-previous-line))
