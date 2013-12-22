(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
 "e" 'find-file
 "b" 'switch-to-buffer
 "k" 'kill-buffer
 "," 'previous-buffer
 "." 'next-buffer)
; (evil-leader/set-key-for-mode 'emacs-lisp-mode "b" 'byte-compile-file)

(require 'evil)
(evil-mode 1)

(require 'color-theme)
(color-theme-initialize)
(color-theme-monokai)
; bharadwaj-slate classic gnome2 gray30 green-kingsajz
; jedit-grey robin-hood shaman snow subtle-hacker vim-colors
; whateverytouwant white-on-gray charcoal-black
(setq evil-default-cursor t)
(set-cursor-color "#c1cdc1")

(require 'column-marker)
(column-marker-3 80)

(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

(require 'w3m)

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

; (todo '(flymake magit))
