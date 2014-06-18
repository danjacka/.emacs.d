(require 'paredit)

(add-hook 'clojure-mode-hook (lambda () (paredit-mode 1)))
(add-hook 'cider-repl-mode-hook (lambda () (paredit-mode 1)))
(add-hook 'emacs-lisp-mode-hook (lambda () (when (not (equal major-mode 'lisp-interaction-mode)) (paredit-mode 1))))

(provide 'setup-paredit)
