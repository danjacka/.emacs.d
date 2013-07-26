;; Org-mode
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; Steve Yegge's js2-mode for JavaScript
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . javascript-mode))

;; ZCML
(add-to-list 'auto-mode-alist '("\\.zcml$" . xml-mode))

;; HTML mode
(add-to-list 'auto-mode-alist '("\\.\\(html\\|pt\\|cpt\\)$" . html-mode))

;; Rainbow mode for RGB values in CSS
(add-hook 'css-mode-hook 'rainbow-mode)

;; Robot Framework mode
(autoload 'robot-mode "robot-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.robot$" . robot-mode))

;; Ruby
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . rhtml-mode))

;; Markdown
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

(provide 'mode-mappings)
