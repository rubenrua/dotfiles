(menu-bar-mode -1)
(global-font-lock-mode 1)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(global-set-key (kbd "C-f") 'dabbrev-expand)

;; MELPA
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Highlight matching parentheses
(require 'paren)
(setq show-paren-style 'parenthesis)
(show-paren-mode +1)
