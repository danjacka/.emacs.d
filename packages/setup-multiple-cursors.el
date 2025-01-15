(use-package multiple-cursors
  :defer t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C-S-c C-a" . mc/edit-beginnings-of-lines)
         ("C-S-c C-e" . mc/edit-ends-of-lines)
         ("H-0" . mc/insert-numbers)))

(provide 'setup-multiple-cursors)
