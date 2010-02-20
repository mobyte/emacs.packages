;; Other places to find .el files
(add-to-list 'load-path "~/emacs.d")

; general settings
(load-file "~/.emacs.d/mobyte/misc_sets.el")
; config indent
(load-file "~/.emacs.d/mobyte/mobindent.el")
; slime
(load-file "~/.emacs.d/mobyte/slime_opts.el")
; xml parsing (xmllint)
(load-file "~/.emacs.d/mobyte/xml-parsing.el")
; clipboard
(load-file "~/.emacs.d/mobyte/clipboard.el")
;  automatically detect coding system with Enca
;;(load-file "~/.emacs.d/mobyte/auto-enca.el")
; function for recode buffer 2 given charset
(load-file "~/.emacs.d/mobyte/mobrecode.el")
; mode for notes
(load-file "~/.emacs.d/mobyte/mobnote-mode.el")
; load org-mode settings
(load-file "~/.emacs.d/mobyte/org-mode-conf.el")
; some actions on start
(load-file "~/.emacs.d/mobyte/start_actions.el")

(load "/home/mobyte/src/emacs/haskell-mode-2.4/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'font-lock-mode)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-battery-mode nil)
 '(display-time-mode nil)
 '(global-font-lock-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(ispell-program-name "/usr/bin/aspell")
 '(make-backup-files nil)
 '(org-agenda-files (quote ("~/tmp/1.org")))
 '(show-paren-mode t)
 '(show-paren-style (quote parenthesis))
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
