(use-package org
  :ensure nil
  :defer t

  :custom
  (calendar-date-style 'european)
  (org-clock-clocked-in-display nil)
  (org-html-include-timestamps nil)

  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture))

  :config
  ;; disregard Org-Mode's Shift+arrows keys
  (unbind-key "S-<up>" org-mode-map)
  (unbind-key "S-<down>" org-mode-map)
  (unbind-key "S-<left>" org-mode-map)
  (unbind-key "S-<right>" org-mode-map)
  ;; keep C-' for expand-region
  (unbind-key "C-'" org-mode-map)

  (org-babel-do-load-languages
   'org-babel-load-languages
   (append org-babel-load-languages
           '((ditaa . t)
             (dot . t)
             (plantuml . t)))))

(use-package org-roam
    :after org
    :defer t
    :bind (("C-c n l" . org-roam-buffer-toggle)
           ("C-c n f" . org-roam-node-find)
           ("C-c n i" . org-roam-node-insert))
    :config
    (org-roam-db-autosync-mode))

(provide 'setup-org-mode)
