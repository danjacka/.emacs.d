(use-package magit
  :defer t

  :custom
  (magit-revert-buffers 'silent)
  (magit-no-confirm '(stage-all-changes
		      unstage-all-changes))

  :bind (("C-x m" . magit-status))

  :config
  (wrap-fullscreen magit-status)
  (wrap-fullscreen magit-init))

(use-package git-timemachine
  :defer t
  :bind (("C-x v t" . git-timemachine)))

(provide 'setup-magit)

