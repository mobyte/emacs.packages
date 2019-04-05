((magit-blame
  ("-w"))
 (magit-commit nil)
 (magit-diff
  ("--no-ext-diff" "--stat"))
 (magit-log
  ("-n256" "--graph" "--decorate")
  ("-n1024" "--graph" "--decorate"))
 (magit-merge nil)
 (magit-push nil
             ("--force-with-lease"))
 (magit-rebase nil)
 (magit-revert
  ("--edit"))
 (magit-stash nil))
