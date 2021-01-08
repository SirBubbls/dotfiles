(setq aws-region "eu-central-1")

(defun authenticate-docker-aws ()
  (interactive)

  (setq docker-auth-command (shell-command-to-string (s-concat "aws ecr get-login --region " aws-region " --no-include-email")))
  (setq docker-auth-command (mapconcat 'identity (seq-drop (s-lines docker-auth-command) 1) "")) ;; delete later on
  (message (shell-command-to-string docker-auth-command))
)

(defun build-and-push ()
  (interactive)
  (if (file-exists-p (s-concat (file-name-directory (buffer-file-name)) "Dockerfile"))
      (progn
        (defvar x (shell-command-to-string "aws sts get-caller-identity"))
        (defvar info (json-parse-string (mapconcat 'identity (seq-drop (s-lines x) 1) "")))
        (defvar account (gethash "Account" info))

        ;; Build and Tag
        (setq build-and-push-repo (read-string "Enter Repo:"))
        (setq build-and-push-additional (read-string "Additional Tag:" "latest"))
        (setq build-and-push-tag (s-concat account ".dkr.ecr.eu-central-1.amazonaws.com/" build-and-push-repo ":" build-and-push-additional))
        (shell-command-to-string (s-concat "docker build . " "--tag " build-and-push-tag))

        ;; Pushing
        (setq build-and-push-msg (shell-command-to-string (s-concat "docker push " build-and-push-tag)))
        (print! build-and-push-msg)

        (message (s-concat "Image Pushed to " build-and-push-tag))
        )
    (message (s-concat "No Dockerfile in current directory: " (file-name-directory (buffer-file-name))))
    ))

(provide 'build-and-push)
