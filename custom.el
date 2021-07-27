(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(bongo-enabled-backends '(mpg123 mpv speexdec))
 '(custom-safe-themes
   '("5ed25f51c2ed06fc63ada02d3af8ed860d62707e96efc826f4a88fd511f45a1d"))
 '(dashboard-buffer-last-width 84)
 '(dashboard-center-content t)
 '(dashboard-footer-messages nil)
 '(dashboard-set-navigator t)
 '(dashboard-week-agenda nil)
 '(debug-on-error nil)
 '(helm-completion-style 'emacs)
 '(image-use-external-converter t)
 '(inhibit-startup-screen nil)
 '(initial-buffer-choice nil)
 '(make-backup-files nil)
 '(org-agenda-files
   '("~/org/gtd/inbox.org" "~/org/gtd/gtd.org" "~/org/gtd/habits.org" "~/org/gtd/reading.org" "~/org/gtd/smalltasks.org" "~/org/week/"))
 '(org-agenda-skip-additional-timestamps-same-entry t)
 '(org-capture-templates
   '(("t" "Todo [inbox]" entry
      (file+headline "~/org/gtd/inbox.org" "Tasks")
      "* TODO %i%?")
     ("T" "Tickler" entry
      (file+headline "~/org/gtd/tickler.org" "Tickler")
      "* %i%?
 %U")
     ("p" "to listen" entry
      (file "~/org/playlistplan.org")
      "" :prepend t)) t)
 '(org-habit-following-days 1)
 '(org-habit-graph-column 75)
 '(org-habit-show-done-always-green t)
 '(org-habit-show-habits-only-for-today t)
 '(org-modules
   '(ol-bbdb ol-bibtex ol-docview ol-eww ol-gnus org-habit ol-info ol-irc ol-mhe ol-rmail ol-w3m))
 '(package-selected-packages
   '(pinentry exwm jabber elfeed egg-timer helm-hoogle auto-auto-indent impatient-mode org-books w3m haskell-mode ednc pomodoro quelpa org-journal emojify all-the-icons alert brutalist-theme docker-cli docker comment-dwim-2 bongo dashboard page-break-lines pkg-info rainbow-identifiers visual-fill-column vlf vterm base16-theme nov ert-expectations sly-quicklisp company-jedi jedi rich-minority yasnippet zygospore pass frame-purpose mentor sly lsp-mode rainbow-delimiters sx pdf-view-restore exwm-config markdown-mode multiple-cursors column-enforce-mode magit counsel hy-mode paredit pdf-tools ewal helm-gtags helm ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent company clean-aindent-mode anzu))
 '(pdf-view-resize-factor 1.1)
 '(rich-minority-mode t)
 '(safe-local-variable-values
   '((eval cl-flet
           ((enhance-imenu-lisp
             (&rest keywords)
             (dolist
                 (keyword keywords)
               (add-to-list 'lisp-imenu-generic-expression
                            (list
                             (purecopy
                              (concat
                               (capitalize keyword)
                               (if
                                   (string=
                                    (substring-no-properties keyword -1)
                                    "s")
                                   "es" "s")))
                             (purecopy
                              (concat "^\\s-*("
                                      (regexp-opt
                                       (list
                                        (concat "define-" keyword))
                                       t)
                                      "\\s-+\\(" lisp-mode-symbol-regexp "\\)"))
                             2)))))
           (enhance-imenu-lisp "bookmarklet-command" "class" "command" "ffi-method" "function" "mode" "parenscript" "user-class"))
     (eval cl-flet
           ((enhance-imenu-lisp
             (&rest keywords)
             (dolist
                 (keyword keywords)
               (add-to-list 'lisp-imenu-generic-expression
                            (list
                             (purecopy
                              (concat
                               (capitalize keyword)
                               (if
                                   (string=
                                    (substring-no-properties keyword -1)
                                    "s")
                                   "es" "s")))
                             (purecopy
                              (concat "^\\s-*("
                                      (regexp-opt
                                       (list
                                        (concat "define-" keyword))
                                       t)
                                      "\\s-+\\(" lisp-mode-symbol-regexp "\\)"))
                             2)))))
           (enhance-imenu-lisp "bookmarklet-command" "class" "command" "function" "mode" "parenscript" "user-class"))))
 '(window-divider-default-bottom-width 1)
 '(window-divider-default-places t)
 '(window-divider-default-right-width 1))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#000000" :foreground "#eeeee8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "mlss" :family "Anonymous Pro"))))
 '(custom-comment ((t nil)))
 '(mode-line ((t (:inherit fixed-pitch :background "black" :foreground "#ffffdf" :box (:line-width 2 :color "#ffffdf" :style released-button) :height 0.9))))
 '(mode-line-inactive ((t (:background "black" :foreground "gray20" :box (:line-width 2 :color "black" :style released-button) :height 0.9)))))
