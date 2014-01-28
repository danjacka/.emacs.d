;; Use eproject for Plone projects. eproject is currently better for Plone than
;; projectile because eproject:
;; - recognises buildout.cfg + versions.cfg as a project;
;; - can ignore irrelevant files and directories;
;; - allows generating a TAGS file using a complex etags invocation.

(define-project-type plone (generic)
  (and (look-for "buildout.cfg") (look-for "versions.cfg"))
  :irrelevant-files ("bin/" "develop-eggs/" "fake-eggs/" "parts/" "var/" "*.py?" "*.egg-info")
  :tasks(("buildout" :shell "bin/buildout")
         ("test"     :shell "bin/test"))
  :omelette-directory (lambda (root) (concat root "parts/omelette"))
  :tags-cmd-args (lambda (root) '("-e" "-R" "--languages=-JavaScript" "--python-kinds=-i" "parts/omelette"))
  :main-file "buildout.cfg")

;; Control etags command. Pull request submitted in https://github.com/jrockway/eproject/pull/57
(defun eproject-tags--generate (cb &optional state root)
  "Generate a tags table for this project (or the project in ROOT), calling CB
  with the project root and STATE upon completion.

By default the tags command is passed all project-relevant files as arguments. A
project can instead define a list of files (and other arguments) in the project
attribute :tags-cmd-args.

Output goes to root/TAGS. The tags table is not visited after generation."
  (let* ((root  (or root (eproject-root)))
         (default-directory root)
         (name  (concat (eproject-attribute :name root) "-TAGS"))
         (buf   (eproject-tags--buffer root))
         (args  (append '("-o" ".TAGS-tmp")
                        (if eproject-tags-verbose '("--verbose"))
                        (or (eproject-attribute :tags-cmd-args root)
                            (eproject-list-project-files-relative root))))
         (proc  (apply #'start-process name buf eproject-tags-etags args)))

    (with-current-buffer buf
      (setq eproject-tags-callback cb)
      (setq eproject-tags-state state)
      (setq eproject-root root))

    (set-process-sentinel proc #'eproject-tags--sentinel))
  nil)

;; Omelette grepping
(defun omegrep ()
  "rgrep for Python egg omelettes."
  (interactive)
  (let ((default-directory (or (ignore-errors
                                 (eproject-attribute :omelette-directory))
                               default-directory)))
    (call-interactively 'rgrep-follow-symlinks)))

;; TODO after buildout, eproject-reinitialize-project to refresh project attributes

;; TODO function: list buffers grouped by package

;; TODO function: jump to the eshell for this project

(provide 'eproject-plone)
