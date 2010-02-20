;(add-to-list 'load-path "/home/mobyte/src/lisp/slime/slime/")
(add-to-list 'load-path "/home/mobyte/src/clbuild/clbuild/source/slime/")

;; Load these now instead of relying on autoload
(require 'slime)

;;; SLIME & Lisp
(slime-setup)
;(setq slime-lisp-implementations
;      '((sbcl   ("/usr/bin/sbcl"))))  ; default
;(setq slime-edit-definition-fallback-function 'find-tag)
;(setq lisp-indent-function 'common-lisp-indent-function)
;(setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
;(define-key slime-mode-map (kbd "TAB") 'slime-indent-and-complete-symbol)
;
;(setq slime-startup-animation nil)
;(slime-setup :autodoc t)


(eval-after-load "slime"
  '(progn
     (setq slime-complete-symbol-fancy t
           slime-complete-symbol-function 'slime-fuzzy-complete-symbol
           slime-when-complete-filename-expand t
           slime-truncate-lines nil
           slime-autodoc-use-multiline-p t)
     (define-key slime-mode-map (kbd "TAB") 'slime-indent-and-complete-symbol)
     (slime-setup '(slime-fancy slime-asdf)) ))

(global-set-key "\C-cs" 'slime-selector)


(setf slime-lisp-implementations
      '((sbcl ("sbcl") :coding-system utf-8-unix)
        (cmucl ("cmucl") :coding-system iso-latin-1-unix)))

;; sbcl with its own inferior-lisp buffer
(defun slime-sbcl ()
  (interactive)
  (apply #'slime-start
         (list* :buffer "*inferior-lisp-sbcl*" 
                (slime-lookup-lisp-implementation slime-lisp-implementations
                                                  'sbcl))))

(setq slime-net-coding-system 'utf-8-unix)
(setq slime-lisp-implementations
      '(;(ccl ("ccl") :coding-system utf-8-unix)
        ;(clisp ("clisp") :coding-system utf-8-unix)
        (sbcl ("sbcl") :coding-system utf-8-unix)))