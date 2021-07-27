;; editing stuff goes here

;; 80 char column rule

(require 'column-marker "column-marker.el")

(add-hook 'prog-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'text-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'fundamental-mode-hook (lambda () (interactive) (column-marker-1 80)))

;; (add-hook 'prog-mode-hook (lambda () (interactive) (define-key paredit-mode-map "\M-k" 'backward-delete-char)))
(add-hook 'text-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; multiple cursors                                                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-c m c") 'mc/edit-lines)
(global-set-key (kbd "C-c n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c a") 'mc/mark-all-like-this)

;; zap to char
(global-unset-key (kbd "M-z"))
(global-set-key (kbd "M-z") 'zap-up-to-char)

(global-unset-key (kbd "<menu>"))
(global-set-key (kbd "<menu>") 'helm-M-x)

;; duplicate a line
(defun duplicate-line ()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (forward-line 1)
  (yank))
(global-unset-key (kbd "C-d"))
(global-set-key (kbd "C-c C-d") 'duplicate-line)
(global-set-key (kbd "<delete>") 'delete-char)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-c\C-k" 'kill-region)

(global-unset-key (kbd "C-M-s"))
(global-set-key (kbd "C-M-s") 'counsel-rg)

(defalias 'lf 'load-file)

(require 'vlf-setup)

(require 'setup-editing)

(global-company-mode t)

(add-hook 'prog-mode-hook 'auto-auto-indent-mode)
