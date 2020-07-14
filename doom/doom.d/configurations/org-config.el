(after! org
  (setq sublimity-disabled-minor-modes '(cua--rectangle multiple-cursors-mode org-tree-slide-mode))

  ;; Disable line numbers
  (display-line-numbers-mode 0)

  ;; Indentation
  (setq org-list-description-max-indent 5)
  (setq org-adapt-indentation nil)

  ;; Show inline images by default & set image size
  (org-display-inline-images t t)
  (setq org-image-actual-width '(400))
)
