(menu-bar-mode -1)
(global-font-lock-mode 1)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;;--------------------
;;  Use 4 spaces no tabs
;;--------------------
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-basic-offset 4)


;;--------------------
;;  MELPA
;;--------------------
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

;;--------------------
;; Highlight matching parentheses
;;--------------------
(require 'paren)
(setq show-paren-style 'parenthesis)
(show-paren-mode +1)
(setq ido-use-filename-at-point 'guess)

;;--------------------
;; IDO - Interactively DO things
;;--------------------
(setq
 ido-everywhere t
 ido-auto-merge-work-directories-length 0
 ido-use-filename-at-point 'guess
 ido-use-url-at-point nil           ; don't use url at point (annoying)
 ido-case-fold  t                   ; be case-insensitive
 ido-max-prospects 10
 ido-max-window-height 1
 ido-enable-flex-matching t
 ffap-machine-p-known 'reject)
 
(ido-mode 1)

(require 'recentf)

;; enable recent files mode.
(recentf-mode t)

(setq recentf-max-saved-items 250) ; 250 files ought to be enough.

;;(defun ido-recentf-open ()
;;  "Use `ido-completing-read' to \\[find-file] a recent file"
;;  (interactive)
;;  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
;;      (message "Opening file...")
;;    (message "Aborting")))

;; get rid of `find-file-read-only' and replace it with something
;; more useful.
;;(global-set-key (kbd "C-x C-r") 'ido-recentf-open)

;;--------------------
;; My keybindings
;;--------------------
(global-set-key (kbd "C-f") 'dabbrev-expand)

