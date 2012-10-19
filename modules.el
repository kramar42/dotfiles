; disable pop-ups
(require 'popwin)

; save emacs sessions
(require 'desktop)

; rainbow parens
(require 'rainbow-delimiters)

; auto-complete mode
(require 'auto-complete)
;(require 'auto-complete-config)

; org mode
(require 'org-install)

; lisp dev
(add-to-list 'load-path "~/.emacs.d/elpa/slime/")
(require 'slime)
(require 'slime-autoloads)

; interactively do
(require 'ido)

; ido menu
(require 'imenu)
