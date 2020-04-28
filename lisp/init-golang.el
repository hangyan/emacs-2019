;; golang



;; playonline
(require 'playonline)


;; company
(setq tab-always-indent 'complete) ;; use 't when company is disabled
(add-to-list 'completion-styles 'initials t)
;; Stop completion-at-point from popping up completion buffers so eagerly
(setq completion-cycle-threshold 5)



;; envs


;; this is totolly fucked up. hardcoded in linux
;; see: https://github.com/syl20bnr/spacemacs/issues/3920
(setq exec-path-from-shell-arguments '("-l"))


;; if you are using bash, the following env should be placed into .bash_profile
(exec-path-from-shell-copy-env "GOPATH")
(exec-path-from-shell-copy-env "PATH")
(exec-path-from-shell-copy-env "GOPROXY")
(exec-path-from-shell-copy-env "GO111MODULE")
(exec-path-from-shell-copy-env "GONOSUMDB")

;; run tests
(add-hook 'go-mode-hook #'rats-mode)

(require 'go-mod-mode)


;; flycheck settings
(let ((govet (flycheck-checker-get 'go-vet 'command)))
  (when (equal (cadr govet) "tool")
    (setf (cdr govet) (cddr govet))))

(add-hook 'before-save-hook 'gofmt-before-save)



;; trying lsp mode now...
;; see: https://arenzana.org/2019/12/emacs-go-mode-revisited/
;; RUN: go get golang.org/x/tools/gopls@latest
(setq lsp-gopls-staticcheck t)
(setq lsp-eldoc-render-all t)
(setq lsp-gopls-complete-unimported t)


;; guru
(use-package go-guru
  :defer t
  :hook (go-mode . go-guru-hl-identifier-mode))



(use-package go-mode
  :config (use-package godoctor))


;; go tags
(setq go-tag-args (list "-transform" "camelcase"))
(with-eval-after-load 'go-mode
  (define-key go-mode-map (kbd "C-c t") #'go-tag-add)
  (define-key go-mode-map (kbd "C-c T") #'go-tag-remove))


;; go def jump back
(with-eval-after-load 'go-mode
  (define-key go-mode-map (kbd "M-*") #'pop-tag-mark) )


(provide 'init-golang)
