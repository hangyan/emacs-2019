
(defconst *os-is-gnu* (eq system-type 'gnu/linux))
(defconst *os-is-mac* (eq system-type 'darwin))
(defconst *os-is-windows* (eq system-type 'windows-nt))

;; performance
;; 增大垃圾回收的阈值，提高整体性能（内存换效率）
(setq gc-cons-threshold (* 8192 8192))
;; 增大同LSP服务器交互时的读取文件的大小
(setq read-process-output-max (* 1024 1024 128)) ;; 128MB

;; hardcoded path envs
(setenv "PATH" (concat ":/usr/local/bin:/opt/local/bin:/usr/bin:/bin" (getenv "PATH")))
(when *os-is-gnu*
  (setenv "PATH" (concat ":/home/yayu/Golang/bin" (getenv "PATH"))))
(when *os-is-mac*
  (setenv "PATH" (concat ":/Users/yayu/Golang/bin" (getenv "PATH"))))

(setq exec-path (append exec-path '("/usr/local/bin")))


(require 'cl)

;; pre



(if (fboundp 'with-eval-after-load)
    (defalias 'after-load 'with-eval-after-load)
  (defmacro after-load (feature &rest body)
    "After FEATURE is loaded, evaluate BODY."
    (declare (indent defun))
    `(eval-after-load ,feature '(progn ,@body))))





(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

(setq make-backup-files nil)

(defalias 'yes-or-no-p 'y-or-n-p)

;; minibuffer History
(savehist-mode 1)


(setq flyspell-issue-welcome-flag nil)
(if (eq system-type 'darwin)
    (setq-default ispell-program-name "/usr/local/bin/aspell")
  (setq-default ispell-program-name "/usr/bin/aspell"))
(setq-default ispell-list-command "list")




;;(setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
;;(smex-initialize)
;;(global-set-key (kbd "M-x") 'smex)
;;(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;;(ido-mode t)
;; (setq ido-enable-flex-matching t
;;       ido-use-virtual-buffers t)


(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;;(require 'autopair)



(setq user-full-name "Hang Yan")
(setq user-mail-address "hang.yan@hotmail.com")



(when *os-is-mac*
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super)
  (setq-default default-input-method "MacOSX")
  ;; Make mouse wheel / trackpad scrolling less jerky
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 5)
                                      ((control))))
  (dolist (multiple '("" "double-" "triple-"))
    (dolist (direction '("right" "left"))
      (global-set-key (read-kbd-macro (concat "<" multiple "wheel-" direction ">")) 'ignore)))
  (global-set-key (kbd "M-`") 'ns-next-frame)
  (global-set-key (kbd "M-h") 'ns-do-hide-emacs)
  (global-set-key (kbd "M-˙") 'ns-do-hide-others)
  (after-load 'nxml-mode (define-key nxml-mode-map (kbd "M-h") nil))
  (global-set-key (kbd "M-ˍ") 'ns-do-hide-others) ;; what describe-key reports for cmd-option-h
  )




;; git related
(global-diff-hl-mode)

(use-package magit
  :ensure t
  :mode ("/\\(\
\\(\\(COMMIT\\|NOTES\\|PULLREQ\\|TAG\\)_EDIT\\|MERGE_\\|\\)MSG\
\\|\\(BRANCH\\|EDIT\\)_DESCRIPTION\\)\\'" . git-commit-mode)
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch)
         ("C-c M-g" . magit-file-dispatch)))

(use-package gitconfig-mode
  :ensure t
  :mode ("/\\.gitconfig\\'" "/\\.git/config\\'" "/git/config\\'"
         "/\\.gitmodules\\'"))

(use-package gitignore-mode
  :ensure t
  :mode ("/\\.gitignore\\'" "/\\.git/info/exclude\\'" "/git/ignore\\'"))



;; dired
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(setq dired-clean-confirm-killing-deleted-buffers nil)


(provide 'init-system)
