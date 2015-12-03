(require 'color-theme)
(color-theme-initialize)
(color-theme-charcoal-black)
; bharadwaj-slate classic gnome2 gray30 green-kingsajz
; jedit-grey robin-hood shaman snow subtle-hacker vim-colors
; whateverytouwant white-on-gray charcoal-black
(set-cursor-color "#c1cdc1")

(require 'column-marker)
(column-marker-3 80)

(require 'rainbow-delimiters)
;(add-hook 'prog-mode-hook 'rainbow-delimeters-mode)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)

(require 'imenu)

(require 'popwin)
(popwin-mode 1)

(require 'desktop)

(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

(require 'paredit)
(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)

(require 'cider)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)
(setq cider-repl-tab-command 'indent-for-tab-command)
(setq cider-repl-pop-to-buffer-on-connect nil)
(setq cider-popup-stacktraces nil)
(setq cider-auto-select-error-buffer t)
(setq cider-stacktrace-fill-column 80)
(setq cider-prompt-save-file-on-load nil)
(setq cider-repl-result-prefix " => ")
(setq cider-interactive-eval-result-prefix " => ")
(setq cider-repl-use-clojure-font-lock t)
(setq cider-repl-wrap-history t)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

(require 'evil)
(evil-mode 1)

(global-evil-leader-mode)
(evil-leader/set-leader ",")

(evil-leader/set-key
 "e" 'find-file
 "b" 'ibuffer
 "w" 'save-buffer
 "x" 'execute-extended-command
 "d" 'cider-pprint-eval-defun-at-point
 "r" 'cider-load-buffer
 )
