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


(defun setup-slime-repl-paredit ()
  (define-key slime-repl-mode-map
    (kbd "DEL") 'paredit-backward-delete)
  (define-key slime-repl-mode-map
    (kbd "{") 'paredit-open-curly)
  (define-key slime-repl-mode-map
    (kbd "}") 'paredit-close-curly)
  (modify-syntax-entry ?\{ "(}")
  (modify-syntax-entry ?\} "){")
  (modify-syntax-entry ?\[ "(]")
  (modify-syntax-entry ?\] ")[")
  (modify-syntax-entry ?~ "'   ")
  (modify-syntax-entry ?, "    ")
  (modify-syntax-entry ?^ "'")
  (modify-syntax-entry ?= "'"))

(add-hook 'slime-repl-mode-hook 'setup-slime-repl-paredit)
(add-hook 'slime-nrepl-mode-hook 'setup-slime-repl-paredit)
(add-hook 'slime-cider-mode-hook 'setup-slime-repl-paredit)

;;;;(add-hook 'clojure-mode-hook 'setup-clojure-mode-paredit)
