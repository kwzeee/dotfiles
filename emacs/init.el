;; -= straight.el bootstrap =-
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; -= straight.el use-package integration =-
(straight-use-package 'use-package)

;; -= gui disable =-
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; -= themeing =-
(load-theme 'wombat)

;; -= evil-mode =-
(use-package evil
  :straight t
  :init
  (evil-mode 1))

;; -= which-key =-
(use-package which-key
  :straight t
  :config
  (which-key-mode 1))

;; -= counsel + ivy + swiper =-
(use-package counsel
  :straight t
  :config
  (counsel-mode 1)
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))

(global-set-key "\C-s" 'swiper)

;; -= treemacs =-
(use-package treemacs
  :straight t)

;; -= magit =-
(use-package magit
  :straight t)

;; -= projectile =-
(use-package projectile
  :straight t
  :init
  (projectile-mode 1)
  :bind (:map projectile-mode-map
	      ("C-c p" . projectile-command-map)))

;; -= lsp =-
(use-package lsp-mode
  :straight t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  (c++-mode . lsp)
  (lsp-mode . lsp-enable-which-key-integration))

(use-package lsp-ui
  :straight t)

(use-package lsp-ivy
  :straight t)

(use-package lsp-treemacs
  :straight t)

;; -= dap =-
(use-package dap-mode
  :straight t)
