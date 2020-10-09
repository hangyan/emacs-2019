
;; shell
(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))

;; markdown
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))

(add-hook 'markdown-mode-hook (lambda () 
				(visual-line-mode t) 
				(writegood-mode t) 
				(flyspell-mode t)))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
(setq markdown-command "pandoc -c ~/.emacs.d/files/github-pandoc.css --from gfm  --quiet   -t html5 --mathjax --highlight-style pygments --standalone")

;; (setq markdown-command "pandoc -f markdown+smart -t markdown-smart")

(custom-set-variables
 '(livedown-autostart nil) ; automatically open preview when opening markdown files
 '(livedown-open t)        ; automatically open the browser window
 '(livedown-port 1337)     ; port for livedown server
 '(livedown-browser nil))  ; browser to use
(require 'livedown)


;; lisp
(setq lisp-modes '(lisp-mode emacs-lisp-mode common-lisp-mode scheme-mode clojure-mode))

(defvar lisp-power-map (make-keymap))
(define-minor-mode lisp-power-mode "Fix keybindings; add power." 
  :lighter " (power)" 
  :keymap lisp-power-map
  (paredit-mode t))
(define-key lisp-power-map [delete] 'paredit-forward-delete)
(define-key lisp-power-map [backspace] 'paredit-backward-delete)

(defun abedra/engage-lisp-power () 
  (lisp-power-mode t))

(dolist (mode lisp-modes) 
  (add-hook (intern (format "%s-hook" mode)) #'abedra/engage-lisp-power))

(setq inferior-lisp-program "clisp")
(setq scheme-program-name "racket")


;; font lock
(with-eval-after-load 'elisp-mode
  (require 'elispfl)
  (elispfl-mode))


;; jenkinsfile

(require 'jenkinsfile-mode)
(add-to-list 'auto-mode-alist '("Jenkinsfile" . jenkinsfile-mode))


(add-to-list 'auto-mode-alist '("*Dockerfile*$" . dockerfile-mode))


;; smart compile
(require 'smart-compile)
(global-set-key (kbd "<f9>") 'smart-compile)


;; flycheck
(global-flycheck-mode)


;; optionally

;;(require 'tree-mode)


;; highlight parenthesis
(show-paren-mode 1)


;; format emacs lisp code
(require 'elisp-format)


;; web mode
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


;; auto pair mode
(electric-pair-mode 1)

;; highlight todo
(global-hl-todo-mode)



;; rdf
(autoload 'n3-mode "n3-mode" "Major mode for OWL or N3 files" t)

;; Turn on font lock when in n3 mode
(add-hook 'n3-mode-hook
          'turn-on-font-lock)

(setq auto-mode-alist
      (append
       (list
        '("\\.n3" . n3-mode)
        '("\\.owl" . n3-mode))
       auto-mode-alist))

(provide 'init-lang)
