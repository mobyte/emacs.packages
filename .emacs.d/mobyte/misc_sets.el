(setq visible-bell t)

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

;; command key to meta
(setq mac-command-modifier 'meta)

;; ido mode

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; smex

(require 'smex)
;; (global-set-key [(meta x)] (lambda ()
;;                              (interactive)
;;                              (or (boundp 'smex-cache)
;;                                  (smex-initialize))
;;                              (global-set-key [(meta x)] 'smex)
;;                              (smex)))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

;;;; set hotkey to switch frame
(defun go-to-next-frame ()
       (interactive)
       (other-frame 1))
;; (global-set-key (kbd "M-`") 'go-to-next-frame)
(global-set-key (kbd "M-§") 'go-to-next-frame)

(defun switch-to-nrepl-right ()
  (interactive)
  (let ((wnd (split-window-right)))
    (windmove-right)
    (set-window-buffer wnd "*nrepl*")))

;; (nrepl-switch-to-repl-buffer nil)

(global-set-key (kbd "C-x r") 'switch-to-nrepl-right)

(global-set-key (kbd "C-x p") 'previous-buffer)
(global-set-key (kbd "C-x n") 'next-buffer)

(global-set-key (kbd "C-1") 'windmove-left)
(global-set-key (kbd "C-2") 'windmove-right)
(global-set-key (kbd "C-3") 'windmove-up)
(global-set-key (kbd "C-4") 'windmove-down)

;;; set hotkey to next/prev paragraphs

(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)

;;; disable Ctrl-z

(global-set-key (kbd "C-z") nil)
(global-set-key (kbd "C-x C-z") 'nil)

;;; disable C-x C-c

;; (global-set-key (kbd "C-x C-c") nil)

;;; disable "RETURN" key

;; (global-set-key (kbd "<return>") 'ignore)

;;;; show current buffer filename

(defun buffer-info ()
  (interactive)
  (message (buffer-file-name)))

;;;; backup files settings

;; (Add-to-list 'backup-directory-alist
;;              (cons "." "~/.emacs.d/backups/"))

(setq backup-directory-alist `(("." . "~/.emacs.d/backups/")))
;; (setq backup-by-copying t)
;; (setq tramp-backup-directory-alist backup-directory-alist)

;; when new window arise automatically (errors, etc) allow only split window vertically 
(setq split-height-threshold 80)
(setq split-width-threshold 160)

;; kill window next to current

(defun kill-below-window ()
  (interactive)
  (windmove-down)
  (delete-window))

(defun kill-upper-window ()
  (interactive)
  (windmove-up)
  (delete-window))

(defun kill-right-window ()
  (interactive)
  (windmove-right)
  (delete-window))

(defun kill-left-window ()
  (interactive)
  (windmove-left)
  (delete-window))

(global-set-key (kbd "C-x M-k r") 'kill-right-window)
(global-set-key (kbd "C-x M-k l") 'kill-left-window)
(global-set-key (kbd "C-x M-k u") 'kill-upper-window)
(global-set-key (kbd "C-x M-k b") 'kill-below-window)

(defun kill-nrepl-error ()
  (interactive)
  (kill-buffer "*cider-error*"))

(global-set-key (kbd "C-x M-k e") 'kill-nrepl-error)

;;;; move n lines up/down

(defun n-lines-down ()
  (interactive)
  (dotimes (n 5 nil)
    (next-line)))

(defun n-lines-up ()
  (interactive)
  (dotimes (n 5 nil)
    (previous-line)))

(global-set-key (kbd "S-C-n") 'n-lines-down)
(global-set-key (kbd "S-C-p") 'n-lines-up)

;;;; scroll keys

(global-set-key [(meta right)] 'scroll-left)
(global-set-key [(meta left)] 'scroll-right)

(setq org-directory "/Users/emilyessenamanov/Documents/org")

(global-set-key (kbd "C-x M-k b") 'kill-below-window)

;; eshell

(defun cur-dir-git-branch-string (pwd)
  "Return current git branch as a string.
If PWD is in a git repo and the git command is found, then return the
current git branch as a string.  Otherwise return an empty string."
  (interactive)
  (when (and (eshell-search-path "git")
             (locate-dominating-file pwd ".git"))
    (let* ((git-cmd "git branch")
           (grep-cmd "grep '\\*'")
           (sed-cmd "sed -e 's/^\\* //'")
           (git-output (shell-command-to-string (concat git-cmd " | " grep-cmd " | " sed-cmd))))
      (concat "[git:"
              (if (> (length git-output) 0)
                  (substring git-output 0 -1)
                "(no branch)")
              "] "))))

;; Change the default eshell prompt

(setq eshell-prompt-function
      (lambda ()
        (concat ""
                (cur-dir-git-branch-string (eshell/pwd))
                ;; (propertize (concat "[" (getenv "USER") "@" system-name "] ")
                ;;             'face `(:foreground "darkblue"))
                (propertize (replace-regexp-in-string (concat "^" (getenv "HOME")) "~" (eshell/pwd))
                            'face `(:foreground "darkgreen"))
                (propertize (if (= (user-uid) 0) " #" " $")
                            'face `(:foreground "yellow"))
                (propertize " "
                            'face `(:foreground "white")))))

;;;; clear eshell buffer

(defun eshell-clear ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(global-set-key (kbd "C-x M-O") 'eshell-clear)
(global-set-key (kbd "C-z") 'undo)

;; (setq ac-use-menu-map t)
;; (define-key ac-menu-map "\C-n" 'ac-next)
;; (define-key ac-menu-map "\C-p" 'ac-previous)

;; (add-to-list 'yank-excluded-properties 'font)
;; (add-to-list 'yank-excluded-properties 'font-lock-face)
(setq yank-excluded-properties t)

;; auto completion keys

(require 'auto-complete-config)
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)

;; highlight line

;; (require 'hl-line+)
;; (toggle-hl-line-when-idle 1)
;; (global-hl-line-mode 1)
;; (flash-line-highlight 1)
;; (setq hl-line-flash-show-period 10)

;; (global-hl-line-mode 1)
;; (set-face-background 'hl-line "#3e4446")
;; (set-face-foreground 'highlight nil)

;; magit

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x C-g") 'magit-status)

(setq url-magit-cheatsheet "http://daemianmack.com/magit-cheatsheet.html")
(defun browse-magit-cheatsheet ()
  (interactive)
  (eww url-magit-cheatsheet))
