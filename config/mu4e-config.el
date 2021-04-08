;; mu4e

(setq mu4e-contexts
      `( ,(make-mu4e-context
           :name "dmemeware"
           :match-func (lambda (msg)
                         (when msg
                           (string-prefix-p "/dmemeware"
                                            (mu4e-message-field msg :maildir))))
           :vars '((mu4e-trash-folder . "/defunemailnil@memeware.net/dmemeware.Trash")
                   (mu4e-refile-folder . "/defunemailnil@memeware.net/dmemeware.Archive")))
         ,(make-mu4e-context
           :name "3057dismail"
           :match-func (lambda (msg)
                         (when msg
                           (string-prefix-p "/3057dismail"
                                            (mu4e-message-field msg :maildir))))
           :vars '((mu4e-trash-folder . "/3057@dismail.de/3057dismail.Trash")
                   (mu4e-refile-folder . "/3057@dismail.de/3057dismail.Archive")))))

(setq mu4e-get-mail-command "offlineimap -o"
      mu4e-update-interval 300
      mu4e-attachment-dir "~/mail/dl/")

(require 'mml2015)
(require 'epa-file)

(defun encrypt-message (&optional arg)
  (interactive "p")
  (mml-secure-message-encrypt-pgp))

(defun decrypt-message (&optional arg)
  (interactive "p")
  (epa-decrypt-armor-in-region (point-min) (point-max)))

(defalias 'ec 'encrypt-message)
(defalias 'dc 'decrypt-message)
