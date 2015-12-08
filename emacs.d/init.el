(server-start)

(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("melpa" . "https://melpa.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")))

  (package-initialize)
  (when (not package-archive-contents)
    (package-refresh-contents))
  (dolist (p '(
               color-theme
               color-theme-monokai
               color-theme-sanityinc-solarized
               rainbow-delimiters
               popwin
               cider
               clojure-mode
               paredit
               markdown-mode
               company
               auto-async-byte-compile
               helm
               ))
    (when (not (package-installed-p p))
      (package-install p))))

(load "~/.emacs.d/packages.el")
(load "~/.emacs.d/settings.el")