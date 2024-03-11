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

;; -= magit =-
(use-package magit
  :straight t)
