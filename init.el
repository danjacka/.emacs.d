;; .emacs.d structure based on https://github.com/magnars/.emacs.d

;; Set path to dependencies
(setq site-lisp-dir (expand-file-name "site-lisp" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path site-lisp-dir)

;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; No backup files
(setq make-backup-files nil)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Don't expire cached passwords
(setq password-cache-expiry nil)

;; TRAMP config
(setq tramp-default-method "sshx")

;; split horizontally (left/right) by default
(setq split-height-threshold nil) ;; do not split windows vertically (up/down)
(setq split-width-threshold 150)  ;; do not split windows <150 columns wide
                                  ;; => maintain 2 side-by-side windows

;; Setup packages
(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   (cons 'ace-jump-mode marmalade)
   (cons 'clojure-mode marmalade)
   (cons 'csv-mode gnu)
   (cons 'erc-hl-nicks marmalade)
   (cons 'etags-select marmalade)
   (cons 'expand-region marmalade)
   (cons 'flymake-python-pyflakes marmalade)
   (cons 'inf-ruby marmalade)
   (cons 'jabber marmalade)
   (cons 'magit marmalade)
   (cons 'markdown-mode marmalade)
   (cons 'monokai-theme marmalade)
   (cons 'multiple-cursors marmalade)
   (cons 'nginx-mode marmalade)
   (cons 'nrepl marmalade)
   (cons 'org gnu)
   (cons 'php-mode marmalade)
   (cons 'rainbow-mode gnu)
   (cons 'smex marmalade)
   (cons 'zenburn-theme marmalade)))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Let's start with a smattering of sanity
(require 'sane-defaults)

;; Setup extensions
(eval-after-load 'ido '(require 'setup-ido))
(eval-after-load 'magit '(require 'setup-magit))
(require 'setup-erc)
(require 'setup-org)
(require 'setup-eshell)

;; Language-specific setup files
(require 'setup-php-mode)
(eval-after-load 'python '(require 'setup-python))
(eval-after-load 'ruby-mode '(require 'setup-ruby-mode))

;; Use project files
(require 'setup-eproject)
(require 'eproject-plone)

;; Map files to modes
(require 'mode-mappings)

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

;; Smart M-x is smart
(smex-initialize)

;; Setup key mappings
(require 'key-bindings)

;; Misc
(require 'appearance)
(require 'misc)
(when (equal system-type 'gnu/linux) (require 'linux))

;; Run at full power
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; Load 'expat' settings from outside .emacs.d (credentials, etc.)
(setq expat-settings-dir "~/.emacs-expat/")
(when (file-exists-p expat-settings-dir)
  (mapc 'load (directory-files expat-settings-dir t "^[^#].*el$")))
