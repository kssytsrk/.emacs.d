;; nice visual stuff goes here

(load-theme 'brutalist-dark t)

(add-to-list 'default-frame-alist
             '(font . "Anonymous Pro:antialias=none"))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'text-mode-hook 'display-line-numbers-mode)
(add-hook 'fundamental-mode-hook 'display-line-numbers-mode)

(column-number-mode)

(global-prettify-symbols-mode 1)

(setq-default left-fringe-width 1)

(set-face-attribute 'default nil :background "black")
(set-face-attribute 'fringe nil :background (face-attribute 'default :background))
(set-face-attribute 'mode-line nil :foreground "black")
(set-face-attribute 'mode-line nil :height 0.9)
(set-face-attribute 'mode-line-inactive nil :height 0.9)


(use-package rich-minority
  :defer nil
  :config
  (unless rich-minority-mode
    (rich-minority-mode 1))
  (setf rm-blacklist ""))

;;;; YEAR PERCENTAGE

(defvar days-in-months
  '((1 . 31)
    (2 . 28)
    (3 . 31)
    (4 . 30)
    (5 . 31)
    (6 . 30)
    (7 . 31)
    (8 . 31)
    (9 . 30)
    (10 . 31)
    (11 . 30)
    (12 . 31)))

(defun calc-days-since (month)
  (if (= month 1)
      31
    (+ (cdr (assoc month days-in-months)) (calc-days-since (1- month)))))

(defun days-since-start-of-year ()
  (let ((dt (decode-time)))
    (+ (nth 3 dt) (calc-days-since (- (nth 4 dt) 1)))))

(defun year-percentage ()
  (let ((dt (decode-time)))
    (floor (* (/ (days-since-start-of-year) 365.0) 100))))

(defun current-week ()
  (if (or (eql (nth 6 (decode-time)) 0)
          (eql (nth 6 (decode-time)) 5))
      (1- (org-days-to-iso-week (days-since-start-of-year)))
    (org-days-to-iso-week (days-since-start-of-year))))

(defvar todo-week-directory "~/org/week/")

(defun build-todo-week-string ()
  (let ((year (nth 5 (decode-time)))
        (week-num (current-week)))
    (format "%s%02d-%d.org" todo-week-directory week-num year)))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-week-agenda nil)
  (setq dashboard-set-navigator t)
  (setq dashboard-startup-banner "/home/kassy/usr/img/anm/ayanami_rei/1cc365f613559634b3a55a63ebe73dfdcb4d4dfb73b9a62e686d7aed5163dff6.png")
  (setq dashboard-center-content t)
  (setq dashboard-items '()))

(defun dashboard-insert-year-percentage (list-size)
  (insert (format "Year percentage: %s%%."
                  (year-percentage))))

(defun dashboard-insert-todo-week (list-size)
  (insert-file-contents (build-todo-week-string)))

(add-to-list 'dashboard-item-generators  '(year-percentage . dashboard-insert-year-percentage))
(add-to-list 'dashboard-items '(year-percentage) t)

;(add-to-list 'dashboard-item-generators  '(todo-week . dashboard-insert-todo-week))
;(add-to-list 'dashboard-items '(todo-week) t)

;; (org-agenda-list)
