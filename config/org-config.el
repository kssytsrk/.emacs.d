;; org shit goes here

(setq org-agenda-files '("~/org/gtd/inbox.org"
                         "~/org/gtd/gtd.org"
                         "~/org/gtd/tickler.org"
                         "~/org/gtd/habits.org"
                         "~/org/gtd/reading.org"
                         "~/org/gtd/smalltasks.org"))

(global-set-key (kbd "C-c c") 'org-capture)

(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~/usr/org/gtd/inbox.org" "Tasks")
                               "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline "~/usr/org/gtd/tickler.org" "Tickler")
                               "* %i%? \n %U")))

(global-set-key (kbd "C-c C-w") 'org-refile)

(global-set-key (kbd "C-c t") 'org-todo-yesterday)

(setq org-refile-targets '(("~/org/gtd/gtd.org" :maxlevel . 3)
                           ("~/org/gtd/someday.org" :level . 1)
                           ("~/org/gtd/tickler.org" :maxlevel . 2)
                           ("~/org/gtd/habits.org" :maxlevel . 2)
                           ("~/org/gtd/reading.org" :maxlevel . 2)
                           ("~/org/gtd/smalltasks.org" :maxlevel . 2)))

(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "IN-PROGRESS(i)" "|" "DONE(d)" "CANCELLED(c)")))

(global-set-key (kbd "C-c C-x C-a") 'org-archive-subtree-default)


(setq org-habit-graph-column 75)

(setq org-agenda-sorting-strategy '((agenda time-up priority-down category-keep)
                                    (todo priority-down category-keep)
                                    (tags priority-down category-keep)
                                    (search category-keep)))

(setq org-habit-show-habits-only-for-today nil)

(global-set-key (kbd "C-c C-x a") 'org-agenda-list)

(defun zet (name)
  (interactive "sTopic/name for the note? ")
  (find-file (concat "~/org/zet/"
                   (format-time-string "%Y-%m-%d-%H-%M"
                                       (current-time))
                   "-"
                   name
                   ".org"))
  (insert "* " name "\n\n#+FILETAGS: "))

(use-package org-treescope
  :load-path "~/.emacs.d/mypkgs/org-treescope.el/"
  :custom
  (org-treescope-cyclestates-todo '(nil ("TODO") ("WAITING" "IN-PROGRESS" "DONE")))
  (org-treescope-cyclestates-priority '(nil ("A" "B" "C") ("D")))
  :bind
  (("C-c M-t" . org-treescope)))

(use-package org-journal
  :ensure t
  :defer t
  :init
  (setq org-journal-prefix-key "C-c j ")
  :custom
  (org-journal-dir "~/org/diary/")
  (org-journal-find-file 'find-file)
  (org-journal-file-type 'weekly)
  (org-journal-encrypt-journal t))
