(setq inhibit-startup-message t)
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
;;  MELPA USE-PACKAGE and TRY
;;--------------------
(require 'package) ;; You might already have this line
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

(use-package try
    :ensure t)

;;--------------------
;; WHICH-KEY
;;--------------------
(use-package which-key
    :ensure t
    :config
    (which-key-mode))

;;--------------------
;; Highlight matching parentheses
;;--------------------
(require 'paren)
(setq show-paren-style 'parenthesis)
(show-paren-mode +1)
(setq ido-use-filename-at-point 'guess)

;;--------------------
;; ACE-WINDOW
;;--------------------
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key (kbd "C-x w") 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
    ))


;;--------------------
;; IDO - Interactively DO things
;;--------------------
(setq
 ido-everywhere t
 ido-enable-flex-matching t
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
;; COUNSEL AND SWIPER
;;--------------------
;; it looks like counsel is a requirement for swiper
(use-package counsel
  :ensure t
  )

(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy))


(use-package swiper
  :ensure try
  :bind (("C-c C-s" . swiper)
     ("C-c C-r" . ivy-resume)
     ("M-x" . counsel-M-x)
     ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))


;; - [ ] C-x C-f no magic like ido-find-file
;; - [ ] C-s C-w and C-s C-r is diff (C-s M-j)
(global-set-key (kbd "C-c C-f") 'counsel-git)
(global-set-key (kbd "C-c C-r") 'counsel-rg)

;;--------------------
;; PROJECTILE
;;--------------------
;;(require 'projectile)
;;(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;;(projectile-mode +1)
;;(setq projectile-project-search-path '("~/src/"))
;;(setq projectile-completion-system 'ivy)


;;--------------------
;; My hooks
;;--------------------
(add-hook 'before-save-hook 'whitespace-cleanup)

;;--------------------
;; My keybindings
;;--------------------
(global-set-key (kbd "C-f") 'dabbrev-expand)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (counsel ace-window which-key try use-package web-mode vimgolf scala-mode rust-mode python-mode projectile php-mode multiple-cursors magit jedi ivy ggtags ggo-mode fiplr emmet-mode dumb-jump auto-complete-clang-async ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
