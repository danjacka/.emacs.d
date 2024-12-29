(use-package paredit
  :hook ((clojure-mode . paredit-mode)
         (cider-repl-mode . paredit-mode)
         (emacs-lisp-mode . paredit-mode)
         (lisp-data-mode . paredit-mode)
         (fennel-mode . paredit-mode))
  :diminish " ()"

  :config
  ;; Rebind nasty paredit keys
  (--each '(("M-s"         "s-s"         paredit-splice-sexp)
            ("M-<up>"      "s-<up>"      paredit-splice-sexp-killing-backward)
            ("M-<down>"    "s-<down>"    paredit-splice-sexp-killing-forward)
            ("C-<right>"   "s-<right>"   paredit-forward-slurp-sexp)
            ("C-<left>"    "s-<left>"    paredit-forward-barf-sexp)
            ("C-M-<left>"  "s-S-<left>"  paredit-backward-slurp-sexp)
            ("C-M-<right>" "s-S-<right>" paredit-backward-barf-sexp))
    (-let [(original replacement command) it]
      (define-key paredit-mode-map (read-kbd-macro original) nil)
      (define-key paredit-mode-map (read-kbd-macro replacement) command))))
