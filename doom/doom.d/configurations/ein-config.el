
(setq-default ein:output-area-inlined-images t)
(map!
  :n (kbd "M-e") 'ein:worksheet-insert-cell-above
  :n (kbd "M-DEL") 'ein:worksheet-delete-cell
  :n (kbd "M-RET") 'ein:worksheet-execute-all-cells-below
  :leader (:prefix "e"
            :desc "Save Notebooks" "s" #'ein:notebook-save-notebook-command
            :desc "Run All" "ra" #'ein:worksheet-execute-all-cells
            :desc "Run Below" "rn" #'ein:worksheet-execute-all-cells-below
            :desc "Run Above" "re" #'ein:worksheet-execute-all-cells-above
            :desc "Cell Type" "t" #'ein:worksheet-toggle-cell-type
            :desc "Insert Below" "in" #'ein:worksheet-insert-cell-below
            :desc "Insert Above" "ie" #'ein:worksheet-insert-cell-above
            :desc "Merge Cell" "m" #'ein:worksheet-merge-cell
            :desc "Merge Cell" "d" #'ein:worksheet-delete-cell
            )
  )
