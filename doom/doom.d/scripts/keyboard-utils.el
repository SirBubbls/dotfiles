;;; keyboard-utils-u.el -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 Lucas Sas
;;
;; Author: Lucas Sas <http://github/lucas>
;; Maintainer: Lucas Sas <lucassas@live.de>
;; Created: November 15, 2020
;; Modified: November 15, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/lucas/keyboard
;; Package-Requires: ((emacs 28.0.50) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;
;;
;;; Code:


(defun switch-option-left-right ()
    "Switch left and right option keys.

     On some external keyboards the left and right option keys are swapped,
     this command switches the keys so that they work as expected."
    (interactive)
    (let ((current-left  mac-option-modifier)
          (current-right mac-right-option-modifier))
      (setq mac-option-modifier       current-right
            mac-right-option-modifier current-left)))


(defun remap-modifiers-for-external-kb ()
  (if (eq system-type 'darwin)
      (progn
        (setq mac-control-modifier 'control)
        (setq mac-right-control-modifier 'left)
        (setq mac-command-modifier 'super)
        (setq mac-right-command-modifier 'left)
        (setq mac-option-modifier 'super)
        (setq mac-right-option-modifier 'none)
        (setq mac-function-modifier 'hyper)
        )
    )
  )

(defun external-keyboard-connected ()
  (if (executable-find "lsusb")
      (progn
        (setq test (split-string (shell-command-to-string "lsusb") "\n" t))
        (dolist (device test)
          (if (and (s-contains-p "keyboard" device :ignore-case) (not (s-contains-p "apple" device :ignore-case)) )
              (progn
                (message (s-concat "External Keyboard Detected: " device))
                (remap-modifiers-for-external-kb)
                (switch-option-left-right)
                )
            )
          )
       )
  (message "Error: lsusb not found"))
)

;;(external-keyboard-connected)


(provide 'keyboard-utils)
;;; keyboard-utils ends here
