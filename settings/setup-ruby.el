;; Stolen from https://github.com/tobiassvn/bundler.el
(defun bundle-console ()
  "Run an inferior Ruby process in the context of the current bundle."
  (interactive)
  (run-ruby "bundle console"))

;; Recognise rbenv Rubies
(setq rbenv-show-active-ruby-in-modeline nil)
(global-rbenv-mode)

(provide 'setup-ruby)
