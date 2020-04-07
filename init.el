(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "packages" user-emacs-directory))



;; install packages
(require 'init-packages)
;; various use defined functions
(require 'init-func)
(require 'init-gui)
(require 'init-treemacs)
(require 'init-keys)
(require 'init-system)
;; settings about buffers and editing
(require 'init-buffer)
;; languages settings, markdown,shell...
(require 'init-lang)
;; lsp,yasnippet, company...
(require 'init-lsp)
;; org mode settings
(require 'init-org)
;; all about golang
(require 'init-golang)
(require 'init-spell)
(require 'init-util)


;; not working...
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

