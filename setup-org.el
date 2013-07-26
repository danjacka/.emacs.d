(add-hook 'org-mode-hook
  '(lambda ()
     (turn-on-font-lock) ; not needed when global-font-lock-mode is on
     ; Disregard Org-mode's Shift+arrows keybindings
     (local-unset-key '[S-down])
     (local-unset-key '[S-left])
     (local-unset-key '[S-right])
     (local-unset-key '[S-up])))
(global-set-key "\C-ca" 'org-agenda)

;; Date format for Calendar/Diary
(setq-default calendar-date-style 'european)

;; Export options
(setq org-export-with-section-numbers nil)
(setq org-html-include-timestamps nil)

(provide 'setup-org)

