;;;; emacs desktop notification center config goes here

(ednc-mode)

(defun stack-notifications (&optional hide)
  (mapconcat (lambda (notification)
               (let ((app-name (ednc-notification-app-name notification)))
                 (unless (member app-name hide)
                   (push app-name hide)
                   (ednc-format-notification notification))))
             (ednc-notifications) ""))

(nconc global-mode-string '((:eval (stack-notifications))))
(add-hook 'ednc-notification-presentation-functions
          (lambda (&rest _) (force-mode-line-update t)))
