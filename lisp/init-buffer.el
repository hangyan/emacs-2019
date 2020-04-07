;;; init-buffer --- buffer related Settings

;;; Commentary:

;; ...

;;; Code:

(global-auto-revert-mode t)

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))

(defun cleanup-region (beg end)
  "Remove tmux artifacts from region."
  (interactive "r")
  (dolist (re '("\\\\│\·*\n" "\W*│\·*"))
    (replace-regexp re "" nil beg end)))

(global-set-key (kbd "C-x M-t") 'cleanup-region)
(global-set-key (kbd "C-c n") 'cleanup-buffer)

(setq-default show-trailing-whitespace t)


;; auto save when lose foucs
(super-save-mode +1)
(setq super-save-exclude '(".go"))
(setq auto-save-default nil)


;; highlight
(blink-cursor-mode -1)

;; highlight the current line
(global-hl-line-mode 1)

;; highlight matching parentheses when the point is on them
(show-paren-mode t)

(setq blink-matching-paren nil)

;; undo-tree
(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :bind ("C-x u" . undo-tree-visualize)
  :config
  (global-undo-tree-mode t))


;; multi cursor
(use-package multiple-cursors
  :ensure t
  :bind (("C-|" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-S-<mouse-1>" . mc/add-cursor-on-click)))


;; search
(use-package anzu
  :ensure t
  :diminish anzu-mode
  :bind (("M-%" . anzu-query-replace)
         ("C-M-%" . anzu-query-replace-regexp))
  :config
  (global-anzu-mode t))

(provide 'init-buffer)
;;; init-buffer ends here
