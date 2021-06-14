;;; init.el --- the entrypoint for emacs config

;;; Commentary:

;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "packages" user-emacs-directory))



;; install packages
(require 'init-packages)
;; various use defined functions
(require 'init-func)
(require 'init-gui)
;; treemacs config
(require 'init-treemacs)
(require 'init-keys)
(require 'init-system)
;; settings about buffers and editing
(require 'init-buffer)
;; helm settings
(require 'init-helm)
;; languages settings, markdown,shell...
(require 'init-lang)
;; lsp,yasnippet, company...
;;(require 'init-lsp)
;; org mode settings
(require 'init-org)
;; all about golang
(require 'init-golang)
;; spell check
(require 'init-spell)
(require 'init-util)
;; (require 'init-email)


(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)

;;; init.el ends here

