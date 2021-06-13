(add-hook 'org-mode-hook
  '(lambda ()
     (turn-on-font-lock) ; not needed when global-font-lock-mode is on
     ; Disregard Org-mode's Shift+arrows keybindings
     (local-unset-key '[S-down])
     (local-unset-key '[S-left])
     (local-unset-key '[S-right])
     (local-unset-key '[S-up])))
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)

;; Date format for Calendar/Diary
(setq-default calendar-date-style 'european)

;; A watched pot never boils
(setq org-clock-clocked-in-display nil)

;; Babel runs source code blocks within an org file
;; (C-c C-c with point in the block)
(org-babel-do-load-languages
 'org-babel-load-languages
 (append org-babel-load-languages
         '((ditaa . t)
           (dot . t)
           (ledger . t )
           )))

; Do not prompt to confirm Babel evaluation
(setq org-confirm-babel-evaluate nil)

;; Export options
(setq org-export-with-section-numbers nil)
(setq org-html-include-timestamps nil)

(provide 'setup-org)

