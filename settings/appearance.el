;; Turn off unnecessary UI elements
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Load themes
(load-theme 'zenburn t)

;; Highlight current line
(global-hl-line-mode 1)

;; Highlight matching brackets
(show-paren-mode t)

;; Don't defer screen updates when performing operations
(setq redisplay-dont-pause t)

;; Big letters please urchins
(defun urchin-mode ()
  (interactive)
  (setq cursor-type 'bar)
  (text-scale-increase 11)
  (put 'erase-buffer 'disabled nil)
  (local-set-key (kbd "ESC") 'erase-buffer))

;; Unclutter the modeline
(require 'diminish)
(eval-after-load "anzu" '(diminish 'anzu-mode))
(eval-after-load "hi-lock" '(diminish 'hi-lock-mode))

(provide 'appearance)
