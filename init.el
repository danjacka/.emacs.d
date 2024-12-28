;; .emacs.d structure based on https://github.com/magnars/.emacs.d

;; Set path to dependencies
(setq settings-dir (expand-file-name "settings" user-emacs-directory))
(setq site-lisp-dir (expand-file-name "site-lisp" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path settings-dir)
(add-to-list 'load-path site-lisp-dir)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Write all autosave files in the tmp dir
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Don't write lock-files, I'm the only one here
(setq create-lockfiles nil)

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Setup packages
(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(
     anzu
     better-defaults
     cider
     circe
     clojure-mode
     clojure-mode-extra-font-locking
     dash
     deadgrep
     diminish
     dockerfile-mode
     expand-region
     fennel-mode
     flycheck
     flycheck-joker
     git-timemachine
     groovy-mode
     inf-clojure
     json-reformat
     kaocha-runner
     ledger-mode
     lua-mode
     magit
     markdown-mode
     multiple-cursors
     org
     org-roam
     paredit
     pikchr-mode
     powershell
     rainbow-mode
     restclient
     smex
     spacemacs-theme
     typescript-mode
     undo-tree
     virtualenvwrapper
     which-key
     yafolding
     yaml-mode
     zenburn-theme)))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Let's start with a smattering of sanity
(require 'better-defaults) ; https://github.com/technomancy/better-defaults
(require 'sane-defaults)

;; Setup extensions
(eval-after-load 'dired '(require 'setup-dired))
(eval-after-load 'ido '(require 'setup-ido))
(eval-after-load 'magit '(require 'setup-magit))
(require 'setup-org)
(require 'setup-paredit)

;; Enable flycheck linting
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Font lock dash.el
(eval-after-load "dash" '(dash-enable-font-lock))

;; Language-specific setup files
(eval-after-load 'python '(require 'setup-python))
(eval-after-load 'csharp-mode '(require 'setup-csharp))
(eval-after-load 'clojure-mode '(require 'setup-clojure))
(eval-after-load 'css-mode '(require 'setup-css))
(eval-after-load 'js '(require 'setup-javascript))

;; Load stuff on demand
(eval-after-load 'flycheck '(require 'setup-flycheck))

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
