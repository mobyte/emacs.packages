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
      '(("Todo" ?t "* %U %?" "~/temp/notes_dir/tasks.org" "Заметки на попозже разобрать")))
;      '(("Todo" ?t "** %U %^{Summary}\n%?" "~/temp/notes_dir/tasks.org" "Заметки на попозже разобрать")))

;;(setq truncate-lines t)
;;(setq org-startup-truncated nil)



;;(defun mob-insert-current-time ()
;; (interactive)
;; (org-insert-item)
;; (org-insert-time-stamp (current-time) 'with-hm 'inactive))

;;(global-set-key (kbd "C-x <up>") 'mob-insert-current-time)
;;(global-set-key (kbd "C-x <up>") nil)
