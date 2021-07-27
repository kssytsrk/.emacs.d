;; -*- lexical-binding: t; -*-

(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(add-to-list 'load-path "~/.emacs.d/config/")
;; (add-to-list 'load-path "~/.emacs.d/mypkgs/")
;; (add-to-list 'load-path "~/.emacs.d/mypkgs/aweshell/")

;; (setq warning-minimum-level :emergency)

;; (byte-recompile-directory (expand-file-name "~/.emacs.d/config/") 0)
;; (byte-recompile-directory (expand-file-name "~/.emacs.d/mypkgs/") 0)

(add-to-list 'load-path "~/.emacs.d/custom")
(load "custom-config")

(use-package exwm
  :config (use-package exwm-cfg))
(exwm-init)

(load "package-config")

(load "org-config")

(load "eyecandy-config")

;(load "sbbs")

(load "paredit-config")

;(load "emms-config")

(load "minor-editing-enhancements-config")

(load "sly-config")

;; (load "ednc-config")

;; (load "telega-config")

;; (use-package aweshell
;;   :load-path "~/.emacs.d/mypkgs/aweshell")
;; (with-eval-after-load "esh-opt"
;;   (autoload 'epe-theme-lambda "eshell-prompt-extras")
;;   (setq eshell-highlight-prompt nil
;;         eshell-prompt-function 'epe-theme-lambda))

(use-package pinentry
  :pin melpa
  :config
  (setf epa-pinentry-mode 'loopback)
  (pinentry-start))

(use-package lainchan
  :load-path "~/usr/dev/elisp/lainchan")

(pdf-tools-install)

(add-hook 'pdf-view-mode-hook
          (lambda ()
            (setf pdf-view-midnight-colors
                  (cons (face-attribute 'default :foreground nil t)
                        (face-attribute 'default :background nil t)))
            (pdf-view-midnight-minor-mode)))

;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)
(put 'downcase-region 'disabled nil)

;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e/")
;; (require 'mu4e)
;; (load "mu4e-config.el")

;; (add-to-list 'load-path "/opt/acl2/emacs")
;; (defvar acl2-skip-shell nil)
;; (setq acl2-skip-shell t)
;; (load "emacs-acl2.el")

(global-unset-key (kbd "M-RET"))
(global-set-key (kbd "M-RET") 'comment-or-uncomment-region)

;; (add-to-list 'load-path "~/.emacs.d/mypkgs/bookmark+/")
;; (require 'bookmark+)

;(load "eww-config")

;(setq w3m-command "/home/kassy/.config/w3m.sh")
;(setq w3m-command "/usr/bin/w3m")
;(setq w3m-command-arguments '())

;; (server-start)

(require 'ido)

(fringe-mode 1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(global-set-key (kbd "C-x C-k") 'kill-current-buffer)

;; (blink-cursor-mode)
;; (setq visible-cursor nil)

;(setq gnus-select-method '(nntp "news.gmane.io"))

(load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "~/local/bin/sbcl")
