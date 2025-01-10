(use-package magit
  :defer t

  :custom
  (magit-revert-buffers 'silent)
  (magit-no-confirm '(stage-all-changes
		      unstage-all-changes))

  :bind (("C-x m" . magit-status)
         (:map magit-status-mode-map
               ("q" . magit-quit)))

  :config
  (wrap-fullscreen magit-status)
  (wrap-fullscreen magit-init))

(use-package git-timemachine
  :defer t
  :bind (("C-x v t" . git-timemachine)))

(defun kill-magit-buffers ()
  (let ((current (current-buffer)))
    (dolist (buf (magit-mode-get-buffers))
      (unless (eq buf current)
        (kill-buffer buf)))))

(defun magit-quit ()
  "Like magit-mode-bury-buffer, but also restores the window
configuration stored by magit-status-fullscreen"
  (interactive)
  (let ((prev my/previous-window-configuration))
    (kill-magit-buffers)
    (funcall magit-bury-buffer-function 'kill-buffer)
    (when prev (register-val-jump-to prev nil))))

(provide 'setup-magit)

