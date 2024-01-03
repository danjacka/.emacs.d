
(require 'clojure-mode)
(require 'clojure-mode-extra-font-locking)

;; Lint with joker https://aur.archlinux.org/packages/joker-bin
(require 'flycheck-joker)

;; Enable eldoc in Clojure buffers
(add-hook 'cider-mode-hook #'eldoc-mode)

(provide 'setup-clojure)
