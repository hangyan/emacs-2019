;;; init-lsp --- lsp mode

;;; Commentary:

;; lsp/commany/tabnine/yas...

;;; Code:


;; lsp mode
(use-package 
  lsp-mode 
  :hook (XXX-mode . lsp) 
  :commands lsp)


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




(provide 'init-lsp)
;;; init-lsp ends here
