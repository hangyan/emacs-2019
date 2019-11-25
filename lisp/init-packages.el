
(load "package")
(package-initialize)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(require 'cl)



(defvar abedra/packages '(ac-slime
                          auto-complete
                          autopair
                          cider
                          clojure-mode
                          elpy
                          f
			  helm
                          feature-mode
                          flycheck
                          graphviz-dot-mode
                          htmlize
                          magit

                          markdown-mode
                          org
                          paredit
			  go-mode
			  exec-path-from-shell
			  company
			  company-go
                          powerline
                          rvm
                          smex
                          solarized-theme
                          web-mode
                          writegood-mode
                          yaml-mode)
  "Default packages")


(defun abedra/packages-installed-p ()
  (loop for pkg in abedra/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))



(unless (abedra/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg abedra/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))



(provide 'init-packages)
