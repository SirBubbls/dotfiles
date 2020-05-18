;; Make ivy occur writeable by default
(after! 'ivy-occur-mode-hook
  (ivy-wgrep-change-to-wgrep-mode))
