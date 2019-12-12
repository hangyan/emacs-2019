(require 'org-wiki)


(setq org-wiki-location-list
      '(
        "~/wiki"    ;; First wiki (root directory) is the default. 
        ))

;; Initialize first org-wiki-directory or default org-wiki 
(setq org-wiki-location (car org-wiki-location-list))

(setq org-wiki-default-read-only nil) 

(provide 'init-org)
