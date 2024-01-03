(require 'flycheck)

(setq flycheck-global-modes
      '(
        clojure-mode
        clojurescript-mode
        ))

(define-key flycheck-mode-map flycheck-keymap-prefix nil)
(setq flycheck-keymap-prefix (kbd "C-c f"))
(define-key flycheck-mode-map flycheck-keymap-prefix
            flycheck-command-map)

(provide 'setup-flycheck)
