;;* emacs packages config
(require 'package)

;; (add-to-list 'package-archives 
;;     '("marmalade" .
;;       "http://marmalade-repo.org/packages/"))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
;; (add-to-list 'package-archives
;;              '("melpa" . "http://melpa.org/packages/") t)
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;; (add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)


;; (when (boundp 'package-pinned-packages)
;;   (setq package-pinned-packages
;;                 '((bm                 . "marmalade")
;;                   (smex               . "melpa-stable")
;;                   (zenburn-theme      . "melpa-stable")
;;                   (anti-zenburn-theme . "melpa-stable")
;;                   (zen-and-art-theme  . "marmalade")
;;                   (cider              . "melpa-stable")
;;                   (clojure-mode       . "melpa-stable")
;;                   (htmlize            . "marmalade")
;;                   (rainbow-delimiters . "melpa-stable")
;;                   ;; "unstable" package
;;                   (icicles            . "melpa"))))

(package-initialize)

;; Other places to find .el files
(add-to-list 'load-path "~/.emacs.d/opt")

;;* outline config

(eval-after-load "outline"
  '(progn
     (define-key outline-minor-mode-map
       [(shift control n)] 'outline-next-visible-heading)
     (define-key outline-minor-mode-map
       [(shift control p)] 'outline-previous-visible-heading)
     (define-key outline-minor-mode-map
       [(tab)] 'org-cycle)
     (define-key outline-minor-mode-map
       [(meta o)] 'outline-toggle-children)
     (outline-hide-sublevels 1)))

(add-hook 'outline-minor-mode-hook
          (lambda ()
            (set (make-local-variable 'outline-regexp)
                 "^;;\\*+")
            (set (make-local-variable 'outline-level)
                 (lambda ()
                   (let ((len (- (match-end 0) (match-beginning 0))))
                     (- len 2))))))

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (outline-minor-mode 1)
            (outline-hide-sublevels 1)))

;;* shell path

(setenv "BOOT_JVM_OPTIONS" "-XX:-OmitStackTraceInFastThrow")
(setenv "EDITOR" "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient")
(setq explicit-shell-file-name "/usr/local/bin/bash")
(exec-path-from-shell-initialize)

(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)
(exec-path-from-shell-copy-envs '("LC_ALL"))

;;* general settings

(setq visible-bell t)
(setq visible-bell nil) ;; The default
(setq ring-bell-function 'ignore)

(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

;;* custom settings

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(company-ghc-show-info t)
 '(display-battery-mode nil)
 '(display-time-mode nil)
 '(global-font-lock-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(ispell-program-name "/usr/bin/aspell")
 '(make-backup-files nil)
 '(org-agenda-files (quote ("~/tmp/1.org")))
 '(org-file-apps
   (quote
    (("pdf" . "kpdf %s")
     ("docx" . "soffice %s")
     ("xlsx" . "soffice %s")
     ("pptx" . "soffice %s")
     ("doc" . "soffice %s")
     ("xls" . "soffice %s")
     ("ppt" . "soffice %s")
     ("ods" . "soffice %s")
     ("odw" . "soffice %s")
     ("odp" . "soffice %s")
     ("pdf" . "acroread %s"))))
 '(package-selected-packages
   (quote
    (groovy-mode undo-tree edn ag diminish diff-hl highlight-symbol ob-clojurescript org-bullets reverse-theme avy git-messenger highlight-parentheses aggressive-indent use-package yaml-mode company-cabal company-quickhelp magit magit-popup zoom-frm smex shell-command projectile key-chord htmlize exec-path-from-shell company clj-refactor auto-complete auto-compile)))
 '(show-paren-mode t)
 '(show-paren-style (quote parenthesis))
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))

(load-theme 'reverse t)

(set-frame-font "Monaco 16")
;; (set-default-font "Monaco 16")
;; (set-background-color "black")
;; (set-face-background 'default "black")
;; (set-face-background 'region "black")
;; (set-face-foreground 'default "white")
;; (set-face-foreground 'region "gray60")
;; (set-foreground-color "white")
;; (set-cursor-color "white")
;; (set-face-background 'region "#134F78")
;;;;(global-hl-line-mode 1)
;;;;(set-face-background 'hl-line "#330")

(setq mode-require-final-newline nil)
(setq require-final-newline nil)

;;* zoom in/out
(require 'zoom-frm)

(defun default-font ()
  (interactive)
  (set-face-attribute 'default nil
                      :family "Monaco"
                      :height 160))

(default-font)

(define-key ctl-x-map [(control ?+)] 'zoom-in/out)
(define-key ctl-x-map [(control ?-)] 'zoom-in/out)
(define-key ctl-x-map [(control ?=)] 'zoom-in/out)
(define-key ctl-x-map [(control ?0)] 'default-font)
(global-set-key (vector (list 'control mouse-wheel-down-event)) 'zoom-in)
(global-set-key (vector (list 'control mouse-wheel-up-event))   'zoom-out)
(global-set-key [S-mouse-1]    'zoom-in)
(global-set-key [C-S-mouse-1]  'zoom-out)
;; Get rid of `mouse-set-font' or `mouse-appearance-menu':
(global-set-key [S-down-mouse-1] nil)

;;* disable emacs gui elements

(menu-bar-mode nil)
;;(scroll-bar-mode nil)
(tool-bar-mode 0)

;;* coding system

(setq default-buffer-file-coding-system 'utf-8)
(setq default-input-method 'russian-computer)

;;* external programms settings
(setq browse-url-browser-function 'browse-url-generic browse-url-generic-program "opera")
;;* ido mode

(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(global-set-key (kbd "C-x C-b") nil)

;; (make-local-variable 'ido-decorations)
;; (setf (nth 2 ido-decorations) " | ") ;; "\n" | default " | "
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)
(setq max-mini-window-height 0.5) ;; 0.5 | default 0.25

;;* smex

(require 'smex)
;; (global-set-key [(meta x)] (lambda ()
;;                              (interactive)
;;                              (or (boundp 'smex-cache)
;;                                  (smex-initialize))
;;                              (global-set-key [(meta x)] 'smex)
;;                              (smex)))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;;* general keybinding settings

;; disabled hot keys
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)

(global-set-key (kbd "C-<home>") 'beginning-of-buffer)
(global-set-key (kbd "C-<end>") 'end-of-buffer)

;; command key to meta
(setq mac-command-modifier 'meta)
(setq mac-right-command-modifier 'meta)
(setq ns-right-alternate-modifier 'left)

;; set hotkey to switch frame
(defun go-to-next-frame ()
       (interactive)
       (other-frame 1))
;; (global-set-key (kbd "M-`") 'go-to-next-frame)
(global-set-key (kbd "M-§") 'go-to-next-frame)

;; set hotkey to next/prev paragraphs

(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)

;; disable Ctrl-z

(global-set-key (kbd "C-z") nil)
(global-set-key (kbd "C-x C-z") 'nil)

;;* show current buffer filename

(defun buffer-info ()
  (interactive)
  (message (buffer-file-name)))

;;* backup files settings

;; (Add-to-list 'backup-directory-alist
;;              (cons "." "~/.emacs.d/backups/"))

(setq backup-directory-alist `(("." . "~/.emacs.d/backups/")))
;; (setq backup-by-copying t)
;; (setq tramp-backup-directory-alist backup-directory-alist)

;;* navigation

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

;;* window management

(global-set-key (kbd "C-x p") 'previous-buffer)
(global-set-key (kbd "C-x n") 'next-buffer)

(global-set-key (kbd "C-1") 'windmove-left)
(global-set-key (kbd "C-2") 'windmove-right)
(global-set-key (kbd "C-3") 'windmove-up)
(global-set-key (kbd "C-4") 'windmove-down)

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

;;* shell settings

;; eshell

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

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
                ;; (cur-dir-git-branch-string (eshell/pwd))
                ;; (propertize (concat "[" (getenv "USER") "@" system-name "] ")
                ;;             'face `(:foreground "darkblue"))
                (propertize (replace-regexp-in-string (concat "^" (getenv "HOME")) "~" (eshell/pwd))
                            'face `(:foreground "darkgreen"))
                (propertize (if (= (user-uid) 0) " #" " $")
                            'face `(:foreground "yellow"))
                (propertize " "
                            'face `(:foreground "white")))))


;; (defadvice ansi-term (after advice-term-line-mode activate)
;;   (term-line-mode))

(defun clear-shell-buffer ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer))
  (term-send-raw-string "clear\n"))

(eval-after-load "term"
  (lambda ()
    (define-key term-raw-map
      (kbd "C-y") 'term-paste)
    (define-key term-mode-map
      (kbd "C-x M-O") 'clear-shell-buffer)))

;; turn off shell command echo

(defun my-comint-init () 
  (setq comint-process-echoes t))

(add-hook 'comint-mode-hook 'my-comint-init)

;;* clear buffer

(defun clear-buffer ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(global-set-key (kbd "C-x M-O") 'clear-buffer)

;;* yank settings
;; (add-to-list 'yank-excluded-properties 'font)
;; (add-to-list 'yank-excluded-properties 'font-lock-face)
(setq yank-excluded-properties t)

;;* auto completion keys

;; (require 'auto-complete-config)
;; (define-key ac-completing-map (kbd "C-n") 'ac-next)
;; (define-key ac-completing-map (kbd "C-p") 'ac-previous)

;;* highlight symbol
(require 'highlight-symbol)

(defvar highlighted-buffers (make-hash-table :test 'equal))

(defun highlighted-buffer-p ()
  (gethash (current-buffer) highlighted-buffers))

(defun remember-highlighted-buffer ()
  (puthash (current-buffer) t highlighted-buffers))

(defun forget-highlighted-buffer ()
  (remhash (current-buffer) highlighted-buffers))

(defun toggle-highlighted-symbol (&optional symbol)
  (interactive)
  (if (highlighted-buffer-p)
      (progn (highlight-symbol-remove-all)
             (forget-highlighted-buffer))
    (progn (highlight-symbol symbol)
           (remember-highlighted-buffer))))

(global-set-key (kbd "M-h") 'toggle-highlighted-symbol)
(global-set-key (kbd "M-H") 'highlight-symbol-query-replace)
;; (global-set-key [(control f3)] 'highlight-symbol)
;; (global-set-key [f3] 'highlight-symbol-next)
;; (global-set-key [(shift f3)] 'highlight-symbol-prev)
;; (global-set-key [(meta f3)] 'highlight-symbol-query-replace)
;;* highlight line

;; (require 'hl-line+)
;; (toggle-hl-line-when-idle 1)
;; (global-hl-line-mode 1)
;; (flash-line-highlight 1)
;; (setq hl-line-flash-show-period 10)

;; (global-hl-line-mode 1)
;; (set-face-background 'hl-line "#3e4446")
;; (set-face-foreground 'highlight nil)

;;* magit

(global-set-key (kbd "C-x g") 'magit-status)

(setq url-magit-cheatsheet "http://daemianmack.com/magit-cheatsheet.html")
(defun browse-magit-cheatsheet ()
  (interactive)
  (eww url-magit-cheatsheet))

(defun magit-commit-mode-hook-fn ()
  (turn-off-auto-fill))

(add-hook 'git-commit-mode-nhook 'magit-commit-mode-hook-fn)

(setq git-commit-summary-max-length 120)
(setq magit-push-always-verify nil)

;; *magit-refs*: checkout the ref (branch) on RETURN.
(setq magit-visit-ref-behavior '(checkout-any focus-on-ref))

(require 'magit)
(magit-define-popup-switch 'magit-log-popup ?f "first parent" "--first-parent")

;;* paredit
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code."
  t)

(eval-after-load "paredit"
  '(progn
     (define-key paredit-mode-map (kbd "M-[") 'paredit-wrap-square)
     (define-key paredit-mode-map (kbd "M-{") 'paredit-wrap-curly)
     (define-key paredit-mode-map (kbd "M-]") 'paredit-close-square-and-newline)
     (define-key paredit-mode-map (kbd "M-}") 'paredit-close-curly-and-newline)))

(add-hook 'nrepl-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'nrepl-mode-hook             (lambda () (paredit-mode +1)))

(mapc (lambda (hook) (add-hook hook (lambda ()
                                      (paredit-mode +1))))
      '(clojure-mode-hook
        slime-repl-mode-hook
        lisp-mode-hook
        emacs-lisp-mode-hook
        scheme-mode-hook
        t-mode-hook))

;;;; repl mode

;;(add-hook 'clojure-mode-hook 'projectile-mode)

(defun setup-slime-repl-paredit ()
  (define-key cider-repl-mode-map
    (kbd "DEL") 'paredit-backward-delete)
  (define-key cider-repl-mode-map
    (kbd "{") 'paredit-open-curly)
  (define-key cider-repl-mode-map
    (kbd "}") 'paredit-close-curly)
  (modify-syntax-entry ?\{ "(}")
  (modify-syntax-entry ?\} "){")
  (modify-syntax-entry ?\[ "(]")
  (modify-syntax-entry ?\] ")[")
  (modify-syntax-entry ?~ "'   ")
  (modify-syntax-entry ?, "    ")
  (modify-syntax-entry ?^ "'")
  (modify-syntax-entry ?= "'"))

(add-hook 'cider-repl-mode-hook 'setup-slime-repl-paredit)
;(add-hook 'slime-nrepl-mode-hook 'setup-slime-repl-paredit)
;(add-hook 'slime-cider-mode-hook 'setup-slime-repl-paredit)

;;;;(add-hook 'clojure-mode-hook 'setup-clojure-mode-paredit)

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

;; (setq cider-repl-pop-to-buffer-on-connect nil)

;; (setq cider-repl-popup-stacktraces t)
;; (setq cider-show-error-buffer 'except-in-repl)
(setq cider-show-error-buffer t)

(global-set-key (kbd "C-c C-x n") 'cider-visit-error-buffer)

(setq nrepl-buffer-name-show-port t)

(add-hook 'cider-repl-mode-hook 'paredit-mode)

;; Enable error buffer popping also in the REPL
(setq nrepl-popup-stacktraces-in-repl t)

(setq nrepl-popup-stacktraces t)

(setq cider-auto-select-error-buffer t)

(setq nrepl-sync-request-timeout nil)

;; skip the cider's welcome message
(setq cider-repl-display-help-banner nil)

(setq cider-known-endpoints
      '(("host-a" "localhost" "4001")))

(defun connect-oms (&optional params)
  (interactive)
  (cider-connect '(:host "localhost"
                   :port 4001
                   :project-dir "/Users/mobyte/repos/rewe-order-service")))

;; clj-refactor-mode

(unless (fboundp 'seq-map-indexed)
  (defun seq-map-indexed ()))

(require 'clj-refactor)

;; (use-package aggressive-indent
;;   :ensure t)

(defun my-clojure-mode-hook ()
  (clj-refactor-mode 1)
  ;; do not group required namespaces by prefix
  ;; (setq cljr-favor-prefix-notation nil)
  ;; do not warn
  (setq cljr-warn-on-eval t)
  ;; (setq cljr-eagerly-build-asts-on-startup t)
  ;; (setq cljr-warn-on-analyzer-needs-eval nil)
  (yas-minor-mode 1) ; for adding require/use/import statements
  ;; This choice of keybinding leaves cider-macroexpand-1 unbound
  (cljr-add-keybindings-with-prefix "C-c C-r"))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)
;; (add-hook 'clojure-mode-hook #'aggressive-indent-mode)

;; auto complete

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(add-hook 'clojure-mode-hook #'eldoc-mode)

(require 'company-etags)
(add-to-list 'company-etags-modes 'clojure-mode)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; (define-key company-active-map (kbd "C-n") 'company-complete-common-or-cycle)
;; (define-key company-active-map (kbd "C-p") 'company-complete-common-or-previous-cycle)

(require 'color)
(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face :background ,(color-lighten-name bg 25)))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))

;; (require 'auto-complete-config)

;; (eval-after-load "auto-complete"
;;   '(add-to-list 'ac-modes 'cider-repl-mode))

;; (ac-config-default)
;; (setq ac-auto-start nil)

;; (define-key ac-completing-map "\M-/" 'ac-stop) ; use M-/ to stop completion
;; (define-key ac-mode-map (kbd "C-\\") 'auto-complete)
;; (define-key ac-completing-map (kbd "TAB") nil)
;; (define-key ac-completing-map (kbd "RET") 'ac-complete)
;; (define-key ac-completing-map (kbd "C-\\") 'ac-complete)

;; (require 'ac-cider)
;; (add-hook 'cider-mode-hook 'ac-cider-setup)
;; (add-hook 'cider-mode-hook 'ac-flyspell-workaround)
;; (add-hook 'cider-repl-mode-hook 'ac-cider-setup)
;; (eval-after-load "auto-complete"
;;   '(progn
;;      (add-to-list 'ac-modes 'cider-mode)
;;      (add-to-list 'ac-modes 'cider-repl-mode)))

;; (defun set-auto-complete-as-completion-at-point-function ()
;;   (setq completion-at-point-functions '(auto-complete)))

;; (add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
;; (add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)

;; (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

;;; repl history

(setq cider-repl-history-size 1000)
(setq cider-repl-history-file (concat (getenv "HOME") "/.emacs.d/repl-history"))

(setq nrepl-hide-special-buffers t)
(setq cider-repl-use-clojure-font-lock t)

(add-hook 'cider-repl-mode-hook 'clojure-font-lock-setup)
(add-hook 'cider-repl-mode-hook #'eldoc-mode)

;;(setq cider-repl-output-face t)
;;(setq cider-repl-input-face t)

;; pretty print REPL output
(setq cider-repl-use-pretty-printing nil)

(setq nrepl-log-messages t)

(require 'eldoc)
(setq eldoc-idle-delay 0)
(setq eldoc-echo-area-use-multiline-p t)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
;; (define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)

(require 'clojure-mode)

(eval-after-load 'clojure-mode
  '(define-clojure-indent
     (wrap-result 'defun)
     (handle-error 'defun)
     (context-defn 'defun)
     (context-fn 'defun)
     (context-fn-stub 'defun)
     (defroutes 'defun)
     (testing 'defun)
     (feature 'defun)
     (scenario 'defun)
     (cond-let 'defun)
     (if-with-open 'defun)
     (when-let* 'defun)
     (fnk 'defun)
     (fact 'defun)
     (facts 'defun)
     (conditional 'defun)
     (wrap-clean-transaction 'defun)
     (GET 2)
     (POST 2)
     (PUT 2)
     (DELETE 2)
     (HEAD 2)
     (ANY 2)
     (context 2)))

;; (defun restart-repl ()
;;   (interactive)
;;   (cider-quit)
;;   (cider-jack-in))

(require 'ob-clojure)
(require 'ob-shell)

;; use CIDER as the Clojure execution backend
(setq org-babel-clojure-backend 'cider)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)
   (clojure . t)))

(setq org-confirm-babel-evaluate nil)

;; Useful keybindings when using Clojure from Org
;; (org-defkey org-mode-map (kbd "C-x C-e") 'cider-eval-last-sexp)
;; (org-defkey org-mode-map (kbd "C-c C-d") 'cider-doc)

;; No timeout when executing calls on Cider via nrepl
;; (setq org-babel-clojure-sync-nrepl-timeout nil)

;; let `ob-clojure' babel src blocks allow evaluation.
(add-to-list 'org-babel-default-header-args:clojure
             '(:eval . "yes"))
(add-to-list 'org-babel-default-header-args:clojure
             '(:results . "output"))
;; (add-to-list 'org-babel-default-header-args:clojure
;;              '(:show-process . t))


;;* ivy mode
;; (ivy-mode 1)
;;;;(setq ivy-use-virtual-buffers t)
;;;;(setq enable-recursive-minibuffers t)
;; (global-set-key "\C-s" 'swiper)
;; (global-set-key (kbd "C-c C-r") 'ivy-resume)
;; (global-set-key (kbd "<f6>") 'ivy-resume)
;; (global-set-key (kbd "M-x") 'counsel-M-x)
;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;;;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
;;;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;;;; (global-set-key (kbd "<f1> l") 'counsel-find-library)
;;;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;;;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;; (global-set-key (kbd "C-c g") 'counsel-git)
;; (global-set-key (kbd "C-c j") 'counsel-git-grep)
;; (global-set-key (kbd "C-c k") 'counsel-ag)
;; (global-set-key (kbd "C-x l") 'counsel-locate)
;; (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;; (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
;; (define-key projectile-mode-map (kbd "C-c p") 'counsel-projectile-command-map)

;;* projectile
(projectile-global-mode)

(eval-after-load "projectile"
  '(progn
     (projectile-mode +1)
     (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
     (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
     ;;(define-key projectile-mode-map  (kbd "C-c p f") 'projectile-find-file)
     ))
;;* ibuffer

(require 'ibuffer)

(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("Shell"
                (mode . eshell-mode))
               ("REPL"
                (name . "^\\*slime-repl.*\\*$"))
               ("Clojure"
                (name . "^.*\\.clj$"))
               ("Lisp"
                (name . "^.*\\.lisp$"))
               ("Emacs lisp"
                (name . "^.*\\.el$"))
               ("Dired"
                (mode . dired-mode))
               ("Egg"
                (name . "^.*\.git.*$"))
               ("SpecialBuffers" 
                ;;(or (name . "^\\*scratch\\*$")
                ;;(name . "^\\*Warnings\\*$")
                ;;(name . "^\\*Completions\\*$")
                ;;(name . "^\\*Messages\\*$"))
                (name . "^\\*.*\\*$"))
               ("org" 
                (mode . org-mode))
               ("planner" 
                                        ;(or (name . "^\\*Calendar\\*$")                        
                (name . "^diary$"))
               ))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

;; (global-set-key (kbd "C-x <down>") 'ibuffer)
;; (global-set-key (kbd "C-x x") 'ibuffer)
;;(global-set-key (kbd "C-x C-b") 'ibuffer)

;;* ace jump and avy

;; (require 'ace-jump-mode)
;; (setq key-chord-one-key-delay 0.16)

;; (key-chord-define-global "jf" 'ace-jump-mode)
;; (key-chord-define-global "fj" 'ace-jump-mode)
;;(key-chord-define-global "jj" 'ace-jump-char-mode)

(key-chord-define-global "jf" 'avy-goto-word-1)
(key-chord-define-global "fj" 'avy-goto-word-1)

(key-chord-mode 1)

(global-set-key (kbd "C-c SPC") 'ace-jump-char-mode)
;;(define-key global-map (kbd "C-x o") 'other-window)

(eval-after-load 'shell
  '(define-key shell-mode-map (kbd "C-c SPC") 'ace-jump-char-mode))

;;* xml parsing (xmllint)

;; (defun parse_xml ()
;;   (interactive)
;;   (xml-mode)
;;   (mark-whole-buffer)
;;   (universal-argument)
;;   (shell-command-on-region (point-min) (point-max) "xmllint --format -" 'current 'yes ) )

;; (global-set-key (kbd "C-`") 'parse_xml)
;; (global-set-key (kbd "C-`") nil)

;;* clipboard for X

;; (defun paste-clipboard ()
;;   (interactive)
;;   (set-clipboard-coding-system 'utf-8)
;;   (insert (x-get-selection 'CLIPBOARD 'UTF8_STRING)))

;; (defun copy-clipboard ()
;;   (interactive)
;;   (set-clipboard-coding-system 'utf-8)
;;   (x-set-selection 'CLIPBOARD 
;;                    (buffer-substring (region-beginning) (region-end)))
;;   (keyboard-quit))

;; (global-set-key (kbd "C-x y") 'paste-clipboard)
;; (global-set-key (kbd "C-x w") 'copy-clipboard)

;;* function for recode buffer 2 given charset

;; (defun recode-buffer-safe (target-coding-system)
;;   "* Recode buffer as if it were encoded with `target-coding-system'.
;; If current buffer is write-protected (`buffer-read-only'), do nothing."
;;   (interactive "zEnter target coding system: ")
;;   (unless buffer-read-only
;;     (encode-coding-region (point-min)
;;                           (point-max)
;;                           buffer-file-coding-system)
;;     (decode-coding-region (point-min)
;;                           (point-max)
;;                           target-coding-system)
;;     (set-buffer-file-coding-system target-coding-system)))

;;* mode for notes
;; (load-file "~/.emacs.d/mobyte/mobnote-mode.el")
;;* load org-mode settings

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-directory "/Users/mobyte/Documents/org")

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(customize-set-variable 'org-file-apps
                        '(("pdf" . "kpdf %s")
                          ("docx" . "soffice %s")
                          ("xlsx" . "soffice %s")
                          ("pptx" . "soffice %s")
                          ("doc"  . "soffice %s")
                          ("xls"  . "soffice %s")
                          ("ppt"  . "soffice %s")
                          ("ods"  . "soffice %s")
                          ("odw" . "soffice %s")
                          ("odp" . "soffice %s")
                          ("pdf" . "acroread %s")))

;local settings applies by 
;#+SEQ_TODO: TODO WAITING DONE
(setq org-todo-keywords
       '((sequence "TODO" 
                   "WAITING" 
                   "INPROGRESS" 
                   "DELEGATED" 
                   "DONE")))

;local settings applies by 
;#+STARTUP: showstars
;#+STARTUP: hidestars
(setq org-hide-leading-stars t)
(setq org-startup-indented t)

(setq org-agenda-start-on-weekday 1)
(setq calendar-week-start-day 1)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cr" 'org-remember)
;(define-key global-map "\C-cr" 'remember)
(setq org-log-done t)

;(org-remember-insinuate)
(setq org-remember-templates
      '(("Todo" ?t "* %U %?" "~/temp/notes_dir/tasks.org" "úÁÍÅÔËÉ ÎÁ ÐÏÐÏÚÖÅ ÒÁÚÏÂÒÁÔØ")))
;      '(("Todo" ?t "** %U %^{Summary}\n%?" "~/temp/notes_dir/tasks.org" "úÁÍÅÔËÉ ÎÁ ÐÏÐÏÚÖÅ ÒÁÚÏÂÒÁÔØ")))

;;(setq truncate-lines t)
;;(setq org-startup-truncated nil)



;;(defun mob-insert-current-time ()
;; (interactive)
;; (org-insert-item)
;; (org-insert-time-stamp (current-time) 'with-hm 'inactive))

;;(global-set-key (kbd "C-x <up>") 'mob-insert-current-time)
;;(global-set-key (kbd "C-x <up>") nil)

;;* custom set variables and faces


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-scrollbar-bg ((t (:background "#199919991999"))))
 '(company-scrollbar-fg ((t (:background "#0ccc0ccc0ccc"))))
 '(company-tooltip ((t (:inherit default))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
 '(company-tooltip-selection ((t (:inherit font-lock-function-name-face :background "#3fff3fff3fff")))))

;;* some actions on start

;; kill *scratch* buffer
(kill-buffer "*scratch*")

; kill all buffers

;(defun nuke-all-buffers ()
;  "kill all buffers"
;  (interactive)
;  (mapcar (lambda (x) (kill-buffer x))
;	  (buffer-list))
;  (delete-other-windows))

(cd "~/")
(server-start)

;;* presentation toggle

(defun switch-to-presentation ()
  (interactive)
  (if (equal (current-buffer) (get-buffer "*presentation*"))
      (jump-to-register 113)
      (progn (window-configuration-to-register 113)
             (jump-to-register 112))))

(global-set-key (kbd "C-x C-x") 'switch-to-presentation)

;;* initial execution

(split-window-right)
(other-window 1)

;(setq display-buffer-alist '(("\\`\\*e?shell" display-buffer-same-window)))

;; Open shell in default project directory
(let ((default-directory (shell-command-to-string ". ~/.bashrc; echo -n $CURRENT_PROJECT")))
  (when (not (string= "" default-directory))
    (shell)))

;;* align whitespace

(defun align-whitespace (start end)
  (interactive "r")
  (align-regexp start end "\\(\\s-*\\)\\s-" 1 0 t)
  ;;(indent-region start end)
  )
;;* mode line
(setq mode-line-position
      '(;; %p print percent of buffer above top of window, o Top, Bot or All
        ;; (-3 "%p")
        ;; %I print the size of the buffer, with kmG etc
        ;; (size-indication-mode ("/" (-4 "%I")))
        ;; " "
        ;; %l print the current line number
        ;; %c print the current column
        (line-number-mode ("%l" (column-number-mode ":%c")))))

(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat ".../" output)))
    output))

(defvar mode-line-directory
  '(:propertize
    (:eval (if (buffer-file-name) (concat " " (shorten-directory default-directory 20)) " ")))
  "Formats the current directory.")

(defvar mode-line-git-current-branch
  '(:propertize
    (:eval (concat " " "hello")))
  "current branch")

(put 'mode-line-directory 'risky-local-variable t)

(setq-default mode-line-buffer-identification
              (propertized-buffer-identification "%b "))

(setq-default mode-line-format
              '("%e"
                mode-line-front-space
                ;; mode-line-mule-info -- I'm always on utf-8
                ;; mode-line-client
                mode-line-modified
                ;; mode-line-remote -- no need to indicate this specially
                ;; mode-line-frame-identification -- this is for text-mode emacs only
                " "
                mode-line-directory
                mode-line-buffer-identification
                " "
                mode-line-git-current-branch
                mode-line-position
                ;; (vc-mode vc-mode)  -- I use magit, not vc-mode
                ;; (flycheck-mode flycheck-mode-line)
                " "
                mode-line-modes
                ;;mode-line-misc-info
                mode-line-end-spaces))

(require 'diminish)

(diminish 'projectile-mode "prj")
(diminish 'paredit-mode "()")
(diminish 'eldoc-mode)
(diminish 'cider-mode "cider")
;;* prettify
;; (global-prettify-symbols-mode 1)

;; (add-hook 'clojure-mode-hook
;;             (lambda ()
;;               (push '("fn"  . ?λ) prettify-symbols-alist)
;;               (push '("defn"  . ?λ) prettify-symbols-alist)
;;               (push '("s/defn"  . ?Λ) prettify-symbols-alist)))
;;* personal customizations
(let ((personal-settings "~/.emacs.d/opt/personal.el"))
 (when (file-exists-p personal-settings)
   (load-file personal-settings)))
