;; PHP for SilverStripe
(require 'php-mode)

;; Mode hook
(add-hook 'php-mode-hook
          (lambda ()
            (set (make-local-variable 'tab-width) 4)
            (set (make-local-variable 'c-basic-offset) 4)
            (set (make-local-variable 'indent-tabs-mode) t)))


(provide 'setup-php-mode)
