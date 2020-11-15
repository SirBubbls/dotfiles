;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Lucas Sas"
      user-mail-address "lucassas@live.de")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; M-x +pretty-code/install-patched-font
(setq doom-font (font-spec :family "Iosevka" :size (floor (/ (display-pixel-height) 72)) ))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-one-light)
(setq doom-modeline-height 7)

;; Display Battery
(display-battery-mode 1)  ;; TODO Only display battery when on battery power

(setq-default
 delete-by-moving-to-trash t                      ; Delete files to trash
 tab-width 4                                      ; Set width for tabs
 uniquify-buffer-name-style 'forward              ; Uniquify buffer names
 window-combination-resize t                      ; take new window space from all other windows (not just current)
 x-stretch-cursor t)

(setq org-directory "~/Dropbox/Org/")

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.


;; Quitting without Confirmation
(setq confirm-kill-processes nil)
(setq confirm-kill-emacs nil)

(after! typescript-mode
  (setq-default typescript-indent-level 2))

(add-hook 'org-mode-hook (lambda()
  (setq org-list-description-max-indent 5)
  (display-line-numbers-mode 0)
  (setq org-adapt-indentation nil)
))

(setq python-shell-interpreter "python")
;; Line Numbers
(add-hook 'display-line-numbers-mode-hook (lambda ()
  (set-face-foreground 'line-number-current-line "#f74b00")
  (set-face-foreground 'line-number "#404040")
))

(after! smartparens
  (add-to-list 'sp-ignore-modes-list 'nxml-mode)
)

;; Disable Prog Mode
(add-hook 'prog-mode-hook (lambda ()
  (line-number-mode 0)
  (column-number-mode 0)
))

(add-hook 'markdown-mode-hook (lambda ()
  (display-line-numbers-mode 0)
))


(after! counsel
  (setq counsel-search-engine 'google)
  )

;; (add-hook! ein:notebook-mode
;;   (load! "~/.doom.d/configurations/ein-config"))

(setq doom-modeline-github 't)

;; Keybindings
(load! "bindings")
(load! "colemak")

(toggle-frame-maximized)

;; System Specific Settings
(if (eq system-type 'darwin) (load! "darwin"))
(if (eq system-type 'ms-dos) (load! "msdos"))
(if (eq system-type 'gnu/linux) (load! "linux"))

;; Loading Personal Information like credentials
(if (file-exists-p "personal.el")
    (load! "personal"))

;; Load Dir Function
(defun load-directory (dir)
      (let ((load-it (lambda (f)
           (load! (concat (file-name-as-directory dir) f)))
         ))
  (mapc load-it (directory-files dir nil "\\.el$"))))

;; Load all configurations files from configurations folder
(load-directory "~/.doom.d/configurations")
(load-directory "~/.doom.d/scripts")

(yas-global-mode)
