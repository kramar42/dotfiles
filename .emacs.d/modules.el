; save emacs sessions
(autoload 'desktop "desktop" "" t)

; auto-complete mode
(require 'auto-complete)

; org mode
(autoload 'org-install "org-install" "" t)

; interactively do
(require 'ido)

; ido menu
(require 'imenu)

; auto-compile
(add-to-list 'load-path "~/.emacs.d/elpa/")
(require 'auto-async-byte-compile)

; popwin
(require 'popwin)
