(eval-after-load 'clojure-mode
  '(define-clojure-indent
     (testing 'defun)
     (feature 'defun)
     (scenario 'defun)
     (cond-let 'defun)
     (if-with-open 'defun)
     (when-let* 'defun)))
