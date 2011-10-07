(set-language-environment "UTF-8")
(setq slime-net-coding-system 'utf-8-unix)

(add-to-list 'load-path "~/.emacs.d/")

(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; ac-slime
(setq load-path (cons "~/.emacs.d/ac-slime" load-path))
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

(setq ac-sources '(ac-source-slime-simple
                   ac-source-words-in-buffer
                   ac-source-dss-filename))

(provide 'dss-clojure)

;;(require 'slime) 
;;(slime-setup) 

(eval-after-load "slime"
  '(progn (setq
           slime-when-complete-filename-expand t
           slime-truncate-lines nil
           slime-autodoc-use-multiline-p t)
          (define-key slime-mode-map (kbd "TAB") 'slime-indent-and-complete-symbol)))
