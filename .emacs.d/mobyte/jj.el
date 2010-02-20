(setq jj-ht-syms (make-hash-table :test 'equal))
(progn
  (clrhash jj-ht-syms)
  (puthash "\t" (let ((value ""))
                  (dotimes (i tab-width value)
                    (setq value (concat value "&nbsp;"))))
           jj-ht-syms)
  (puthash "\n" "<br />" jj-ht-syms)
  (puthash " " "&nbsp;" jj-ht-syms)
  (puthash "!" "&#33;" jj-ht-syms)
  (puthash "\"" "&#34;" jj-ht-syms)
  (puthash "#" "&#35;" jj-ht-syms)
  (puthash "$" "&#36;" jj-ht-syms)
  (puthash "%" "&#37;" jj-ht-syms)
  (puthash "&" "&#38;" jj-ht-syms)
  (puthash "'" "&#39;" jj-ht-syms)
  (puthash "(" "&#40;" jj-ht-syms)
  (puthash ")" "&#41;" jj-ht-syms)
  (puthash "*" "&#42;" jj-ht-syms)
  (puthash "+" "&#43;" jj-ht-syms)
  (puthash "," "&#44;" jj-ht-syms)
  (puthash "-" "&#45;" jj-ht-syms)
  (puthash "." "&#46;" jj-ht-syms)
  (puthash "/" "&#47;" jj-ht-syms)
  (puthash ":" "&#58;" jj-ht-syms)
  (puthash ";" "&#59;" jj-ht-syms)
  (puthash "<" "&#60;" jj-ht-syms)
  (puthash "=" "&#61;" jj-ht-syms)
  (puthash ">" "&#62;" jj-ht-syms)
  (puthash "?" "&#63;" jj-ht-syms)
  (puthash "@" "&#64;" jj-ht-syms)
  (puthash "[" "&#91;" jj-ht-syms)
  (puthash "\\" "&#92;" jj-ht-syms)
  (puthash "]" "&#93;" jj-ht-syms)
  (puthash "^" "&#94;" jj-ht-syms)
  (puthash "_" "&#95;" jj-ht-syms)
  (puthash "`" "&#96;" jj-ht-syms)
  (puthash "{" "&#123;" jj-ht-syms)
  (puthash "|" "&#124;" jj-ht-syms)
  (puthash "}" "&#125;" jj-ht-syms))

(let ((value ""))
  (dotimes (i tab-width value)
    (setq value (concat value "&nbsp;"))))

(defun jj-map-sym (sym)
  (gethash sym jj-ht-syms sym))

(defun save-to-clipboard (text)
  (set-clipboard-coding-system 'utf-8)
  (x-set-selection 'CLIPBOARD text))

(defun jj-get-color ()
  (let ((face (get-text-property (point) 'face)))
    (if face
        (progn
          (if (not (atom face)) (setq face (car face)))
          (let ((color (face-attribute face :foreground)))
            (if (string= color "unspecified")
                "red"
              color)))
      nil)))

(defun ttt ()
  (interactive)
  (let ((face (get-text-property (point) 'face)))
    (message "%s" 
             (if (null face)
                 nil
               (if (atom face)
                   (face-foreground face)
                 (face-foreground (car face)))))))
                 ;"red")))))

(global-set-key (kbd "C-<f2>") 'ttt)

(defun tt ()
  (interactive)
  (let ((face (get-text-property (point) 'face)))
    (message "%s" face)))

(global-set-key (kbd "C-<f3>") 'tt)

;;;; face-attribute: Wrong type argument: symbolp, (font-lock-variable-name-face underline)

(defun jj-debug-log (s)
  (let ((log-buffer "*JJ-debug-log*")
        (ori-buffer (current-buffer)))
    (pop-to-buffer log-buffer)
    (insert s)
    (insert "\n")
    (set-buffer ori-buffer)))

(defun jj-str-eq (str1 str2)
  (if (or (null str1) 
          (null str2))
      nil
      (if (string= str1 str2)
          "true"
        nil)))

(defun jj-bad-color-p (color)
  (if (or (jj-str-eq color "unspecified") 
          (null color))
      "true"
    nil))

(defun jj-color-to-rgb (color)
  (let ((color-list (color-values color)))
    (let ((r (nth 0 color-list))
          (g (nth 1 color-list))
          (b (nth 2 color-list)))
      (let ((nr (/ (* 255 r) 65535))
            (ng (/ (* 255 g) 65535))
            (nb (/ (* 255 b) 65535)))
        (format "%02x%02x%02x" nr ng nb)))))

(defun div-tag-wrap (text)
  (concat "<div class=\""
          mode-name
          "\" style=\"font-family: monospace; background: #"
          (jj-color-to-rgb (face-background 'default))
          "; color: #"
          (jj-color-to-rgb (face-foreground 'default))
          ";\">"
          text
          "</div>"))

(defun color-tag-begin (color)
  (concat "<font color=\"#" 
          (jj-color-to-rgb color)
          "\">"))
;;;;  (concat "<span style=\"color: #" 
;;;;          (jj-color-to-rgb color)
;;;;          ";\">"))

(defun color-tag-end () "</font>")
;;;;(defun color-tag-end () "</span>")

(defun jj-format ()
  "transforms emacs highlighting text to live journal code format"
  (interactive)
  (setq result "")
  (setq pcolor "") ; previous char color
  (setq need-close-tagp nil)
  (setq pos-begin (region-beginning))
  (setq pos-end (region-end))
  (goto-char pos-begin)
  (while (< (point) pos-end)
    (setq color (jj-get-color))
    (setq schar (char-to-string (char-after)))
    ;;(jj-debug-log (format "%s, \"%s\"" color schar))
    (if need-close-tagp
        (if (or (jj-bad-color-p color) (not (jj-str-eq color pcolor)))
            (progn
              (setq result (concat result (color-tag-end)))
              (setq need-close-tagp nil))))
    (if (and (not (jj-bad-color-p color)) (not need-close-tagp))
        (progn
          (setq result (concat result (color-tag-begin color)))
          (setq need-close-tagp "true")))
    (setq pcolor color)
    (setq result (concat result (jj-map-sym schar)))
;;    (if (eolp) (setq result (concat result "<br />")))
    (forward-char 1))
  (if need-close-tagp 
      (setq result (concat result (color-tag-end))))
  (save-to-clipboard (div-tag-wrap result))
  (keyboard-quit))

(global-set-key (kbd "C-<f1>") 'jj-format)

