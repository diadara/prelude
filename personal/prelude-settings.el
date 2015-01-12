;;;Code
(prelude-require-packages '(ido-vertical-mode guide-key
                                              nyan-mode
                                              org-pomodoro
                                              multiple-cursors
                                              jedi
                                              wrap-region
                                              hy-mode
                                              color-theme-sanityinc-tomorrow
                                              afternoon-theme
                                              restclient))


;; Something different from the default boring theme
(load-theme 'misterioso)


;; I like vertical-ido mode
(ido-vertical-mode 1)

;; Still an Emacs noob;
(setq guide-key/guide-key-sequence '("C-x" "C-c" "C-r" "C-t" "C-v"))
(setq guide-key/text-scale-amount '-1)
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)
(guide-key-mode) t


;; expand region and multiple cursor work flow for fancy
;; editing.Thanks to Emacs Rocks.

(global-set-key (kbd "C-`") 'er/expand-region)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C->") 'mc/skip-to-next-like-this)

(key-chord-define-global "ww" 'ace-window)

(guide-key/key-chord-hack-on)
(nyan-mode t)
(scroll-bar-mode -1)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

(key-chord-define-global "ii" 'imenu)

;;(key-chord-define-global "jj" 'ace-jump-mode)
;;(key-chord-mode t)

(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)
(add-hook 'prelude-python-mode-hook 'jedi:setup)


(defun diadara/duplicate-line ()
  "Duplicate current line."
  (interactive)
  (let* ((text (buffer-substring-no-properties (point-at-bol) (point-at-eol)))
         (cur-col (length (buffer-substring-no-properties (point-at-bol) (point)))))
    (end-of-line) (insert "\n" text)
    (beginning-of-line) (right-char cur-col)))

(defun diadara/kill-line ()
  "kills the current line."
  (interactive)
  (beginning-of-line)
  (kill-line)
  (kill-line)
  )
k
(key-chord-define-global "dd" 'diadara/duplicate-line)
(key-chord-define-global "kk" 'diadara/kill-line)
