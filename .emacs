(add-to-list 'load-path "~/elisp/clojure-mode") 
(add-to-list 'load-path "~/elisp/swank-clojure") 
(add-to-list 'load-path "~/elisp/slime")
(add-to-list 'load-path "~/elisp/cider")
(add-to-list 'load-path "~/elisp/circe/lisp")
(autoload 'circe "circe" "Connect to an IRC server" t)
(load "~/elisp/secrets.el")
;;(load "~/elisp/rc/emacs-rc-clojure.el")

;;;;; Key bindngs

(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

(define-key my-keys-minor-mode-map (kbd "M-;") 'execute-extended-command)
(define-key my-keys-minor-mode-map (kbd "C-;") 'Control-X-prefix)

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)

(my-keys-minor-mode 1)

;;;;; IRC

;; connect to irc

(defun irc ()
  "start irc client"
   (interactive)
   (circe "Bitlbee")
     (save-window-excursion
       (sleep-for 1)
       (set-buffer "localhost:6667")
       (with-circe-server-buffer
	 (biden)))
     (switch-to-buffer "&bitlbee"))

;; bitlbee identify

(defun biden ()
  "bitlebee identify"
  (interactive)
  (set-buffer "&bitlbee")
  (circe-server-send
   (format "PRIVMSG &bitlbee :identify %s"
	   bitlbee-passwd)))


;;;;;; minor modes

(my-keys-minor-mode 1)

(defun my-minibuffer-setup-hook ()
  (my-keys-minor-mode 0))
