;;;Code
(prelude-require-packages '(ido-vertical-mode guide-key
                                              nyan-mode
                                              xcscope
                                              org-pomodoro
                                              multiple-cursors
                                              wrap-region
                                              hy-mode
                                              color-theme-sanityinc-tomorrow
                                              afternoon-theme
                                              paradox
                                              neotree
                                              async
                                              emmet-mode
                                              pyenv-mode
                                              angular-snippets
                                              restclient))

;; Something different from the default boring theme
;;(load-theme 'misterioso)
(load-theme 'mustang)


;; Use cscope for reading c source code
(cscope-setup)

;; I like vertical-ido mode
(ido-vertical-mode 1)

(wrap-region-global-mode t)


;; Still an Emacs noob;
(setq guide-key/guide-key-sequence '("C-x" "C-c" "C-r" "C-t" "C-v"))
(setq guide-key/text-scale-amount '-1)
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)
(guide-key-mode t)


;; expand region and multiple cursor work flow for fancy
;; editing.Thanks to Emacs Rocks.

(global-set-key (kbd "C-`") 'er/expand-region)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C->") 'mc/skip-to-next-like-this)

(guide-key/key-chord-hack-on)
(nyan-mode t)

(scroll-bar-mode -1)

;;Ace window to switch windows, probably redundant
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))


;;"Duplicate line under point."
(defun diadara/duplicate-line ()
  (interactive)
  (let* ((text (buffer-substring-no-properties (point-at-bol) (point-at-eol)))
         (cur-col (length (buffer-substring-no-properties (point-at-bol) (point)))))
    (end-of-line) (insert "\n" text)
    (beginning-of-line) (right-char cur-col)))


;; Kill the entire line under point
(defun diadara/kill-line ()
  (interactive)
  (beginning-of-line)
  (kill-line)
  (kill-line)
  )

(key-chord-define-global "dd" 'diadara/duplicate-line)
(key-chord-define-global "kk" 'diadara/kill-line)
(key-chord-define-global "tt" 'neotree-toggle)
(key-chord-define-global "ww" 'ace-window)
(key-chord-define-global "ii" 'imenu)


(setq anaconda-mode-python "/usr/bin/python2")
(setq python-shell-virtualenv-path "~/.virtualenvs/roommark/")
(pyenv-mode)

;; Emmet mode for boring work.
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
