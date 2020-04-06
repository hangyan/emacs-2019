
;; shell
(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))

;; markdown
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))

(add-hook 'markdown-mode-hook (lambda () 
				(visual-line-mode t) 
				(writegood-mode t) 
				(flyspell-mode t)))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
(setq markdown-command "pandoc -c ~/.emacs.d/files/github-pandoc.css --from gfm  --quiet   -t html5 --mathjax --highlight-style pygments --standalone")

;; (setq markdown-command "pandoc -f markdown+smart -t markdown-smart")

(custom-set-variables
 '(livedown-autostart nil) ; automatically open preview when opening markdown files
 '(livedown-open t)        ; automatically open the browser window
 '(livedown-port 1337)     ; port for livedown server
 '(livedown-browser nil))  ; browser to use
(require 'livedown)


;; lisp
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


;; font lock
(with-eval-after-load 'elisp-mode
  (require 'elispfl)
  (elispfl-mode))


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
;; this need to download a binrary. In case the network error,
;; download it to ~/.TabNine/$version/$arch/$name
(with-eval-after-load 'company (add-to-list 'company-backends 'company-tabnine))

;; Trigger completion immediately.
(setq company-idle-delay 0)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)


;; highlight parenthesis
(show-paren-mode 1)


;; format emacs lisp code
(require 'elisp-format)


;; web mode
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


;; auto pair mode
(electric-pair-mode 1)

;; highlight todo
(global-hl-todo-mode)


;; yasnippet & auto-insert
;; ref: https://emacs.stackexchange.com/questions/45629/template-for-new-file
(use-package yasnippet
  :config
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")
  (yas-global-mode 1))


(defun hy/go-test-file ()
  (interactive)
  (yas-expand-snippet (yas-lookup-snippet "go_test" 'go-mode)))

(use-package autoinsert
  :config
  (setq auto-insert-query nil)
  (auto-insert-mode 1)
  (add-hook 'find-file-hook 'auto-insert)
  (setq auto-insert-alist nil) ;; remove this like to restore defaults
  (add-to-list 'auto-insert-alist  '("^.*_test\\.go$" . [hy/go-test-file])))


(provide 'init-lang)
