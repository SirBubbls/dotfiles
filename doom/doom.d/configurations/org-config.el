(after! org
  ;; Disable line numbers
  (display-line-numbers-mode 0)

  ;; Indentation
  (setq org-list-description-max-indent 5)
  (setq org-adapt-indentation nil)

  ;; Show inline images by default & set image size
  (org-display-inline-images t t)
  (setq org-image-actual-width '(400))
  (setq org-use-property-inheritance t)

  ;; Org export to pdf settings with bibtex
  (setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "bibtex %b"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

  ;; Citations in org mode
  (require 'org-ref)
  (setq org-ref-completion-library 'org-ref-ivy-cite)
  (setq org-latex-prefer-user-labels t)

  ;; Org mode auto remove intermediate files after export
  (setq org-latex-logfiles-extensions (quote ("xml" "bak" "lof" "lot" "tex" "tex~" "aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg" "brf" "fls" "entoc" "ps" "spl" "bbl")))
  (org-indent-mode 1)
)

(after! ob-mermaid
  (setq ob-mermaid-cli-path "/usr/local/bin/mmdc")
  )
