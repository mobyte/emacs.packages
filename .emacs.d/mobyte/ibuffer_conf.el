;(require 'ibuffer)

(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("Shell"
                (mode . eshell-mode))
               ("REPL"
                (name . "^\\*slime-repl.*\\*$"))
               ("Lisp"
                (or (name . "^.*\\.lisp$")
                    (name . "^.*\\.clj$")))
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

(global-set-key (kbd "C-x <down>") 'ibuffer)
(global-set-key (kbd "C-x x") 'ibuffer)

