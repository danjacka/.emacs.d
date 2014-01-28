(require 'projectile)

;; `projectile-global-mode' treats all VCS-managed directories as project roots.
;; I don't want Projectile for buildout+mr.developer projects, so don't enable
;; global mode; only activate Projectile where projects have a manually-added
;; .dir-locals.el in the root directory containing:
;; ((nil . ((projectile-mode . t))))

;; Regard `projectile-mode' directory variables as safe
(setq safe-local-variable-values
      (cons '(projectile-mode . t) safe-local-variable-values))

;; Ignore .svn directories
(setq projectile-globally-ignored-directories
      (cons ".svn" projectile-globally-ignored-directories))
(setq projectile-svn-command "find . -type f -not -iwholename '*.svn/*' -print0")

;; Explicitly build TAGS with ctags-exuberant
(setq projectile-tags-command "ctags-exuberant -Re %s")

(provide 'setup-projectile)
