; ------------------ server mode
(server-start)

; ------------------ kill *scratch* buffer
(kill-buffer "*scratch*")

; ------------------ kill all buffers

;(defun nuke-all-buffers ()
;  "kill all buffers"
;  (interactive)
;  (mapcar (lambda (x) (kill-buffer x))
;	  (buffer-list))
;  (delete-other-windows))

; ------------------ kill *scratch* buffer

