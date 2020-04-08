;;; init-util ---  utils functions

;;; Commentary:

;; this module provide various utils functions

;;; Code:


;; look up wikipage
(defun my-lookup-wikipedia ()
  "Look up the word under cursor in Wikipedia.
If there is a text selection, use that."
  (interactive)
  (let (word)
    (setq word
          (if (use-region-p)
              (buffer-substring-no-properties (region-beginning) (region-end))
            (current-word)))
    (setq word (replace-regexp-in-string " " "_" word))
    (browse-url (concat "http://en.wikipedia.org/wiki/" word))))

;; elfeed
(global-set-key (kbd "C-x w") 'elfeed)

(setq elfeed-feeds
      '("http://coolshell.cn/feed"
	"https://blog.codingnow.com/atom.xml"
	"http://www.ruanyifeng.com/blog/atom.xml"))

(provide 'init-util)
;;; init-util ends here
