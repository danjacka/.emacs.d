;; Turn off unnecessary UI elements
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Load themes
(setq-default spacemacs-theme-org-height nil)
(load-theme 'spacemacs-dark t)

;; Don't beep. Just blink the modeline on errors.
(setq visible-bell nil)
(setq ring-bell-function (lambda ()
                           (invert-face 'mode-line)
(run-with-timer 0.05 nil 'invert-face 'mode-line)))

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

;; Set font height
(set-face-attribute 'default nil :height 140)

(provide 'appearance)
