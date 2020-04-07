;;; init-lsp --- lsp mode

;;; Commentary:

;; lsp/commany/tabnine/yas...

;;; Code:


;; lsp mode

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred))

;;Set up before-save hooks to format buffer and add/delete imports.
;;Make sure you don't have other gofmt/goimports hooks enabled.

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;;Optional - provides fancier overlays.

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :init
)

;;Company mode is a standard completion package that works well with lsp-mode.
;;company-lsp integrates company mode completion with lsp-mode.
;;completion-at-point also works out of the box but doesn't support snippets.

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

(use-package company-lsp
  :ensure t
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


;; yasnippet & auto-insert
;; ref: https://emacs.stackexchange.com/questions/45629/template-for-new-file
(use-package 
  yasnippet 
  :config (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets") 
  (yas-global-mode 1))


(defun hy/go-test-file () 
  (interactive) 
  (yas-expand-snippet (yas-lookup-snippet "go_test" 'go-mode)))


(defun hy/elisp-file () 
  (interactive) 
  (yas-expand-snippet (yas-lookup-snippet "default" 'emacs-lisp-mode)))

(use-package 
  autoinsert 
  :config (setq auto-insert-query nil) 
  (auto-insert-mode 1) 
  (add-hook 'find-file-hook 'auto-insert) 
  (setq auto-insert-alist nil) ;; remove this like to restore defaults
  (add-to-list 'auto-insert-alist  '("^.*_test\\.go$" . [hy/go-test-file])) 
  (add-to-list 'auto-insert-alist '("^.*\\.el$" . [hy/elisp-file])))




;;lsp-ui-doc-enable is false because I don't like the popover that shows up on the right
;;I'll change it if I want it back


(setq lsp-ui-doc-enable nil
      lsp-ui-peek-enable t
      lsp-ui-sideline-enable t
      lsp-ui-imenu-enable t
      lsp-ui-flycheck-enable t)

(provide 'init-lsp)
;;; init-lsp ends here
