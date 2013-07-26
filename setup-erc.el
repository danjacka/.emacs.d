(require 'erc)
(require 'erc-services)
(erc-services-mode 1)

;; Hide join/part messages, etc.
(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))

(provide 'setup-erc)
