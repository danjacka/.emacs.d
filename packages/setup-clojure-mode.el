(use-package clojure-mode
  :custom
  ;; Ignore comment wrappers for defun-level commands
  (clojure-toplevel-inside-comment-form t))

(provide 'setup-clojure-mode)
