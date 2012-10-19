; time emacs
(require 'cl)
(defvar *emacs-load-start* (current-time))

(load-file "~/.emacs.d/package.el")
(load-file "~/.emacs.d/modules.el")
(load-file "~/.emacs.d/variables.el")
(load-file "~/.emacs.d/keybindings.el")
(load-file "~/.emacs.d/hooks.el")

(message "Loaded in %ds" (destructuring-bind (hi lo ms) (current-time)
                           (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))
