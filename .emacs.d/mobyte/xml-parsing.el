(defun parse_xml ()
  (interactive)
  (xml-mode)
;;;;  (mark-whole-buffer)
;;;;  (universal-argument)
;;;;  (shell-command-on-region (point-min) (point-max) "xmllint --format -" 'current 'yes ) )
  (shell-command-on-region (buffer-end -1) (buffer-end 1) "xmllint --format -" 'current 'yes ) )

(defun bf-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
      (nxml-mode)
      (goto-char begin)
      (while (search-forward-regexp "\>[ \\t]*\<" nil t) 
        (backward-char) (insert "\n"))
      (indent-region begin end))
    (message "Ah, much better!"))

(global-set-key (kbd "C-`") 'parse_xml)

