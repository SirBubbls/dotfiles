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
(setq doom-font (font-spec :family "Iosevka" :size 22))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-molokai)

;; If you intend to use org, it is recommended you change this!
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



(after! typescript-mode
  (setq-default typescript-indent-level 2))

(after! org-mode
  (display-line-numbers-mode 0)
  (setq org-list-description-max-indent 5)
  (setq org-adapt-indentation nil))

(add-hook 'org-mode-hook (lambda()
  (setq org-list-description-max-indent 5)
  (display-line-numbers-mode 0)
  (setq org-adapt-indentation nil)
))

;; Line Numbers
(add-hook 'display-line-numbers-mode-hook (lambda ()
  (set-face-foreground 'line-number-current-line "#f74b00")
  (set-face-foreground 'line-number "#404040")
))


;; Disable Prog Mode
(add-hook 'prog-mode-hook (lambda ()
  (line-number-mode 0)
  (column-number-mode 0)
))

(add-hook 'markdown-mode-hook (lambda ()
  (display-line-numbers-mode 0)
))

(add-hook 'ein:notebook-mode-hook (lambda ()
  (setq-default ein:output-area-inlined-images t) ;; Inline Images
))

(setq doom-modeline-github 't)

;; Keybindings
(load! "bindings")
(load! "colemak")

(toggle-frame-maximized)

;; System Specific Settings
(if (eq 'system-type 'darwin) (load! "darwin"))
(if (eq 'system-type 'ms-dos) (load! "msdos"))
(if (eq 'system-type 'gnu/linux) (load! "linux"))

;; Loading Personal Information like credentials
(if (file-exists-p "personal.el")
    (load! "personal"))
