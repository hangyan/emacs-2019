(require 'org-wiki)


(setq org-wiki-location-list
      '(
        "~/wiki"    ;; First wiki (root directory) is the default. 
        ))

;; Initialize first org-wiki-directory or default org-wiki 
(setq org-wiki-location (car org-wiki-location-list))

(setq org-wiki-default-read-only nil)


(org-wiki-make-menu)


(setq org-wiki-template
      (string-trim
"
#+TITLE: %n
#+DESCRIPTION:
#+KEYWORDS:
#+HTML_HEAD: <link rel=\"stylesheet\" type=\"text/css\" href=\"https://gongzhitaao.org/orgcss/org.css\"/>
#+STARTUP:  content
#+DATE: %d

- [[wiki:index][Index]]

- Related: 

* %n
"))

(provide 'init-org)
