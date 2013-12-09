(defun eshell/poppy (&rest args)
  "Pop up a Python command in an inferior process buffer."
  (require 'python)
  (python-kill-python)
  (funcall 'run-python (apply 'eshell-flatten-and-stringify args) nil t))

;; Note: 'poppy ./bin/instance fg' sometimes fails with "Searching for program:
;; no such file or directory, ./bin/instance". The problem is in function
;; comint-exec, where the with-current-buffer macro switches to the current
;; *Python* buffer. That buffer's default-directory variable is used as the
;; *current working directory.

(provide 'setup-eshell)
