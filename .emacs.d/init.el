(add-to-list 'load-path "~/.emacs.d/")
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq c-default-style "linux"
      c-basic-offset 4)
(setq scroll-step 1
      scroll-conservatively 10000)
(setq require-final-newline t)
(setq current-language-environment "UTF-8")
(setq default-input-method "russian-computer")
(setq ring-bell-function 'ignore)
(setq history-length 1000)
(setq auto-window-vscroll nil)
(setq mouse-wheel-follow-mouse nil)
(setq compilation-read-command nil)
(define-key global-map (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-,") 'previous-buffer)
(global-set-key (kbd "C-.") 'next-buffer)
(global-set-key (kbd "C-x t") 'delete-trailing-whitespace)
(global-set-key (kbd "C-x g") 'goto-line)
(global-set-key (kbd "C-x c") 'compile)
(iswitchb-mode 1)
(electric-pair-mode 1)
(setq column-number-mode t)
(setq w3m-command "/usr/local/bin/w3m")
(set-face-attribute 'default nil :font "Monaco" :height 110)
(setq iswitchb-buffer-ignore '("^ " "*Completions*" "*Shell Command Output*"
							   "*Messages*" "Async Shell Command"))
(global-set-key [f2] 'kmacro-call-macro)
(global-set-key [f3] 'kmacro-start-macro-or-insert-counter)
(global-set-key [f4] 'kmacro-end-or-call-macro)

(global-set-key [f5] 'bookmark-set)
(global-set-key [f6] 'bookmark-jump)
(global-set-key [\C-f9] 'compile)

(setq org-log-done 'time)
(setq org-directory "~/Dropbox/orgs")
(setq org-mobile-inbox-for-pull "~/Dropbox/orgs/flagged.org")
(setq org-mobile-directory "~/Dropbox/apps/orgs")

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-xa" 'org-cicle-agenda-files)

(server-start)

(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")))
  (package-initialize)
  (when (not package-archive-contents)
    (package-refresh-contents))
  (dolist (p '(color-theme
               color-theme-monokai
			   column-marker
			   rainbow-delimiters
			   w3m
			   evil
			   evil-leader
               popwin
               auto-async-byte-compile))
    (when (not (package-installed-p p))
      (package-install p))))

(add-hook 'after-init-hook (lambda () (load-file "~/.emacs.d/kramar.el")))

