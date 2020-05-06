(if (executable-find "gtm")
    ;; Git Time Metric record after save
    (add-hook 'after-save-hook 'git-time-metric-record))
