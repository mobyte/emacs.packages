(defun parse_xml ()
  (interactive)
  (xml-mode)
  (mark-whole-buffer)
  (universal-argument)
  (shell-command-on-region (point-min) (point-max) "xmllint --format -" 'current 'yes ) )

(global-set-key (kbd "C-`") 'parse_xml)
(global-set-key (kbd "C-`") nil)
