;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(typescript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (helm :variables
           helm-enable-auto-resize t
           helm-no-header t)
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t)
     emacs-lisp
     git
     (keyboard-layout :variables
                      kl-layout 'colemak-hnei
                      kl-disabled-configurations '(treemacs))
     docker
     (python :variables
             python-test-runner 'pytest
             python-backend 'lsp)
     html
     (c-c++ :variables
            c-c++-enable-clang-support t)
     spell-checking
     shell
     markdown
     ipython-notebook
     imenu-list
     org
     (treemacs :variables
               treemacs-use-git-mode 'deferred
               treemacs-use-collapsed-directories 3
               treemacs-use-filewatch-mode t)
     syntax-checking
     version-control
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(yasnippet-snippets
                                      drag-stuff
                                      doom-themes
                                      company-box
                                      all-the-icons)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(evil-mc)

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-but-keep-unused))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 2

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'random

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(doom-vibrant
                         doom-one-light
                         )

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme 'doom

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("Iosevka"
                               :size 18
                               :weight Regular
                               :width ultra-expanded
                               :powerline-scale 0.3)
   ;; The leader key
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout t

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state t

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.3

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 100

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 100

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."

  "Mode Line"
  ;; (setq doom-modeline-env-python-executable "python3")
  (setq doom-modeline-major-mode-color-icon t)
  (setq doom-modeline--battery-status t)
  (setq inhibit-compacting-font-caches t)
  ;; Performance Improvement for doom
  (setq doom-modeline-icon (display-graphic-p))
  ;; (Add-hook 'after-init-hook 'fancy-battery-mode)
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (with-eval-after-load "helm"
    (define-key helm-map (kbd "C-e") 'helm-previous-line)
    )
  (setq-default dotspacemacs-line-numbers '(:relative nil
                                                      :disabled-for-modes markdown-mode text-mode org-mode dired-mode
                                                      :size-limit-kb 500
                                                      ))
  ;; (with-eval-after-load "treemacs"
  ;;   (define-key evil-treemacs-state-map "e" 'treemacs-previous-line)
  ;;   (define-key evil-treemacs-state-map "n" 'treemacs-next-line)
  ;;   (define-key evil-treemacs-state-map (kbd "C-n") 'treemacs-next-project)
  ;;   (define-key evil-treemacs-state-map (kbd "C-e") 'treemacs-previous-project)
  ;;   )

  ;; Magit Keybindings
  ;; (with-eval-after-load "magit"
  ;;   (define-key magit-status-mode-map "e" 'evil-previous-visual-line)
  ;;   (define-key magit-status-mode-map "n" 'evil-next-visual-line)
  ;;   )

  (use-package doom-themes
    :config
    (load-theme 'doom-vibrant 1)
    (doom-themes-org-config)
    (setq doom-themes-treemacs-theme "doom-colors")
    (doom-themes-neotree-config)
    (doom-themes-visual-bell-config)
    (setq doom-themes-enable-bold t)
    (setq doom-themes-treemacs-theme "doom-colors")
    )

  "Latex"
  (setq org-preview-latex-image-directory "/tmp/latex/")
  (setq org-latex-create-formula-image-program 'dvisvgm)
  ;; (setq org-format-latex-options
  ;;       (plist-put org-format-latex-options :scale 0.75))
  (line-number-mode 0)
  (global-undo-tree-mode 0)
  (column-number-mode 0)
  (undo-tree-mode 0)
  (ws-butler-global-mode 0)
  (global-anzu-mode 0)
  (menu-bar-mode 0)
  (global-hl-todo-mode 0)
  (eyebrowse-mode 0)
  "Distraction Free Mode"
  (define-key global-map (kbd "<f12>") 'spacemacs/toggle-distraction-free)
  (setq writeroom-width 0.65)
  "Start Emacs Client in Fullscreen"
  (add-to-list 'default-frame-alist '(fullscreen . fullboth))
  "Fix for search functions"
  (define-obsolete-function-alias 'counsel-more-chars 'ivy-more-chars "0.10.0")
  "Code Blocks in ORG-Mode"
  (setq org-src-tab-acts-natively t)
  (spacemacs/toggle-vi-tilde-fringe-off)
  (set-fringe-mode 0)
  (set-face-background 'vertical-border "gray")
  (set-face-foreground 'vertical-border (face-background 'vertical-border))
  (global-company-mode t)
  (global-aggressive-indent-mode t)
  (setq dotspacemacs-mode-line-unicode-symbols nil)
  "Evil Search"
  (add-hook 'imenu-after-jump-hook 'reposition-window)
  (advice-add 'evil-ex-search-next :after
              (lambda (&rest x) (evil-scroll-line-to-center (line-number-at-pos))))
  (advice-add 'evil-ex-search-previous :after
              (lambda (&rest x) (evil-scroll-line-to-center (line-number-at-pos))))
  "Copy & Paste "
  (setq save-interprogram-paste-before-kill t)
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t)
  "Better Performance"
  (setq redisplay-dont-pause t)
  "Fix for symbolic link prompt"
  (setq vc-follow-symlinks nil)
  (spacemacs/toggle-highlight-current-line-globally-off)
  "qq now closes frame not emacs (for daemon mode)"
  (setq auto-save-default nil)

  (define-key global-map (kbd "M-i") 'er/expand-region)
  (define-key global-map (kbd "M-s") 'avy-goto-symbol-1)
  "Move Line & Region"
  (setq vim-style-visual-line-move-text t)
  (define-key evil-normal-state-map (kbd "M-n") (lambda () (interactive) (move-text-line-down) (indent-for-tab-command)))
  (define-key evil-normal-state-map (kbd "M-e") (lambda () (interactive) (move-text-line-up) (indent-for-tab-command)))
  (define-key evil-insert-state-map (kbd "M-e") (lambda () (interactive) (move-text-line-up) (indent-for-tab-command)))
  (define-key evil-insert-state-map (kbd "M-n") (lambda () (interactive) (move-text-line-down) (indent-for-tab-command)))
  (define-key evil-visual-state-map (kbd "M-n") 'drag-stuff-down)
  (define-key evil-visual-state-map (kbd "M-e") 'drag-stuff-up)
  "Imenu and Tab"
  (define-key evil-normal-state-map (kbd "<backtab>") 'imenu)
  (spacemacs/set-leader-keys "qq" 'spacemacs/frame-killer)
  "Zoom In/Out"
  (define-key evil-normal-state-map (kbd "C-=") 'zoom-frm-in)
  (define-key evil-normal-state-map (kbd "C--") 'zoom-frm-out)
  "Window Naviagation"
  (spacemacs/set-leader-keys "wn" 'evil-window-down)
  (spacemacs/set-leader-keys "wN" 'evil-window-move-very-bottom)
  (spacemacs/set-leader-keys "we" 'evil-window-up)
  (spacemacs/set-leader-keys "wE" 'evil-window-move-very-top)
  (spacemacs/set-leader-keys "wi" 'evil-window-right)
  (spacemacs/set-leader-keys "wI" 'evil-window-move-far-right)
  "I Menu"
  (define-key evil-normal-state-map (kbd "C-i") 'imenu)
  "Colemak Keybindings"
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
  ;; "Comment/Uncomment"
  (define-key evil-visual-state-map "\M-/" 'evilnc-comment-or-uncomment-lines)
  (define-key evil-normal-state-map (kbd "M-/") 'evilnc-comment-or-uncomment-lines)
  (define-key evil-visual-state-map "rr" 'replace-regexp)
  "Umlaute"
  (define-key key-translation-map (kbd "C-u") "ü")
  (define-key key-translation-map (kbd "C-S-U") "Ü")
  (define-key key-translation-map (kbd "C-o") "ö")
  (define-key key-translation-map (kbd "C-S-O") "Ö")
  (define-key key-translation-map (kbd "C-a") "ä")
  (define-key key-translation-map (kbd "C-S-A") "Ä")
  (define-key key-translation-map (kbd "C-s") "ß")
  (define-key evil-mode (kbd "C-;") 'flyspell-auto-correct-previous-word)

  "Windows Specific Settings"
  (if (eq system-type 'ms-dos)
      (setq projectile-git-submodule-command nil) "Fix for projectile under windows"
      (setq ispell-personal-dictionary "%APPDATA%/.emacs.d/personal_dict")

      "Windows Paths"
      (setq ispell-personal-dictionary "")
      (setenv "WORKON_HOME" "C:/Users/Lucas/Anaconda3/")

      "Proxy Settings"
      (setq url-proxy-services '(
                                 ("http" . "")
                                 ("https" . "")
                                 ("no_proxy" . "")
                                 ))
      (setenv "http_proxy" "")
      (setenv "https_proxy" "")
      (setenv "no_proxy" "127.0.0.1")
      )

  "MAC OS"
  (if (eq system-type 'darwin)
      (mac-mouse-wheel-mode 0)
    (setq ispell-personal-dictionary "~/.emacs.d/personal_dict")
    (setenv "LANG" "en_US, de_DE")
    (setq-default ispell-program-name "hunspell")
    (with-eval-after-load "ispell"
      (setq ispell-really-hunspell t)
      (setq ispell-program-name "hunspell")
      (setq ispell-dictionary "en_US,de_DE")
      ;; ispell-set-spellchecker-params has to be called
      ;; before ispell-hunspell-add-multi-dic will work
      (ispell-set-spellchecker-params)
      (ispell-hunspell-add-multi-dic "en_US,de_DE"))
    )

  (kill-buffer "*spacemacs*")
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(ansi-color-names-vector
     ["#313131" "#D9A0A0" "#8CAC8C" "#FDECBC" "#99DDE0" "#E090C7" "#A0EDF0" "#DCDCCC"])
   '(company-box-icons-alist (quote company-box-icons-all-the-icons))
   '(company-quickhelp-color-background "#4F4F4F")
   '(company-quickhelp-color-foreground "#DCDCCC")
   '(compilation-message-face (quote default))
   '(cursor-type (quote bar))
   '(custom-safe-themes
     (quote
      ("1d50bd38eed63d8de5fcfce37c4bb2f660a02d3dff9cbfd807a309db671ff1af" "07e3a1323eb29844e0de052b05e21e03ae2f55695c11f5d68d61fb5fed722dd2" "615123f602c56139c8170c153208406bf467804785007cdc11ba73d18c3a248b" "fa3bdd59ea708164e7821574822ab82a3c51e262d419df941f26d64d015c90ee" "4daff0f7fb02c7a4d5766a6a3e0931474e7c4fd7da58687899485837d6943b78" "1ed5c8b7478d505a358f578c00b58b430dde379b856fbcb60ed8d345fc95594e" "0809c08440b51a39c77ec5529f89af83ab256a9d48107b088d40098ce322c7d8" "e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" "51956e440cec75ba7e4cff6c79f4f8c884a50b220e78e5e05145386f5b381f7b" "a2cde79e4cc8dc9a03e7d9a42fabf8928720d420034b66aecc5b665bbf05d4e9" default)))
   '(evil-want-Y-yank-to-eol nil)
   '(fci-rule-color "#5E5E5E")
   '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
   '(highlight-tail-colors
     (quote
      (("#3C3D37" . 0)
       ("#679A01" . 20)
       ("#4BBEAE" . 30)
       ("#1DB4D0" . 50)
       ("#9A8F21" . 60)
       ("#A75B00" . 70)
       ("#F309DF" . 85)
       ("#3C3D37" . 100))))
   '(linum-format " %7i ")
   '(magit-diff-use-overlays nil)
   '(nrepl-message-colors
     (quote
      ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
   '(package-selected-packages
     (quote
      (helm-lsp counsel swiper ivy flyspell-correct-helm flyspell-correct drag-stuff helm-xref helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-org helm-mode-manager helm-gitignore helm-git-grep helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag ace-jump-helm-line company-box tide typescript-mode yaml-mode utop tuareg caml seeing-is-believing rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocopfmt rubocop rspec-mode robe rbenv rake ocp-indent ob-elixir mvn minitest meghanada maven-test-mode lsp-java groovy-mode groovy-imports pcache gradle-mode flycheck-ocaml merlin flycheck-mix flycheck-credo emojify emoji-cheat-sheet-plus dune company-lsp company-emoji chruby bundler inf-ruby auto-complete-rst alchemist elixir-mode tern nodejs-repl livid-mode skewer-mode js2-refactor multiple-cursors js2-mode js-doc import-js grizzl helm-gtags helm helm-core ggtags dap-mode bui tree-mode counsel-gtags add-node-modules-path wc-mode lsp-ui lsp-treemacs lsp-python-ms python lsp-mode dash-functional git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter browse-at-remote diff-hl evil-mc zenburn-theme zen-and-art-theme yasnippet-snippets yapfify xterm-color ws-butler writeroom-mode winum white-sand-theme which-key wgrep web-mode web-beautify vterm volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme treemacs-projectile treemacs-magit treemacs-evil toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit symon symbol-overlay sunny-day-theme sublime-themes subatomic256-theme subatomic-theme string-inflection spaceline-all-the-icons spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smex smeargle slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme restart-emacs request rebecca-theme rainbow-delimiters railscasts-theme pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme prettier-js popwin planet-theme pippel pipenv pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el password-generator paradox overseer orgit organic-green-theme org-projectile org-present org-pomodoro org-mime org-download org-cliplink org-bullets org-brain open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme nameless mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-svn magit-gitflow madhat2r-theme macrostep lush-theme lorem-ipsum live-py-mode link-hint light-soap-theme kaolin-themes jbeans-theme jazz-theme ivy-yasnippet ivy-xref ivy-purpose ivy-hydra ir-black-theme inkpot-theme indent-guide importmagic impatient-mode hybrid-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-make hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md gandalf-theme fuzzy font-lock+ flyspell-popup flyspell-correct-ivy flycheck-pos-tip flycheck-package flx-ido flatui-theme flatland-theme fill-column-indicator farmhouse-theme fancy-battery eziam-theme eyebrowse expand-region exotica-theme evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav editorconfig dumb-jump dracula-theme dotenv-mode doom-themes doom-modeline dockerfile-mode docker django-theme diminish devdocs define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme counsel-projectile counsel-css company-web company-statistics company-quickhelp company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme clean-aindent-mode chocolate-theme cherry-blossom-theme centered-cursor-mode busybee-theme bubbleberry-theme blacken birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme ace-link ac-ispell)))
   '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
   '(pos-tip-background-color "#FFFACE")
   '(pos-tip-foreground-color "#272822")
   '(pytest-global-name "python -m pytest")
   '(vc-annotate-background "#202020")
   '(vc-annotate-color-map
     (quote
      ((20 . "#C99090")
       (40 . "#D9A0A0")
       (60 . "#ECBC9C")
       (80 . "#DDCC9C")
       (100 . "#EDDCAC")
       (120 . "#FDECBC")
       (140 . "#6C8C6C")
       (160 . "#8CAC8C")
       (180 . "#9CBF9C")
       (200 . "#ACD2AC")
       (220 . "#BCE5BC")
       (240 . "#CCF8CC")
       (260 . "#A0EDF0")
       (280 . "#79ADB0")
       (300 . "#89C5C8")
       (320 . "#99DDE0")
       (340 . "#9CC7FB")
       (360 . "#E090C7"))))
   '(vc-annotate-very-old-color "#E090C7")
   '(weechat-color-list
     (quote
      (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(company-box-candidate ((t (:foreground "white" :height 1))))
   '(company-box-scrollbar ((t (:inherit company-box-selection)))))
  )
