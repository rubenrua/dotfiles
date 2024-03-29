;; from https://emacs.stackexchange.com/questions/51721/failed-to-download-gnu-archive
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")


(setq inhibit-startup-message t)

(menu-bar-mode -1)
(global-font-lock-mode 1)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

(column-number-mode)
(setq-default show-trailing-whitespace t)

;;--------------------
;;  MELPA USE-PACKAGE and TRY
;;--------------------
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file t)
(require 'package) ;; You might already have this line
(setq package-enable-at-startup nil)
(package-initialize)
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
;;  Use 4 spaces no tabs
;;--------------------
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default js-indent-level 2)
(setq-default css-indent-offset 2)

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
;; IBUFFER
;;--------------------
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;--------------------
;; COUNSEL AND SWIPER
;;--------------------
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
     ("M-y" . counsel-yank-pop)
     ("C-x C-f" . counsel-find-file)
     ("C-x C-o" . counsel-git)
     ("C-x C-r" . counsel-rg))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

(defun ivy-with-thing-at-point (cmd)
  (let ((ivy-initial-inputs-alist
         (list
          (cons cmd (thing-at-point 'symbol)))))
    (funcall cmd)))

(defun counsel-rg-current ()
  "counsel-rg-current."
  (interactive)
  (ivy-with-thing-at-point 'counsel-rg))

(global-set-key (kbd "C-c d")  'counsel-rg-current)

;;--------------------
;; dumb-jump-mode
;;--------------------
(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g ." . dumb-jump-go)
         ("M-g j" . dumb-jump-go)
         ("M-g b" . dumb-jump-back)
         ("M-g i" . dumb-jump-go-prompt)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config
  (progn
    (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
    (setq dumb-jump-force-searcher 'rg)
    )
  :ensure)


;;--------------------
;; Other
;;--------------------
(use-package rg
  :ensure)
(use-package meson-mode
  :ensure)
;(use-package php-mode
;  :ensure)
(use-package groovy-mode
  :ensure)
(use-package rust-mode
  :ensure)
(use-package dockerfile-mode
  :ensure)



;;--------------------
;; My hooks
;;--------------------
(rg-enable-default-bindings)

(defun rr-whitespace-cleanup ()
  (when (and (stringp buffer-file-name)
             (not (string-match "\\.md\\'" buffer-file-name)))
    (command-execute 'whitespace-cleanup)))
(add-hook 'before-save-hook #'rr-whitespace-cleanup)

(add-to-list 'auto-mode-alist '("\\.package\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.recipe\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.cbc\\'" . python-mode))
;; (add-to-list 'auto-mode-alist '("\\.feature\\'" . pickle-mode))
(add-to-list 'auto-mode-alist '("\\'Jenkinsfile" . groovy-mode))

;; https://emacsredux.com/blog/2013/04/02/move-current-line-up-or-down/
(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key (kbd "M-p")  'move-line-up)
(global-set-key (kbd "M-n")  'move-line-down)


(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))
(global-set-key (kbd "C-U") 'backward-kill-line)




;;-----
 (setq tags-table-list
       '("~/.emacs.d" "/home/rgonzalez/projects/gstreamer" "/home/rgonzalez/src/bitbucket.org/fluendo/flu-plugins"))
