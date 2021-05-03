(define-package "clj-refactor" "20210413.733" "A collection of commands for refactoring Clojure code"
  '((emacs "25.1")
    (seq "2.19")
    (yasnippet "0.6.1")
    (paredit "24")
    (multiple-cursors "1.2.2")
    (clojure-mode "5.9")
    (cider "1.0")
    (parseedn "0.2")
    (inflections "2.3")
    (hydra "0.13.2"))
  :commit "f50fb242ba0ff8526746ae0ffeb19b9a535c00b2" :authors
  '(("Magnar Sveen" . "magnars@gmail.com")
    ("Lars Andersen" . "expez@expez.com")
    ("Benedek Fazekas" . "benedek.fazekas@gmail.com")
    ("Bozhidar Batsov" . "bozhidar@batsov.com"))
  :maintainer
  '("Magnar Sveen" . "magnars@gmail.com")
  :keywords
  '("convenience" "clojure" "cider"))
;; Local Variables:
;; no-byte-compile: t
;; End: