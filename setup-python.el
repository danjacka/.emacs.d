; mr.igor remembers Python imports
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

;; Python process control
(defun python-kill-python ()
  (interactive)
  (save-excursion
    (when (get-buffer "*Python*")
      (set-buffer "*Python*")
      (when (comint-check-proc "*Python*")
        (comint-send-eof)
        (sleep-for 0.2))
      (when (comint-check-proc "*Python*")
        (comint-interrupt-subjob)
        (comint-send-eof)
        (sleep-for 1))
      (when (comint-check-proc "*Python*")
        (comint-kill-subjob)
        (sleep-for 0.5))
      (when (comint-check-proc "*Python*")
        (error "Could not kill the Python interpreter")))))

(defvar python-run-python-last-cmd nil
  "The command argument that run-python was last invoked with.")

(defadvice run-python (after remember-python activate)
  (setq python-run-python-last-cmd (ad-get-arg 0)))

(defun python-shell-repeat-python ()
  "Repeat the last shell command that started Python"
  (interactive)
  (python-kill-python)
  (funcall #'run-python python-run-python-last-cmd nil nil))

(defun python-shell-interactive-interpreter ()
  "Start an interactive interpreter in the Python shell"
  (interactive)
  (insert "!import code; code.interact(local=vars())")
  (comint-send-input))

;; Bits & bobs
(defun annotate-pdb ()
  (interactive)
  (highlight-lines-matching-regexp "^[ ]*import pdb; pdb.set_trace()"))

(python-skeleton-define pdb "Insert PDB breakpoint."
  nil
  \n "import pdb; pdb.set_trace()")



;; Keybindings
(define-key python-mode-map (kbd "C-c C-i") 'igor)
(define-key python-mode-map (kbd "C-c C-t p") 'python-skeleton-pdb)

;; Mode hook
(add-hook 'python-mode-hook
          '(lambda ()
             (annotate-pdb)
             (flymake-python-pyflakes-load)
             (setq fill-column 78)))

(provide 'setup-python)
