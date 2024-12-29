;; ;; split horizontally (left/right) by default
;; (setq split-height-threshold nil) ;; do not split windows vertically (up/down)
;; (let* ((screen-width (display-pixel-width))
;;        (ncol (if (> screen-width 3000) 200 150)))
;;   (setq split-width-threshold ncol)) ;; do not split windows less than ncol columns wide
;;                                     ;; => maintain 2 side-by-side windows

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Color all language features
(setq font-lock-maximum-decoration t)

;; Highlight current line
(global-hl-line-mode 1)

;; Include entire file path in title
(setq frame-title-format '(buffer-file-name "%f" ("%b")))

;; Be less obnoxious
(blink-cursor-mode -1)
(tooltip-mode -1)

;; Set theme
(use-package spacemacs-theme
  :defer 1 ;; prevents clobbering of X settings
  :config (load-theme 'spacemacs-dark)
  :custom (spacemacs-theme-org-height nil))

;; Don't beep. Just blink the modeline on errors.
(setq ring-bell-function (lambda ()
                           (invert-face 'mode-line)
			   (run-with-timer 0.05 nil 'invert-face 'mode-line)))

;; Highlight nasty trailing whitespace
(setq-default show-trailing-whitespace t)

(provide 'appearance)
