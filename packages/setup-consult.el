;; Consult
;;
;; Provides search and navigation commands based on the Emacs completion
;; function completing-read. Completion allows you to quickly select an item
;; from a list of candidates.

(use-package consult
  :bind (("C-x f" . consult-recent-file)
         ("C-x C-i" . consult-imenu)
         ("C-x M-i" . consult-imenu-multi)
         ("C-x i" . consult-outline)
         ("M-g g" . consult-goto-line)
         ("M-g M-g" . consult-goto-line)))

(provide 'setup-consult)
