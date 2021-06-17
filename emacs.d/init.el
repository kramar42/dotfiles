(require 'package)
(setq package-archives '(("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))
(defvar packages
  '(;; color delimiters of different depth
    rainbow-delimiters
    ;; color strings that look like colors i.e. #0000ff
    rainbow-mode
    ;; popup window manager
    popwin
    ;; interactive completion
    helm
    ;; git porcelain
    magit
    ;; interactive environment for clojure
    cider
    ;; colors & keybindings
    clojure-mode
    ;; to test
    clojure-mode-extra-font-locking
    ;; structural editing
    paredit
    ;; text completion
    company
    ;; .el -> .elc no save
    auto-async-byte-compile
    ;; M-x enhancement
    smex
    ;; relative line numbers
    linum-relative
    ))
(dolist (p packages)
  (when (not (package-installed-p p))
    (package-install p)))

(load "~/.emacs.d/packages.el")
(load "~/.emacs.d/settings.el")
