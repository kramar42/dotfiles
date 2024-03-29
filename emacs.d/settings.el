;; system settings
;; fix the PATH variable
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string
                          "TERM=vt100 $SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(when window-system (set-exec-path-from-shell-PATH))

;; fullscreen
;; (custom-set-variables
;; '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; visual settings
(blink-cursor-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; don't indent using tabs
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)

;; smooth scrolling
(setq scroll-step 1
      scroll-conservatively 10000)

;; set lang preferences
(set-language-environment "UTF-8")

;; need investigation
;;(setq default-input-method "russian-computer")

;; don't annoy me
(setq ring-bell-function 'ignore)

;; history & backups
(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
;(setq history-length 1000)

;(setq auto-window-vscroll nil)
;(setq mouse-wheel-follow-mouse nil)
;(setq compilation-read-command nil)

;; auto indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; remap C-x to C-t
(global-set-key "\C-t" ctl-x-map)
(global-set-key "\C-x" 'transpose-char)

(defun next-code-buffer ()
  (interactive)
  (let (( bread-crumb (buffer-name) ))
    (next-buffer)
    (while
        (and
         (string-match-p "^\*" (buffer-name))
         (not ( equal bread-crumb (buffer-name) )) )
      (next-buffer))))
(global-set-key [?\C-.] 'next-code-buffer)

(defun prev-code-buffer ()
  (interactive)
  (let (( bread-crumb (buffer-name) ))
    (previous-buffer)
    (while
        (and
         (string-match-p "^\*" (buffer-name))
         (not ( equal bread-crumb (buffer-name) )) )
      (previous-buffer))))
(global-set-key [?\C-,] 'prev-code-buffer)

(global-set-key "\M-k" 'kill-this-buffer)

;; ease access
(define-key ctl-x-map "\C-u" 'find-file)
(define-key ctl-x-map "\C-t" 'switch-to-buffer)

(setq inhibit-startup-echo-area-message "")
(setq inhibit-startup-message t)
(defalias 'yes-or-no-p 'y-or-n-p)

(setq column-number-mode t)
(set-face-attribute 'default nil :font "Fira Code" :height 120)
;(setq iswitchb-buffer-ignore '("^ " "*Completions*" "*Shell Command Output*"
;                               "*Messages*" "Async Shell Command"))

; Better C-w behaviour
(defun unix-werase-or-kill (arg)
  (interactive "*p")
  (if (and transient-mark-mode
           mark-active)
      (kill-region (region-beginning) (region-end))
    (backward-kill-word arg)))
(global-set-key "\C-w" 'unix-werase-or-kill)

(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer t t))
(define-key ctl-x-map "\C-a" 'revert-buffer-no-confirm)

(if window-system
    (progn
      (server-start)
      (scroll-bar-mode -1)
      (load-theme 'solarized-gruvbox-dark t)
      (set-cursor-color "#c1cdc1")))

(global-set-key (kbd "s-/") 'comment-line)

(setq vc-follow-symlinks t)
(setq default-directory "/users/kramar/")

;; don't spam warnings from packages
(setq ad-redefinition-action 'accept)

(show-paren-mode t)

(global-hl-line-mode t)

(setq-default frame-title-format "%b %f")
