;;; ~/Dropbox/Configurations/dotfiles/doom/doom.d/configurations/clang.el -*- lexical-binding: t; -*-


(setq irony-additional-clang-options "")

;; Call this function to link OSX C header to clang completion
(defun irony-link-macos ()
    (shell-command-to-string "echo | clang -x c++ -v -E - 2>&1 | sed -n '/^#include </,/^End/s|^[^/]*\([^ ]*/include[^ ]*\).*$|-I\1|p' >> ~/.clang_complete"))
