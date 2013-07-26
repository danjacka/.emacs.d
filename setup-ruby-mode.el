;; Stolen from https://github.com/tobiassvn/bundler.el
(defun bundle-console ()
  "Run an inferior Ruby process in the context of the current bundle."
  (interactive)
  (run-ruby "bundle console"))

(provide 'setup-ruby-mode)
