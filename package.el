(require 'package)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(
                      ; emacs mode for interacting with the Git
                      magit
                      ; ido-style fuzzy matching
                      smex
                      ; writable grep buffer
                      wgrep
                      ; pop up window manager
                      popwin
                      ; select window by number
                      window-number
                      ; faster emacs startup
                      elisp-cache
                      ; save partial status of emacs
                      desktop
                      ; regexp evaluation tool
                      regex-tool
                      ; mode for diting parenheses
                      paredit
                      ; minor mode for spell checking
                      speck
                      ; universal on-the-fly syntax checker
                      flymake
                      flymake-shell
                      flymake-php
                      flymake-jslint
                      ; show flymake messages in minibuffer
                      flymake-cursor
                      ; hightline nested parens
		      rainbow-delimeters
                      ; auto-completion for emacs
                      auto-complete
                      ; template engine
                      yasnippet)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
