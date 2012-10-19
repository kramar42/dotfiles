
;; hotkeys
(global-set-key "\M-p" 'ftf-find-file)
(global-set-key (kbd "M-F") 'ftf-grepsource)
(global-set-key (kbd "C-x C-g") 'goto-line)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-x a") 'org-cicle-agenda-files)
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

;; ORG mode
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-agenda-files (list "~/Dropbox/documents/orgs/org.org"
                             "~/Dropbox/documents/orgs/tech.org"))

;; Org shortcuts
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)

;; Compiling shortcut
(global-set-key [\C-f9] 'compile)

;; uniquify - for files with same names
(setq uniquify-buffer-name-style 'forward)

;; Git
(autoload 'magit-status "magit" nil t)

;; PATH
(setq *PATH* (shell-command-to-string "source $HOME/.bashrc && printf $PATH"))
(if (not (getenv "TERM_PROGRAM"))
       (setenv "PATH" *PATH*))
(setq exec-path (append exec-path (split-string *PATH* ":")))

;; Flymake
(eval-after-load 'flymake '(require 'flymake-cursor))

(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

;; Настроим хоткеи для автодополнения и выравнивания отступов
(define-key slime-mode-map (kbd "TAB")
  'slime-indent-and-complete-symbol)
(define-key slime-mode-map (kbd "C-c TAB")
  'slime-complete-symbol)

;; Это включает алгоритмы выравнивания лиспового кода из SLIME,
;;   в противоположность стандартным из Emacs
(setq lisp-indent-function 'common-lisp-indent-function)
