;; custom stuff goes here (and i need to clean it up a bit, i think

(add-to-list 'load-path "~/.emacs.d/custom")

;; (require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
    (require 'setup-helm)
    (require 'setup-helm-gtags))
;; (require 'setup-ggtags)
;; (require 'setup-cedet)
;; (require 'setup-editing)

;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(custom-safe-themes
;;    '("72e041c9a2cec227a33e0ac4b3ea751fd4f4039235035894bf18b1c0901e1bd6" "e5dc5b39fecbeeb027c13e8bfbf57a865be6e0ed703ac1ffa96476b62d1fae84" default))
;;  '(helm-completion-style 'emacs)
;;  '(package-selected-packages
;;    '(feebleline mini-modeline lsp-mode rainbow-delimiters sx phoenix-dark-pink-theme pdf-view-restore emms bongo desktop-environment helm-exwm exwm-config exwm origami yafolding markdown-mode multiple-cursors column-enforce-mode magit counsel telega nov speed-type typing hy-mode writegood-mode paredit pdf-tools ewal zygospore helm-gtags helm yasnippet ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent counsel-projectile company clean-aindent-mode anzu))
;;  '(safe-local-variable-values
;;    '((eval cl-flet
;;       ((enhance-imenu-lisp
;;         (&rest keywords)
;;         (dolist
;;             (keyword keywords)
;;           (add-to-list 'lisp-imenu-generic-expression
;;                        (list
;;                         (purecopy
;;                          (concat
;;                           (capitalize keyword)
;;                           (if
;;                            (string=
;;                             (substring-no-properties keyword -1)
;;                             "s")
;;                            "es" "s")))
;;                         (purecopy
;;                          (concat "^\\s-*("
;;                                  (regexp-opt
;;                                   (list
;;                                    (concat "define-" keyword))
;;                                   t)
;;                                  "\\s-+\\(" lisp-mode-symbol-regexp "\\)"))
;;                         2)))))
;;       (enhance-imenu-lisp "bookmarklet-command" "class" "command" "function" "mode" "parenscript" "user-class")))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
