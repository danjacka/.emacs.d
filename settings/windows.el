(setq exec-path (add-to-list 'exec-path "C:/Program Files (x86)/Git/bin"))
(setenv "PATH" (concat "C:\\Program Files (x86)\\Git\\bin;" (getenv "PATH")))

;; Don't guess encoding from file contents. Specifically, turn off
;; sgml-xml-auto-coding-function, which - in XML files - tramples
;; utf-8-with-signature-dos to plain utf-8 after recognising encoding="utf-8".
(setq auto-coding-functions nil)

;; Ignore node.js module directories when searching (because paths are often too long)
(setq grep-find-ignored-directories (add-to-list 'grep-find-ignored-directories "node_modules"))

(provide 'windows)
