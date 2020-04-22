;; font


(with-system gnu/linux (add-to-list 'default-frame-alist '(font . "PT Mono-10")))

(with-system darwin (add-to-list 'default-frame-alist '(font . "Source Code Pro-12")))


(setq inhibit-splash-screen t initial-scratch-message nil initial-major-mode 'org-mode)


(if (display-graphic-p)
    (progn (tool-bar-mode -1)
	   (scroll-bar-mode -1)))


(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)



(add-to-list 'default-frame-alist '(fullscreen . maximized))


;; menu bar +
(eval-after-load "menu-bar"
  '(require 'menu-bar+))




(if window-system (load-theme 'tsdh-dark t)
  (load-theme 'wombat t))



(require 'powerline)
(powerline-default-theme)


;; dashboard
(use-package
  dashboard
  :ensure t
  :config (dashboard-setup-startup-hook))


(setq dashboard-items '((recents  . 5)
			(bookmarks . 5)
			(projects . 5)
			(agenda . 5)
			(registers . 5)))


;; themes
;; (add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
;; (load-theme 'nord t)


;; imenu
(defun try-to-add-imenu ()
  (condition-case nil (imenu-add-to-menubar "Index")
    (error
     nil)))
(add-hook 'font-lock-mode-hook 'try-to-add-imenu)

;; imenu list minor buffers
(global-set-key (kbd "C-'") #'imenu-list-smart-toggle)
(setq imenu-list-auto-resize t)


;; tabs
(require 'centaur-tabs)
(centaur-tabs-mode t)
(global-set-key (kbd "C-<prior>")  'centaur-tabs-backward)
(global-set-key (kbd "C-<next>") 'centaur-tabs-forward)

(defun centaur-tabs-hide-tab (x)
  (let ((name (format "%s" x)))
    (or (string-prefix-p "*epc" name)
	(string-prefix-p "*helm" name)
	(string-prefix-p "*Treemacs" name)
	(string-prefix-p "*Compile-Log*" name)
	(string-prefix-p "*lsp" name)
	(and (string-prefix-p "magit" name)
	     (not (file-name-extension name))))))

(setq centaur-tabs-style "bar")


(setq centaur-tabs-set-bar 'under)
;; Note: If you're not using Spacmeacs, in order for the underline to display
;; correctly you must add the following line:
(setq x-underline-at-descent-line t)


;; custom menu-bar
(defvar my-menu-bar-menu (make-sparse-keymap "Mine"))
(define-key global-map [menu-bar my-menu] (cons "Mine" my-menu-bar-menu))

(define-key my-menu-bar-menu [active-eshell]
  '(menu-item "Shell" aweshell-toggle :help "Awe Eshell"))

(define-key my-menu-bar-menu  [swith-treemacs-workspace]
  '(menu-item "Workspace" treemacs-switch-workspace :help "Switch Workspace"))

(define-key my-menu-bar-menu [active-treemacs]
  '(menu-item "Treemacs" treemacs :help "Active Treemacs"))

(define-key my-menu-bar-menu [active-neotree]
  '(menu-item "NeoTree" neotree :help "Active NeoTree"))

(define-key my-menu-bar-menu [active-elfeed]
  '(menu-item "Feed" elfeed :help "Read RSS"))

(define-key my-menu-bar-menu [active-format-all]
  '(menu-item "Format All" format-all-buffer :help "Format all buffer" ))

(define-key my-menu-bar-menu [active-imenu-list]
  '(menu-item "iMenu" imenu-list-smart-toggle :help "Active imenu"))


(provide 'init-gui)
