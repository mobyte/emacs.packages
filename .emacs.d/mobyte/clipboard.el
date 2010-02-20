(defun paste-clipboard-old ()
  (interactive)
  (universal-argument)
  (shell-command "xsel -bo | iconv -cf utf-8" 'current))

(defun copy-clipboard-old ()
  (interactive)
  (shell-command-on-region (region-beginning) 
                           (region-end) 
                           "iconv -t utf-8 | xsel -bi")
  (keyboard-quit))

(defun paste-clipboard ()
  (interactive)
  (set-clipboard-coding-system 'utf-8)
  (insert (x-get-selection 'CLIPBOARD 'UTF8_STRING)))

(defun copy-clipboard ()
  (interactive)
  (set-clipboard-coding-system 'utf-8)
  (x-set-selection 'CLIPBOARD 
                   (buffer-substring (region-beginning) (region-end)))
  (keyboard-quit))

(global-set-key (kbd "C-x y") 'paste-clipboard)
(global-set-key (kbd "C-x w") 'copy-clipboard)

