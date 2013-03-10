;; hotkeys
(global-set-key (kbd "C-x C-g") 'goto-line)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key "\M-k" 'kill-this-buffer)

;; set macro commands
(global-set-key [f2] 'kmacro-call-macro)
(global-set-key [f3] 'kmacro-start-macro-or-insert-counter)
(global-set-key [f4] 'kmacro-end-or-call-macro)

;; Use backward-kill-word instead of Backspace
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)

;; Shortcuts for switching buffers
(global-set-key [?\C-,] 'previous-buffer)
(global-set-key [?\C-.] 'next-buffer)

;; Bookmarks
(global-set-key [f5] 'bookmark-set)
(global-set-key [f6] 'bookmark-njump)

;; Org shortcuts
(global-set-key (kbd "C-x a") 'org-cicle-agenda-files)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)

;; Compiling shortcut
(global-set-key [\C-f9] 'compile)

; (define-key slime-mode-map (kbd "TAB")
;  'slime-indent-and-complete-symbol)
; (define-key slime-mode-map (kbd "C-c TAB")
;  'slime-complete-symbol)
