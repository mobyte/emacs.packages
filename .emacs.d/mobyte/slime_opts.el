;; add this to your ~/.emacs to use clbuild and its slime:
;;

;; possibly controversial as a global default, but shipping a lisp
;; that dies trying to talk to slime is stupid, so:
(set-language-environment "UTF-8")
(setq slime-net-coding-system 'utf-8-unix)

;; load slime:
(setq load-path (cons "/Users/mobyte/src/clbuild/clbuild/source/slime" load-path))
(setq load-path (cons "/Users/mobyte/src/clbuild/clbuild/source/slime/contrib" load-path))
(setq slime-backend "/Users/mobyte/src/clbuild/clbuild/source/slime/swank-loader.lisp")
(setq inhibit-splash-screen t)
(load "/Users/mobyte/src/clbuild/clbuild/source/slime/slime")
(setq inferior-lisp-program "/Users/mobyte/src/clbuild/clbuild/clbuild lisp")
(slime-setup '(slime-fancy slime-tramp slime-asdf))
(slime-require :swank-listener-hooks)

(add-to-list 'load-path "/Users/mobyte/src/clbuild/clbuild/source/slime")


;; Load these now instead of relying on autoload
(require 'slime)

;;; SLIME & Lisp
(slime-setup)

(setq slime-net-coding-system 'utf-8-unix)

(eval-after-load "slime"
  '(progn
     (setq slime-complete-symbol*-fancy t
           slime-complete-symbol-function 'slime-fuzzy-complete-symbol
           slime-when-complete-filename-expand t
           slime-truncate-lines nil
           slime-autodoc-use-multiline-p t)
     (define-key slime-mode-map (kbd "TAB") 'slime-indent-and-complete-symbol)
     (slime-setup '(slime-fancy slime-asdf)) ))

(global-set-key "\C-cs" 'slime-selector)

(setf slime-lisp-implementations
      '((sbcl ("/opt/local/bin/sbcl") :coding-system utf-8-unix)
        (cmucl ("cmucl") :coding-system iso-latin-1-unix)))

;; sbcl with its own inferior-lisp buffer
(defun slime-sbcl ()
  (interactive)
  (apply #'slime-start
         (list* :buffer "*inferior-lisp-sbcl*" 
                (slime-lookup-lisp-implementation slime-lisp-implementations
                                                  'sbcl))))
