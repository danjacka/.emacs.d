(add-hook
 'css-mode-hook
 #'(lambda ()
    (setq css-indent-offset 2)))

(provide 'setup-css)
