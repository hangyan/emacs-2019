;; font
(set-face-attribute 'default nil
                    :family "PT Mono"
                    :height 130
                    :weight 'normal
                    :width 'normal)



(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)


(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))


(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)



(add-to-list 'default-frame-alist '(fullscreen . maximized))






(if window-system
    (load-theme 'tsdh-dark t)
  (load-theme 'wombat t))



(require 'powerline)
(powerline-default-theme)


;; dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))


(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)
                        (registers . 5)))


;; themes
;; (add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
;; (load-theme 'nord t)


(provide 'init-gui)
