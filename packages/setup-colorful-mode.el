;; -*- lexical-binding: nil -*-
;; colorful-mode
;;
;; Highlights colour formats such as hex and oklch.
(use-package colorful-mode
  :diminish
  :hook (css-mode css-ts-mode)
  :custom
  (css-fontify-colors nil))

(provide 'setup-colorful-mode)
