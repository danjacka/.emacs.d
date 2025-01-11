;; Moving the cursor around

;; Navigate between windows using shift + arrow key
(global-set-key (kbd "S-<right>") 'windmove-right)
(global-set-key (kbd "S-<left>") 'windmove-left)
(global-set-key (kbd "S-<up>") 'windmove-up)
(global-set-key (kbd "S-<down>") 'windmove-down)

;: Keep them windows nice and balanced
(global-set-key (kbd "C-x 0") 'my/delete-window)
(global-set-key (kbd "C-x 3") 'my/split-window-right)

;; Implementations

(use-package windmove)

(defun my/delete-window ()
  (interactive)
  (delete-window)
  (balance-windows))

(defun my/split-window-right ()
  (interactive)
  (split-window-right)
  (windmove-right)
  (balance-windows))

(provide 'navigation)
