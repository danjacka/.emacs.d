;; Ledger is a command line accounting tool that provides double-entry
;; accounting based on a text journal.  It provides no bells or whistles,
;; and returns the user to the days before user interfaces were even a
;; twinkling in their father’s CRT.

(use-package ledger-mode
  :custom
  (ledger-report-use-native-highlighting nil))

(provide 'setup-ledger)
