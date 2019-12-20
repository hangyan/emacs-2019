
(load "package")
(package-initialize)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(require 'cl)

(defmacro with-system (type &rest body)
  "Evaluate BODY if `system-type' equals TYPE."
  (declare (indent defun))
  `(when (eq system-type ',type)
     ,@body))

(with-system gnu/linux
	     (message "For linux")
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
)




(defvar abedra/packages '(ac-slime
                          auto-complete
                          autopair
                          cider
                          clojure-mode
			  dumb-jump
			  dockerfile-mode
			  elfeed
			  elpy
                          f
			  groovy-mode
			  helm
			  helm-make
			  helm-org
			  kubernetes
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
			  treemacs
                          web-mode
                          writegood-mode
			  use-package
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
