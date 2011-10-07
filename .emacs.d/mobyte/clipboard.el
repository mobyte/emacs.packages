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
