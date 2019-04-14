;; full screen magit-status
(defadvice magit-status (around magit-fullscreen activate)
  ad-do-it
  (delete-other-windows))

;; don't prompt me
(set-default 'magit-revert-buffers 'silent)
(set-default 'magit-no-confirm '(stage-all-changes
                                 unstage-all-changes))

;; full screen vc-annotate
(defun vc-annotate-quit ()
  "Restores the previous window configuration and kills the vc-annotate buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :vc-annotate-fullscreen))

(eval-after-load "vc-annotate"
  '(progn
     (defadvice vc-annotate (around fullscreen activate)
       (window-configuration-to-register :vc-annotate-fullscreen)
       ad-do-it
       (delete-other-windows))

     (define-key vc-annotate-mode-map (kbd "q") 'vc-annotate-quit)))

(provide 'setup-magit)
