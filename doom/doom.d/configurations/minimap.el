;;; ~/Dropbox/Configurations/dotfiles/doom/doom.d/configurations/minimap.el -*- lexical-binding: t; -*-

(require 'sublimity)
(require 'sublimity-map) ;; experimental
(sublimity-mode 1)
(sublimity-map-set-delay 1)
(setq sublimity-map-size 16)
(setq sublimity-map-fraction 0.3)
(setq sublimity-map-text-scale -8)
;; Show Map
(sublimity-map-show)
