;; misc settings
(custom-set-variables
;; '(inverse-video t)
 '(column-number-mode t)
 '(display-battery-mode nil)
 '(display-time-mode nil)
 '(global-font-lock-mode t)
 '(indent-tabs-mode nil)
 '(ispell-program-name "/usr/bin/aspell")
 '(make-backup-files nil)
 '(show-paren-mode t)
 '(show-paren-style (quote parenthesis))
 '(transient-mark-mode t)
 '(inhibit-splash-screen t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))

(set-default-font "Monaco 16")
(set-background-color "black")
(set-face-background 'default "black")
(set-face-background 'region "black")
(set-face-foreground 'default "white")
(set-face-foreground 'region "gray60")
(set-foreground-color "white")
(set-cursor-color "red")
;;(global-hl-line-mode 1)
;;(set-face-background 'hl-line "#330")
(set-face-background 'region "#134F78")

(menu-bar-mode nil)
;;(scroll-bar-mode nil)
(tool-bar-mode 0)

;; disabled hot keys
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)

(global-set-key (kbd "C-<home>") 'beginning-of-buffer)
(global-set-key (kbd "C-<end>") 'end-of-buffer)

(add-hook 'text-mode-hook 'turn-on-auto-fill)

(setq browse-url-browser-function 'browse-url-generic browse-url-generic-program "opera")

(setq default-buffer-file-coding-system 'utf-8)
(setq default-input-method 'russian-computer)


