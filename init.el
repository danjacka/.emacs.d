;; .emacs.d structure based on https://github.com/magnars/.emacs.d

;; Set path to dependencies
(setq settings-dir (expand-file-name "settings" user-emacs-directory))
(setq site-lisp-dir (expand-file-name "site-lisp" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path settings-dir)
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

;; split horizontally (left/right) by default
(setq split-height-threshold nil) ;; do not split windows vertically (up/down)
(setq split-width-threshold 150)  ;; do not split windows <150 columns wide
                                  ;; => maintain 2 side-by-side windows

;; Setup packages
(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(anzu
     cider
     clojure-mode
     csharp-mode
     dash
     diminish
     discover
     expand-region
     git-timemachine
     inf-clojure
     json-reformat
     magit
     markdown-mode
     multiple-cursors
     org
     paredit
     powershell
     rainbow-mode
     smex
     virtualenvwrapper
     yafolding
     zenburn-theme)))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Let's start with a smattering of sanity
(require 'sane-defaults)

;; Setup extensions
(eval-after-load 'dired '(require 'setup-dired))
(eval-after-load 'ido '(require 'setup-ido))
(eval-after-load 'magit '(require 'setup-magit))
(require 'setup-erc)
(require 'setup-org)
(require 'setup-eshell)
(require 'setup-paredit)

;; Font lock dash.el
(eval-after-load "dash" '(dash-enable-font-lock))

;; Language-specific setup files
(eval-after-load 'python '(require 'setup-python))
(eval-after-load 'csharp-mode '(require 'setup-csharp))
(eval-after-load 'clojure-mode '(require 'setup-clojure))

;; Map files to modes
(require 'mode-mappings)

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

;; Smart M-x is smart
(smex-initialize)

;; Anzu shows isearch match count
(require 'anzu)
(global-anzu-mode)

;; Setup key mappings
(require 'key-bindings)

;; Misc
(require 'appearance)
(require 'miscellaneous)
(when (equal system-type 'gnu/linux) (require 'linux))
(when (equal system-type 'windows-nt) (require 'windows))

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;; Run at full power
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; Load 'expat' settings from outside .emacs.d (credentials, etc.)
(setq expat-settings-dir "~/.emacs-expat/")
(when (file-exists-p expat-settings-dir)
  (mapc 'load (directory-files expat-settings-dir t "^[^#].*el$")))

;; Experimental discover mode
;; http://www.masteringemacs.org/articles/2013/12/21/discoverel-discover-emacs-context-menus/
(global-discover-mode 1)
