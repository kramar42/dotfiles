(require 'color-theme)
(color-theme-initialize)
(color-theme-monokai)
; bharadwaj-slate classic gnome2 gray30 green-kingsajz
; jedit-grey robin-hood shaman snow subtle-hacker vim-colors
; whateverytouwant white-on-gray charcoal-black
(set-cursor-color "#c1cdc1")

(require 'column-marker)
(column-marker-3 80)

(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)

(require 'imenu)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(require 'popwin)
(popwin-mode 1)

(require 'desktop)
(desktop-save-mode 1)
(desktop-read)

(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

(require '4clojure)

(require 'paredit)
(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

(require 'cider)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)
(setq cider-repl-tab-command 'indent-for-tab-command)
(setq cider-repl-pop-to-buffer-on-connect nil)
(setq cider-popup-stacktraces nil)
(setq cider-auto-select-error-buffer t)
(setq cider-stacktrace-fill-column 80)
(setq cider-prompt-save-file-on-load nil)
(set cider-repl-result-prefix " => ")
(set cider-interactive-eval-result-prefix " => ")
(setq cider-repl-use-clojure-font-lock t)
(setq cider-repl-wrap-history t)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
