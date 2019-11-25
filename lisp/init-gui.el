;; font
(set-face-attribute 'default nil
                    :family "PT Mono"
                    :height 130
                    :weight 'normal
                    :width 'normal)



(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)


(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)



(add-to-list 'default-frame-alist '(fullscreen . maximized))






(if window-system
    (load-theme 'solarized-light t)
  (load-theme 'wombat t))



(require 'powerline)
(powerline-default-theme)





(provide 'init-gui)
