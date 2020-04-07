;;; init-helm --- all about helm-mode

;;; Commentary:

;; all about haskell-mode

;;; Code:

;; helm
(require 'helm-config)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)


;; helm git
(use-package helm-ls-git
  :ensure t
  :after helm)

(global-set-key (kbd "C-x C-d") 'helm-browse-project)


(use-package helm-lsp
  :ensure t
  :commands (helm-lsp-workspace-symbol))

(provide 'init-helm)
;;; init-helm ends here
