(require 'package)

;; Add MELPAs to package repos
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;;package.el installs the highest available version number from all archives,
;;unless the package is pinned to a particular archive (Emacs 24.4+)
(when (boundp 'package-pinned-packages)
  (setq package-pinned-packages
        '((cider        . "melpa-stable")
          (clojure-mode . "melpa-stable"))))

(package-initialize)

(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa")
  (package-refresh-contents))

(defun packages-install (packages)
  (mapc (lambda (package)
	  (when (not (package-installed-p package))
	    (package-install package)))
	packages)
  (delete-other-windows))

;;; On-demand installation of packages

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(provide 'setup-package)
