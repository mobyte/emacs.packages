;-------- my notes mode: mobnote-mode
(defvar mobnote-mode-hook nil)
 
(add-to-list 'auto-mode-alist '("\\.wpd\\'" . mobnote-mode))
 
(defconst mobnote-font-lock-keywords-1
  (list
   (cons "^:[ \t].+$"
         'font-lock-constant-face)
;   (cons "\\*\\*.*$"
;         'font-lock-builtin-face)
   (cons "^[\0-9a-z]+[.)]+[ \t]+"
         'font-lock-keyword-face)
   (cons "^[\-\*]+[ \t]+"
         'font-lock-keyword-face)
   (cons "__[\-0-9a-zA-ZÁ-Ñá-ñ_!,\. ]+__"
         'font-lock-warning-face)))
 
(defvar mobnote-font-lock-keywords mobnote-font-lock-keywords-1
  "Default highlighting expressions for MOBNOTE mode")
 
(defun mobnote-mode ()
  (face-spec-set 'font-lock-keyword-face
      '((t (:foreground "yellow" :weight bold))))
  (face-spec-set 'font-lock-constant-face
      '((t (:foreground "green" :weight bold))))
  (face-spec-set 'font-lock-warning-face
      '((t (:foreground "red" :weight bold))))
    "Major mode for editing Workflow Process Description Language files"
    (interactive)
    (kill-all-local-variables)
    (set (make-local-variable 'font-lock-defaults) '(mobnote-font-lock-keywords))
    (setq major-mode 'mobnote-mode)
    (setq mode-name "MOBNOTE")
    (run-hooks 'mobnote-mode-hook))
 
(provide 'mobnote-mode)

(mapcar #'(lambda (element) ;; emacs modes
            (setq auto-mode-alist 
                  (pushnew element auto-mode-alist)))
        '(("\\.mobnotes$" . mobnote-mode)
        ("\\.mobnote$" . mobnote-mode)))

