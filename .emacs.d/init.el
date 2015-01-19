(global-font-lock-mode 1)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
