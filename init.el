(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(add-to-list 'load-path (expand-file-name "packages" user-emacs-directory))




(require 'init-packages)
(require 'init-func)
(require 'init-gui)
(require 'init-keys)
(require 'init-system)
(require 'init-lang)
(require 'init-org)
(require 'init-golang)




