(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
 "e" 'find-file
 "b" 'switch-to-buffer
 "k" 'kill-buffer
 "," 'previous-buffer
 "." 'next-buffer)
(evil-leader/set-key-for-mode 'emacs-lisp-mode "b" 'byte-compile-file)

(require 'evil)
(evil-mode 1)
(define-key evil-normal-state-map (kbd "C-.") 'next-buffer)

(require 'color-theme)
(color-theme-initialize)
(color-theme-charcoal-black)
(setq evil-default-cursor t)
(set-cursor-color "#c1cdc1")

(require 'column-marker)
(column-marker-3 80)

(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

(require 'w3m)

;(load-file "~/.emacs.d/modules.el")
;(load-file "~/.emacs.d/variables.el")
;(load-file "~/.emacs.d/keybindings.el")
;(load-file "~/.emacs.d/hooks.el")
