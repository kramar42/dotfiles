(blink-cursor-mode -1)
(tool-bar-mode -1)
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
(setq inhibit-startup-echo-area-message "kramar")
(setq inhibit-startup-message t)
(defalias 'yes-or-no-p 'y-or-n-p)
;(add-to-list 'exec-path "/usr/local/bin")


(setq column-number-mode t)
;; (set-face-attribute 'default nil :font "Monaco" :height 110)
(setq iswitchb-buffer-ignore '("^ " "*Completions*" "*Shell Command Output*"
                               "*Messages*" "Async Shell Command"))
(setq mac-command-modifier 'control)

(server-start)

(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")))
  (package-initialize)
  (when (not package-archive-contents)
    (package-refresh-contents))
  (dolist (p '(color-theme
               color-theme-monokai
               column-marker
               rainbow-delimiters
               w3m
               popwin
               4clojure
               clojure-mode
               cider
               paredit
               evil
               evil-leader
               auto-async-byte-compile))
    (when (not (package-installed-p p))
      (package-install p))))

(add-hook 'after-init-hook (lambda () (load-file "~/.emacs.d/kramar.el")))

