(add-hook
 'js-mode-hook
 #'(lambda ()
    (setq js-indent-level 2)))

(add-hook
 'typescript-mode-hook
 #'(lambda ()
    (setq typescript-indent-level 2)))

(provide 'setup-javascript)
