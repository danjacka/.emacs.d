;; mr.igor remembers Python imports
(defun igor ()
  "Run the current buffer through mr.igor."
  (interactive)
  (let ((igor-exe (or (executable-find "igor")
                      (error "No command 'igor' found")))
        (tempfile (make-temp-file "igor"))
        (buffer (current-buffer))
        (lines-before (count-lines 1 (buffer-size))))
    (with-temp-file tempfile
      (insert-buffer-substring buffer))
    (with-temp-buffer
      (shell-command (concat igor-exe " --print " tempfile) t)
      (if (zerop (compare-buffer-substrings
                  (current-buffer) 1 (buffer-size)
                  buffer 1 (buffer-size buffer)))
          (message "igor: no new imports")
        (copy-to-buffer buffer 1 (buffer-size))
        (let ((lines-after (count-lines 1 (buffer-size))))
          (message "igor: added %d imports" (- lines-after lines-before))))
      (delete-file tempfile))))

(defun python-shell-interactive-interpreter ()
  "Start an interactive interpreter from pdb"
  (interactive)
  (insert "!import code; code.interact(local=vars())")
  (comint-send-input))

(python-skeleton-define pdb "Insert PDB breakpoint."
  nil
  \n "import pdb; pdb.set_trace()")

(define-key python-mode-map (kbd "C-c C-i") 'igor)
(define-key python-mode-map (kbd "C-c C-t p") 'python-skeleton-pdb)

(add-hook
 'python-mode-hook
 '(lambda ()
    (highlight-lines-matching-regexp "^[ ]*import pdb; pdb.set_trace()")
    (setq fill-column 78)
    (subword-mode 1)))

(provide 'setup-python)
