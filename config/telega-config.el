;; 5:00 hrs of telegram per week

(defvar daily-telegram-time
  '((0 . "1 hour")
    (1 . "30 min")
    (2 . "30 min")
    (3 . "30 min")
    (4 . "30 min")
    (5 . "30 min")
    (6 . "1 hour 30 min")))

(add-hook 'telega-load-hook
	  (lambda ()
	    (run-at-time (cdr (assoc (current-day-of-week)
				     daily-telegram-time))
			 nil
			 (lambda ()
			   (setf (cdr (assoc (current-day-of-week)
					     daily-telegram-time))
				 "0 min")
			   (telega-kill t)))))

(defun current-day-of-week ()
  (calendar-day-of-week
   (let ((date (butlast (nthcdr 3 (decode-time)) 3)))
     (list (nth 1 date) (nth 0 date) (nth 2 date)))))
