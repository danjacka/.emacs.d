;; Nice font
(set-face-attribute 'default nil :font "DejaVu Sans Mono-10")

;; Turn off unnecessary UI elements
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Load themes
(load-theme 'zenburn t)

;; Highlight matching brackets
(show-paren-mode t)

;; Big letters please urchins
(defun urchin-mode ()
  (interactive)
  (setq cursor-type nil)
  (text-scale-increase 16))

;; Unclutter the modeline
(require 'diminish)
(eval-after-load "anzu" '(diminish 'anzu-mode))

(provide 'appearance)
