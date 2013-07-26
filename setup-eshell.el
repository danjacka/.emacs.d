(defun eshell/poppy (&rest args)
  "Pop up a Python command in an inferior process buffer."
  (require 'python)
  (python-kill-python)
  (funcall 'run-python (apply 'eshell-flatten-and-stringify args) nil t))

(provide 'setup-eshell)
