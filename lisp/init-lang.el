
;; shell
(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))


(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))

(add-hook 'markdown-mode-hook (lambda () 
				(visual-line-mode t) 
				(writegood-mode t) 
				(flyspell-mode t)))
(setq markdown-command "pandoc --smart -f markdown -t html")



(setq lisp-modes '(lisp-mode emacs-lisp-mode common-lisp-mode scheme-mode clojure-mode))

(defvar lisp-power-map (make-keymap))
(define-minor-mode lisp-power-mode "Fix keybindings; add power." 
  :lighter " (power)" 
  :keymap lisp-power-map
  (paredit-mode t))
(define-key lisp-power-map [delete] 'paredit-forward-delete)
(define-key lisp-power-map [backspace] 'paredit-backward-delete)

(defun abedra/engage-lisp-power () 
  (lisp-power-mode t))

(dolist (mode lisp-modes) 
  (add-hook (intern (format "%s-hook" mode)) #'abedra/engage-lisp-power))

(setq inferior-lisp-program "clisp")
(setq scheme-program-name "racket")


;; jenkinsfile

(require 'jenkinsfile-mode)
(add-to-list 'auto-mode-alist '("Jenkinsfile" . jenkinsfile-mode))


(add-to-list 'auto-mode-alist '("*Dockerfile*$" . dockerfile-mode))


;; smart compile
(require 'smart-compile)
(global-set-key (kbd "<f9>") 'smart-compile)


;; flycheck
(global-flycheck-mode)

;; lsp mode
(use-package 
  lsp-mode 
  :hook (XXX-mode . lsp) 
  :commands lsp)

;; optionally

;;(require 'tree-mode)

(use-package 
  lsp-ui 
  :commands lsp-ui-mode)
(use-package 
  company-lsp 
  :commands company-lsp)
(use-package 
  helm-lsp 
  :commands helm-lsp-workspace-symbol)
(use-package 
  lsp-treemacs 
  :commands lsp-treemacs-errors-list)
;; optionally if you want to use debugger
;; (use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language


;; add company settings here
;; see: https://github.com/iquiw/company-ghc/issues/12
(add-hook 'after-init-hook 'global-company-mode)
(with-eval-after-load 'company (add-to-list 'company-backends 'company-tabnine))

;; Trigger completion immediately.
(setq company-idle-delay 0)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)


;; highlight parenthesis
(show-paren-mode 1)


;; format emacs lisp code
(require 'elisp-format)

(provide 'init-lang)
