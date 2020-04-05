
;; disbale startup warnings
;; see: https://github.com/syl20bnr/spacemacs/issues/3920
;; (setq exec-path-from-shell-arguments '("-i"))

;; (when (memq window-system '(mac ns))
;;   (exec-path-from-shell-initialize)
;;   (exec-path-from-shell-copy-env "GOPATH"))

;; (with-system gnu/linux
;;   ;; (setenv "GOPATH" "/home/yayu/Golang")
;;   (exec-path-from-shell-initialize)
;;   (exec-path-from-shell-copy-env "GOPATH")
;;   (exec-path-from-shell-copy-env "PATH")
;;   )



;; this is totolly fucked up. hardcoded in linux
;; see: https://github.com/syl20bnr/spacemacs/issues/3920
(setq exec-path-from-shell-arguments '("-l"))




(exec-path-from-shell-initialize)
(exec-path-from-shell-copy-env "GOPATH")
(exec-path-from-shell-copy-env "PATH")


