(add-to-list 'load-path "~/elisp/clojure-mode") 
(add-to-list 'load-path "~/elisp/swank-clojure") 
(add-to-list 'load-path "~/elisp/slime")
(add-to-list 'load-path "~/elisp/cider")
(add-to-list 'load-path "~/elisp/circe/lisp")
(autoload 'circe "circe" "Connect to an IRC server" t)
(load "~/elisp/secrets.el")
;;(load "~/elisp/rc/emacs-rc-clojure.el")

;;;;; Appearance

;; Color theme
(load "~/elisp/color-theme-github.el")

;; Remove gui
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Remove splash screen
(setq inhibit-splash-screen t)

;;;;; Key bindngs

(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

(define-key my-keys-minor-mode-map (kbd "M-;") 'execute-extended-command)
(define-key my-keys-minor-mode-map (kbd "C-;") ctl-x-map)

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

;; Key bindings
(my-keys-minor-mode 1)

;; Unset key bindings from minibuffer
(defun my-minibuffer-setup-hook ()
  (my-keys-minor-mode 0))
