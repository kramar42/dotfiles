(add-to-list 'load-path "~/.emacs.d/")
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq indent-tabs-mode nil)
(setq default-tab-width 4)
(setq c-default-style "linux"
      c-basic-offset 4)
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq ring-bell-function 'ignore)
(setq auto-window-vscroll nil)
(setq mouse-wheel-follow-mouse nil)
(setq compilation-read-command nil)
(show-paren-mode 1)
(define-key global-map (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-,") 'previous-buffer)
(global-set-key (kbd "C-.") 'next-buffer)
(global-set-key (kbd "C-x t") 'delete-trailing-whitespace)
(global-set-key (kbd "C-x g") 'goto-line)
(global-set-key (kbd "C-x c") 'compile)
(iswitchb-mode 1)
(electric-pair-mode 1)
(recentf-mode 1)
(setq column-number-mode t)
(set-face-attribute 'default nil :font "Monaco" :height 110)
(setq iswitchb-buffer-ignore '("^ " "*Completions*" "*Shell Command Output*"
							   "*Messages*" "Async Shell Command"))
(server-start)

(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")))
  (package-initialize)
  (when (not package-archive-contents)
    (package-refresh-contents))
  (dolist (p '(color-theme column-marker highlight-current-line))
    (when (not (package-installed-p p))
      (package-install p))))

(add-hook 'after-init-hook (lambda () (load-file "~/.emacs.d/kramar.el")))
