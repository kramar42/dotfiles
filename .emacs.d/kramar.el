(require 'color-theme)
(color-theme-initialize)
(color-theme-hober)

(require 'column-marker)
(column-marker-3 80)

(require 'highlight-current-line)
(highlight-current-line-on t)
(set-face-background 'highlight-current-line-face "#333")

(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

;(load-file "~/.emacs.d/modules.el")
;(load-file "~/.emacs.d/variables.el")
;(load-file "~/.emacs.d/keybindings.el")
;(load-file "~/.emacs.d/hooks.el")
