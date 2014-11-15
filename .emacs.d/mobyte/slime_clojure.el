(add-to-list 'load-path "~/src/emacs/clojure/clojure-mode/")
(require 'clojure-mode)

(add-to-list 'load-path "~/src/emacs/clojure/slime")
(require 'slime)
(slime-setup) 

(setq load-path (cons "~/.emacs.d/ac-slime" load-path))
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)

(eval-after-load "slime"
  '(progn (slime-setup '(slime-repl))
          (setq slime-when-complete-filename-expand t
                slime-protocol-version 'ignore
                slime-truncate-lines nil
                slime-autodoc-use-multiline-p t)
          (define-key slime-mode-map (kbd "TAB") 'slime-indent-and-complete-symbol)))


(set-language-environment "UTF-8")
(setq slime-net-coding-system 'utf-8-unix)

