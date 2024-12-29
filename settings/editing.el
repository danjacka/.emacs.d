;; Manipulating the contents of a buffer

;; Revert entire buffer without any fuss
(global-set-key (kbd "M-<escape>") (λ (revert-buffer t t)))

;; Join lines with ease
(global-set-key (kbd "M-^") (λ (join-line -1)))

;; Run at full power
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(provide 'editing)
