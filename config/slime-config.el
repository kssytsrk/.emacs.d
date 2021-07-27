;; slime config stuff goes here

(load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "/usr/bin/sbcl")

(add-to-list 'load-path "~/.emacs.d/slime-contrib/")
(require 'slime-autoloads)
(setq slime-contribs '(slime-asdf slime-indentation ;; swank-parenscript
                       ))

(setq lisp-indent-function 'common-lisp-indent-function)
(setq common-lisp-style-default "sbcl")

(load "js-expander.el")
(put 'if 'lisp-indent-function 2)

 (add-hook 'lisp-mode-hook
	   (lambda ()
	     (set (make-local-variable 'lisp-indent-function)
		      'common-lisp-indent-function)))

(put 'if 'common-lisp-indent-function 2)
