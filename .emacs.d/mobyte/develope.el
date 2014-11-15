(defun create-shell-buffers ()
  (interactive)
  (eshell)
  (rename-buffer "*shell-divakit-daemon*")
  (eshell)
  (rename-buffer "*shell-git*")
  (eshell)
  (rename-buffer "*shell-zookeper*")
  (eshell)
  (rename-buffer "*shell-start-doo*"))

;; (create-shell-buffers)

