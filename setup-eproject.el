(require 'eproject)
(require 'eproject-extras)

;; Add contrib to load path
(add-to-list 'load-path (expand-file-name "eproject/contrib" site-lisp-dir))

(require 'eproject-tags)

; Remove generic VCS projects until eproject recognises outer projects.
; For Plone we need Python packages checked out by mr.developer *not* to be
; considered their own projects.
; Issue listed at https://github.com/jrockway/eproject/issues/36
(assq-delete-all 'generic-git   eproject-project-types)
(assq-delete-all 'generic-hg    eproject-project-types)
(assq-delete-all 'generic-bzr   eproject-project-types)
(assq-delete-all 'generic-darcs eproject-project-types)

; Tags config
(setq eproject-tags-etags "ctags-exuberant")
;(setq eproject-tags-verbose nil)

(provide 'setup-eproject)
