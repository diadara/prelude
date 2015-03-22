(setq org-directory "~/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)

;;(org-defkey org-mode-map "\C-xp" 'org-pomodoro)


(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal entry" plain
         (file+datetree+prompt "~/org/journal.org")
         "%K - %a\n%i\n%?\n")
        ))

(setq org-agenda-files '("~/org"))
