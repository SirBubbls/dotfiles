;;; ~/Dropbox/Configurations/dotfiles/doom/doom.d/configurations/ignore-files.el -*- lexical-binding: t; -*-

(with-eval-after-load 'counsel
  (setq counsel-find-file-ignore-regexp "\\.out\\|\\.o\\|\\.DS_Store\\|\\.gtm\\'"))

(with-eval-after-load 'treemacs
  (defun treemacs-custom-filter (file _)
    (or (s-ends-with? ".o" file)
        (s-ends-with? "__pycache__" file)
        (s-ends-with? ".gtm" file)
        (s-ends-with? ".ob-jupyter" file)
        (s-ends-with? ".class" file)
        (s-ends-with? ".ipynb_checkpoints" file)
        (s-ends-with? "__pycache__" file)
        (s-ends-with? ".DS_Store" file)
        (s-ends-with? ".pyc" file)
        (s-ends-with? ".out" file)))
  (push #'treemacs-custom-filter treemacs-ignored-file-predicates)
  (setq-default treemacs-show-hidden-files t)
  (setq-default treemacs-project-follow-cleanup t)
  (setq-default treemacs-git-mode 'deferred))

(with-eval-after-load 'counsel
  (setq counsel-find-file-ignore-regexp (regexp-opt '(".DS_Store"
                                                      ".git"
                                                      ".gtm"
                                                      "__pycache__"
                                                      ".lock"
                                                      ".class"
                                                      ".pyc"
                                                      ".jar"
                                                      ".ob-jupyter"
                                                      ".ipynb_checkpoints"))))
