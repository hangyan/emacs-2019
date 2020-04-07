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
(require 'init-lsp)
;; org mode settings
(require 'init-org)
;; all about golang
(require 'init-golang)
;; spell check
(require 'init-spell)
(require 'init-util)

;;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(livedown-autostart nil)
 '(livedown-browser nil)
 '(livedown-open t)
 '(livedown-port 1337)
 '(package-selected-packages
   (quote
    (go-eldoc yaml-mode writegood-mode web-mode use-package treemacs-projectile treemacs-magit treemacs-icons-dired treemacs-evil super-save solarized-theme smex rvm request rats paredit nord-theme neotree multiple-cursors markdown-toc lsp-ui kubernetes htmlize hl-todo hexo helm-org helm-make helm-lsp helm-ls-git groovy-mode grip-mode graphviz-dot-mode gitignore-mode gitconfig-mode ghub flycheck-golangci-lint feature-mode exec-path-from-shell elpy elisp-format elfeed dumb-jump dockerfile-mode diff-hl dashboard crux company-tabnine company-lsp company-go cider centaur-tabs autopair anzu ac-slime))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
