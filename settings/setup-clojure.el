;; https://github.com/clojure/clojurescript/wiki/Emacs-%26-Inferior-Clojure-Interaction-Mode
(defun cljs-node-repl ()
  (interactive)
  (run-clojure "lein trampoline run -m clojure.main repl.clj"))

(add-hook 'cider-mode-hook #'eldoc-mode)

(provide 'setup-clojure)
