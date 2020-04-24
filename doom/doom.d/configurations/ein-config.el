
(setq-default ein:output-area-inlined-images t)
(map!
  :n (kbd "M-e") 'ein:worksheet-insert-cell-above
  :n (kbd "M-DEL") 'ein:worksheet-delete-cell
  :n (kbd "M-RET") 'ein:worksheet-execute-all-cells-below
  :leader (:prefix "e"
            :desc "Save Notebooks" "s" #'ein:notebook-save-notebook-command
            :desc "Run All" "ra" #'ein:worksheet-execute-all-cellS
            :desc "Run Below" "rr" #'ein:worksheet-execute-all-cellS
            :desc "Run Below" "rr" #'ein:worksheet-execute-all-cellS
            )
  )
