; disable pop-ups
(autoload 'popwin "popwin" "" t)

; save emacs sessions
(autoload 'desktop "desktop" "" t)

; rainbow parens
(autoload 'rainbow-delimiters "rainbow" "" t)

; auto-complete mode
(require 'auto-complete)

; org mode
(autoload 'org-install "org-install" "" t)

; lisp dev
(add-to-list 'load-path "~/.emacs.d/elpa/slime/")
(require 'slime)
(require 'slime-autoloads)

; interactively do
(require 'ido)

; ido menu
(require 'imenu)

; auto-compile
(add-to-list 'load-path "~/.emacs.d/elpa/")
(require 'auto-async-byte-compile)
