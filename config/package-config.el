;; package configuration stuff goes here

(require 'package) ;; package.el
(package-initialize)

;; repositories
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;(add-to-list 'load-path "~/.emacs.d/mypkgs/")
;(add-to-list 'load-path "~/.emacs.d/mypkgs/matrix-client/")

;(require 'matrix-client)
