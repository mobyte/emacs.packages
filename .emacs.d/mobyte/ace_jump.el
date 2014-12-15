(require 'ace-jump-mode)
(global-set-key (kbd "C-c SPC") 'ace-jump-char-mode)
;;(define-key global-map (kbd "C-x o") 'other-window)

(eval-after-load 'shell
  '(define-key shell-mode-map (kbd "C-c SPC") 'ace-jump-char-mode))
