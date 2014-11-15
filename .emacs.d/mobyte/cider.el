(defun cider-connection-infos (connection-buffer)
  (with-current-buffer (get-buffer connection-buffer)
    nrepl-endpoint))

(defun cider-current-connection-infos ()
  (cider-connection-infos (nrepl-current-connection-buffer)))

(defun cider-rotate-connection-list (connection-list)
  (append (rest connection-list)
          (list (first connection-list))))

(defun cider-show-current-connection ()
  (apply #'message
         "Active cider connection: Host=%s Port=%s"
         (cider-current-connection-infos)))

(defun cider-switch-to-next-connection ()
  (interactive)
  (setq nrepl-connection-list
        (cider-rotate-connection-list nrepl-connection-list))
  (cider-show-current-connection))

(global-set-key (kbd "C-c C-x n") 'cider-switch-to-next-connection)

(setq cider-repl-popup-stacktraces t)

(setq nrepl-buffer-name-show-port t)

(add-hook 'cider-repl-mode-hook 'paredit-mode)

;; Enable error buffer popping also in the REPL
(setq nrepl-popup-stacktraces-in-repl t)

(setq nrepl-popup-stacktraces t)

(setq cider-auto-select-error-buffer t)

(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-repl-mode))

;;; complete.el -- Auto completion

(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-start nil)

(define-key ac-completing-map "\M-/" 'ac-stop) ; use M-/ to stop completion
(define-key ac-mode-map (kbd "C-\\") 'auto-complete)
(define-key ac-completing-map (kbd "TAB") nil)
(define-key ac-completing-map (kbd "RET") 'ac-complete)
(define-key ac-completing-map (kbd "C-\\") 'ac-complete)

(require 'ac-cider)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-mode))


(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))

(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

(add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

;;; repl history

(setq cider-repl-history-size 1000)
(setq cider-repl-history-file (concat (getenv "HOME") "/.emacs.d/repl-history"))

(setq cider-repl-use-clojure-font-lock t)
;; (setq cider-repl-output-face t)
;; (setq cider-repl-input-face t)

(setq nrepl-log-messages t)
