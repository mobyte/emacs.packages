;;; complete.el -- Auto completion

(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-start nil)

(define-key ac-completing-map "\M-/" 'ac-stop) ; use M-/ to stop completion
(define-key ac-mode-map (kbd "C-\\") 'auto-complete)
(define-key ac-completing-map (kbd "TAB") nil)
(define-key ac-completing-map (kbd "RET") 'ac-complete)
(define-key ac-completing-map (kbd "C-\\") 'ac-complete)

(require 'ac-nrepl)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-interaction-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-mode))


(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))

(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

(add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-interaction-mode-hook 'set-auto-complete-as-completion-at-point-function)

(add-hook 'cider-interaction-mode-hook 'cider-turn-on-eldoc-mode)

;; Enable error buffer popping also in the REPL
(setq nrepl-popup-stacktraces-in-repl t)

(setq nrepl-popup-stacktraces t)
