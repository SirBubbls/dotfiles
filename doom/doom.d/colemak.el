;;; ~/Dropbox/Configurations/dotfiles/doom/doom.d/colemak.el -*- lexical-binding: t; -*-


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
(define-key key-translation-map (kbd "C-u") "ü")
(define-key key-translation-map (kbd "C-S-U") "Ü")
(define-key key-translation-map (kbd "C-o") "ö")
(define-key key-translation-map (kbd "C-S-O") "Ö")
(define-key key-translation-map (kbd "C-a") "ä")
(define-key key-translation-map (kbd "C-S-A") "Ä")
(define-key key-translation-map (kbd "C-s") "ß")

(map! :leader (:prefix "w"
                :desc "evil-window-right" "i" #'evil-window-right
                :desc "evil-window-down" "n" #'evil-window-down
                :desc "evil-window-down" "e" #'evil-window-up
                :desc "evil-window-up" "u" #'evil-window-up))
