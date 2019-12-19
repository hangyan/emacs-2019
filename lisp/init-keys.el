

;; keys

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)


;; gui


(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-c C-k") 'compile)
(global-set-key (kbd "C-c C-j") 'dumb-jump-go)
(global-set-key (kbd "C-C C-b") 'dumb-jump-back)
(global-set-key (kbd "C-x g") 'magit-status)




(provide 'init-keys)
