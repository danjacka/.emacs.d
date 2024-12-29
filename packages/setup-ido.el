;; Interactively do things.
;; From inside an Ido menu, C-f drops to normal find-file. C-b drops to
;; ido-switch-buffer.
(use-package ido
  :unless my-try-new-things
  :init (ido-mode t)
  :bind (("C-x f" . 'recentf-ido-find-file)))

;; Smex adds an Ido-style menu to M-x
(use-package smex
  :unless my-try-new-things
  :init (smex-initialize)
  :bind (("M-x" . 'smex)
         ("M-X" . 'smex-major-mode-commands)
         ("C-c C-c M-x" . 'execute-extended-command)))

;; Anzu shows isearch match count
(use-package anzu
  :unless my-try-new-things
  :diminish anzu-mode
  :init (global-anzu-mode))

;; Implementation

(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

(provide 'setup-ido)
