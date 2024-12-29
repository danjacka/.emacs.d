;; No splash screen
(setq inhibit-startup-screen t)

;; No *scratch* message
(setq initial-scratch-message nil)

;; Allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

;; Delete files outright
(setq delete-by-moving-to-trash nil)

;; Real emacs knights don't use shift to mark things
(setq shift-select-mode nil)

;; Transparently open compressed files
(auto-compression-mode t)

;; Answer questions with y/n
(defalias 'yes-or-no-p 'y-or-n-p)

;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

;; Show active region
(setq transient-mark-mode t)
(make-variable-buffer-local 'transient-mark-mode)
(put 'transient-mark-mode 'permanent-local t)
(setq-default transient-mark-mode t)

;; Remove text in active region if inserting text
(delete-selection-mode t)

;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; Lines should be 80 characters wide, not 70
(setq-default fill-column 80)

;; Save a list of recent files visited. (open recent file with C-x f)
(use-package recentf
  :defer 1 ;; Loads after 1 second of idle time.
  :config (recentf-mode 1)
  :custom (recentf-max-saved-items 100))  ;; just 20 is too recent

;; Undo/redo window configuration with C-c <left>/<right>
(use-package winner
  :defer 1
  :config (winner-mode 1))

;; <tab> inserts spaces, not tabs and spaces
(setq-default indent-tabs-mode nil)

;; Show me empty lines after buffer end
(set-default 'indicate-empty-lines t)

;; Allow scrolling with mouse wheel
;(mouse-wheel-mode t)

;; Don't soft-break lines for me, please
(setq-default truncate-lines t)

;; Sentences end with a single space
(setq sentence-end-double-space nil)

;; Add parts of each file's directory to the buffer name if not unique
(use-package uniquify
  :ensure nil
  :defer 2 ;; Loads after 2 seconds of idle time.
  :custom (uniquify-buffer-name-style 'forward))

;; Show more than 4 levels when evaling expressions
(setq eval-expression-print-level 100)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Don't write lock-files, I'm the only one here
(setq create-lockfiles nil)

;; Write all autosave files in the tmp dir
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; No electric indent
;(setq electric-indent-mode nil)
(electric-indent-mode -1)

;; Don't be so stingy on the memory, we have lots now. It's the distant future.
;(setq gc-cons-threshold 20000000)

;; org-mode: Don't ruin S-arrow to switch windows please (use M-+ and M-- instead to toggle)
;(setq org-replace-disputed-keys t)

;; Fontify org-mode code blocks
;(setq org-src-fontify-natively t)

;; Represent undo-history as an actual tree (visualize with C-x u)
;(setq undo-tree-mode-lighter "")
;(require 'undo-tree)
;(global-undo-tree-mode)
;(setq undo-tree-auto-save-history nil)

;; A saner ediff
;(setq ediff-diff-options "-w")
;(setq ediff-split-window-function 'split-window-horizontally)
;(setq ediff-window-setup-function 'ediff-setup-windows-plain)


;; Normal tab completion in Eshell
;(setq eshell-cmpl-cycle-completions nil)

(provide 'sane-defaults)
