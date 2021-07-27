;; exwm stuff goes here

;;(exwm-config-default)

(require 'exwm)
(require 'exwm-config)

;; Set the initial workspace number.
(unless (get 'exwm-workspace-number 'saved-value)
  (setq exwm-workspace-number 4))

;(exwm-config-default)

;; Make class name the buffer name
(add-hook 'exwm-update-class-hook
          (lambda ()
            (exwm-workspace-rename-buffer exwm-class-name)))

;; Global keybindings.
(unless (get 'exwm-input-global-keys 'saved-value)
  (setq exwm-input-global-keys
        `(
          ;; 's-r': Reset (to line-mode).
          ([?\s-r] . exwm-reset)
          ;; 's-w': Switch workspace.
          ([?\s-w] . exwm-workspace-switch)
          ([?\s-o] . other-window)
          ([?\s-x] . exwm-input-release-keyboard)
          ;; 's-&': Launch application.
          ([?\s-&] . (lambda (command)
                       (interactive (list (read-shell-command "$ ")))
                       (start-process-shell-command command nil command)))
          ([?\s-n] . (lambda ()
                       (interactive)
                       (start-process-shell-command
                        "nyxt" nil "nyxt")))
          ([?\s-f] . (lambda ()
                       (interactive)
                       (start-process-shell-command
                        "firefox" nil "firefox")))
          ([?\s-h] . (lambda ()
                       (interactive)
                       (shrink-window-horizontally)))
          ([?\s-l] . (lambda ()
                       (interactive)
                       (enlarge-window-horizontally)))
	  ([?\s-v] . (lambda ()
		       (interactive)
		       (if (equal (with-temp-buffer
				    (shell-command "xinput list-props 20 | awk 'NR==2{print $4}'"
						   t nil)
				    (goto-char (point-max))
				    (backward-delete-char 1)
				    (buffer-string))
				  "0")
			   (shell-command "xinput enable 20" nil)
			 (shell-command "xinput disable 20" nil))))
          ;; 's-N': Switch to certain workspace.
          ,@(mapcar (lambda (i)
                      `(,(kbd (format "s-%d" i)) .
                        (lambda ()
                          (interactive)
                          (exwm-workspace-switch-create ,i))))
                    (number-sequence 0 9)))))

(setq exwm-input-simulation-keys
      '(([?\C-b] . [left])
        ([?\C-f] . [right])
        ([?\C-p] . [up])
        ([?\C-n] . [down])
        ([?\C-a] . [home])
        ([?\C-e] . [end])
        ([?\M-v] . [prior])
        ([?\C-v] . [next])
        ([?\C-d] . [delete])
        ([?\C-k] . [S-end delete])
        ([?\M-w] . [C-c])
        ([?\C-y] . [C-v])
        ([?\M->] . [end])
        ([?\M-<] . [home])))

(exwm-enable)

;;; xrandr
(require 'exwm-randr)
(exwm-randr-enable)
(setq exwm-randr-workspace-monitor-plist '(0 "eDP" 1 "HDMI-A-0" 2 "eDP" 3 "HDMI-A-0" 4 "eDP"))

;;; When stating the client from .xinitrc, `save-buffer-kill-terminal' will ;;; force-kill Emacs before it can run through `kill-emacs-hook'.
(global-set-key (kbd "C-x C-c") 'save-buffers-kill-emacs)

(provide 'exwm-cfg)

;; (add-hook 'exwm-randr-screen-change-hook (lambda () (start-process-shell-command "autorandr" nil "autorandr --change")))

;; (start-process-shell-command "setxkbmap" nil "setxkbmap -layout us,ru -variant colemak, -option grp:ctrl_shift_toggle caps:ctrl ctrl:nocaps")

;; (start-process-shell-command "xinput" nil "xinput disable 20")

;; (start-process-shell-command "hsetroot" nil "hsetroot -cover /home/kassy/usr/img/1602892919300.jpg")

;; (require 'desktop-environment)
;; (desktop-environment-mode)

;; (global-set-key (kbd "s-h") 'enlarge-window-horizontally)
;; (global-set-key (kbd "s-l") 'shrink-window-horizontally)

;; b& telegram

;; (defun b&-messaging ()
;;   (let ((current-hour (string-to-number (format-time-string "%H"))))
;;     (when (>= 20 current-hour)
;;       (cond ((string-equal "TelegramDesktop" exwm-class-name)
;;              (start-process-shell-command "killing telegram"
;;                                           nil
;;                                           "pkill telegram"))))))

;; (add-hook 'exwm-manage-finish-hook 'b&-messaging)

;; (not (or (> 11 current-hour)
;;          (= 15 current-hour)
;;          (<= 22 current-hour)))

;; (string-equal "TelegramDesktop" exwm-class-name)

;; (start-process-shell-command "setxkbmap" nil "setxkbmap -layout us,ua -variant colemak, -option grp:ctrl_shift_toggle caps:ctrl ctrl:nocaps")
