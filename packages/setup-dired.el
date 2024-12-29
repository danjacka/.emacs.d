; enable loading new directory in the existing dired buffer
(put 'dired-find-alternate-file 'disabled nil)

(add-hook
 'dired-mode-hook
 #'(lambda ()
    ; change buffer name to start with '*dired*'
    (let ((name (buffer-name)))
      (if (not (string-match  "^\\*dired\\*\\ " name))
          (rename-buffer (concat "*dired* " name) t)))))

(provide 'setup-dired)
