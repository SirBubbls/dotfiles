;;; ~/Dropbox/Configurations/dotfiles/doom/doom.d/configurations/clang.el -*- lexical-binding: t; -*-


;; Call this function to link OSX C header to clang completion
(defun irony-link-macos ()
  (shell-command-to-string "echo | clang -x c++ -v -E - 2>&1 | sed -n '/^#include </,/^End/s|^[^/]*\([^ ]*/include[^ ]*\).*$|-I\1|p' >> ~/.clang_complete"))

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
