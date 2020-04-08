
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
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))



;; this should be removed since we use use-package for now...
(defvar abedra/packages '(ac-slime
                          auto-complete
                          autopair
                          cider
                          clojure-mode
			  centaur-tabs
			  company-tabnine
			  crux
			  dashboard
			  diff-hl
			  dumb-jump
			  dockerfile-mode
			  elisp-format
			  elfeed
			  elpy
                          f
			  flycheck
			  groovy-mode
			  helm
			  helm-make
			  helm-org
			  hexo
			  hl-todo
			  ini-mode
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
			  neotree
                          org
                          paredit
			  go-mode
			  go-guru
			  godoctor
			  go-tag
			  exec-path-from-shell
			  company
			  company-go
                          powerline
			  request
                          rvm
			  rats
			  restart-emacs
                          smex
                          solarized-theme
			  super-save
			  treemacs
                          web-mode
                          writegood-mode
			  use-package
			  yasnippet-snippets
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


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'bind-key)

(setq use-package-verbose t)

;; Disable lazy loading in daemon mode
(if (daemonp)
    (setq use-package-always-demand t))

(provide 'init-packages)
;;; init-packages ends here
