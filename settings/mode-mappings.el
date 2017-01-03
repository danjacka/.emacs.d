;; Org-mode
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; HTML mode
(add-to-list 'auto-mode-alist '("\\.\\(html\\|pt\\|cpt\\|ss\\|ch\\)$" . html-mode))

;; Rainbow mode for RGB values in CSS
(add-hook 'css-mode-hook 'rainbow-mode)

(provide 'mode-mappings)
