;; Workaround: csharp-mode assumes a variable flymake-mode exists
(setq flymake-mode nil)

;; Mode hook
(add-hook 'csharp-mode-hook
          (lambda ()
            (set (make-local-variable 'c-basic-offset) 4)
            (c-set-offset 'substatement-open 0)
            (subword-mode 1)))

(provide 'setup-csharp)
