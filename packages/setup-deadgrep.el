;; Deadgrep
;;
;; The fast, beautiful text search that your Emacs deserves.

(use-package deadgrep
  :bind (("M-s s" . deadgrep)
         (:map deadgrep-mode-map
               ("q" . deadgrep-quit)))

  :config
  (wrap-fullscreen deadgrep))

;; Implementation

(defun deadgrep-quit ()
  (interactive)
  (let ((prev my/previous-window-configuration))
    (quit-window)
    (when prev (register-val-jump-to prev nil))))

(provide 'setup-deadgrep)
