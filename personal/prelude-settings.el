(prelude-require-packages '(ido-vertical-mode guide-key
                                              nyan-mode
                                              multiple-cursors
                                              wrap-region
                                              restclient))

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
(guide-key/key-chord-hack-on)
(nyan-mode t)
(scroll-bar-mode -1)




;;(key-chord-define-global "jj" 'ace-jump-mode)
;;(key-chord-mode t)
