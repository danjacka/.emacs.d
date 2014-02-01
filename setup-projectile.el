(require 'projectile)

;; `projectile-global-mode' treats all VCS-managed directories as project roots.
;; I don't want Projectile for buildout+mr.developer projects, so don't enable
;; global mode; only activate Projectile where projects have a manually-added
;; .dir-locals.el in the root directory containing:
;; ((nil . ((projectile-mode . t))))

;; Regard `projectile-mode' directory variables as safe
(add-to-list 'safe-local-variable-values '(projectile-mode . t))

;; Ignore .svn directories
(add-to-list 'projectile-globally-ignored-directories ".svn")
(setq projectile-svn-command "find . -type f -not -iwholename '*.svn/*' -print0")

;; Explicitly build TAGS with ctags-exuberant
(setq projectile-tags-command "ctags-exuberant -Re %s")

(provide 'setup-projectile)
