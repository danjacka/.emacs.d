;; Turn off unnecessary UI elements
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Load themes
(setq-default spacemacs-theme-org-height nil)
(load-theme 'spacemacs-dark t)

;; Highlight current line
(global-hl-line-mode 1)

;; Highlight matching brackets
(show-paren-mode t)

;; Don't defer screen updates when performing operations
(setq redisplay-dont-pause t)

;; Unclutter the modeline
(require 'diminish)
(eval-after-load "anzu" '(diminish 'anzu-mode))
(eval-after-load "hi-lock" '(diminish 'hi-lock-mode))

(provide 'appearance)
