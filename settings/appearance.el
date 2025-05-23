;; split horizontally (left/right) by default
(setq split-height-threshold nil) ;; do not split windows vertically (up/down)
(let* ((screen-width (display-pixel-width))
       (ncol (if (> screen-width 3000) 200 150)))
  (setq split-width-threshold ncol)) ;; do not split windows less than ncol columns wide
                                    ;; => maintain 2 side-by-side windows

;; Load themes
(setq-default spacemacs-theme-org-height nil)
(load-theme 'spacemacs-dark t)

;; Blink the modeline on errors.
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

(provide 'appearance)
