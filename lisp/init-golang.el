;; golang
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))


(add-hook 'go-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 '(company-go))
            (company-mode)))

;; company
(setq tab-always-indent 'complete) ;; use 't when company is disabled
(add-to-list 'completion-styles 'initials t)
;; Stop completion-at-point from popping up completion buffers so eagerly
(setq completion-cycle-threshold 5)


;; make it lazy load
(setenv "GO111MODULE" "on")
(require 'go-mod-mode)


;; flycheck settings
(let ((govet (flycheck-checker-get 'go-vet 'command)))
  (when (equal (cadr govet) "tool")
    (setf (cdr govet) (cddr govet))))

(add-hook 'before-save-hook 'gofmt-before-save)

(provide 'init-golang)
