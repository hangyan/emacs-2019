
(load "package")


 (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                           ("melpa" . "http://elpa.emacs-china.org/melpa/")))


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
			  company-tabnine
			  dashboard
			  diff-hl
			  dumb-jump
			  dockerfile-mode
			  elfeed
			  elisp-format
			  elpy
                          f
			  flycheck
			  groovy-mode
			  helm
			  helm-make
			  helm-org
			  kubernetes
                          feature-mode
                          flycheck
                          graphviz-dot-mode
                          htmlize
			  lsp-mode
                          magit
                          markdown-mode
			  markdown-toc
			  nord-theme
                          org
                          paredit
			  go-mode
			  exec-path-from-shell
			  company
			  company-go
                          powerline
			  request
                          rvm
                          smex
                          solarized-theme
			  super-save
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
