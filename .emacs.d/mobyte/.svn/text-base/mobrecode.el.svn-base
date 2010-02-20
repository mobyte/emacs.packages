(defun recode-buffer-safe (target-coding-system)
  "* Recode buffer as if it were encoded with `target-coding-system'.
If current buffer is write-protected (`buffer-read-only'), do nothing."
  (interactive "zEnter target coding system: ")
  (unless buffer-read-only
    (encode-coding-region (point-min)
                          (point-max)
                          buffer-file-coding-system)
    (decode-coding-region (point-min)
                          (point-max)
                          target-coding-system)
    (set-buffer-file-coding-system target-coding-system)))