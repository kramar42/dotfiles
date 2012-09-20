(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit
                      starter-kit-bindings
                      color-theme-github

                      ;; tools
                      magit smex find-things-fast wgrep
                      fill-column-indicator popwin w3m
                      window-number elisp-cache
                      
                      ; python development
                      python-mode pymacs

                      ; other
                      flymake-cursor
                      js2-mode 
		      markdown-mode rainbow-mode
                      yaml-mode
		      cdlatex
                      auto-complete
                      
                      gnugo
                      yasnippet)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


(custom-set-variables
 '(browse-url-browser-function (quote browse-default-macosx-browser))
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(default-input-method "russian-computer")
 '(desktop-path (quote ("." "~/.emacs.d/" "~")))
 '(desktop-save-mode 1)
 '(display-time-mode t)
 '(global-hi-lock-mode t)
 '(global-hl-line-mode t)
 '(require-final-newline t)
 '(initial-frame-alist (quote ((width . 168) (height . 47))))
 '(ispell-program-name "/usr/bin/aspell")
 '(menu-bar-mode t)
 '(ns-alternate-modifier (quote none))
 '(ns-command-modifier (quote meta))
 '(scroll-step 1)
 '(sgml-basic-offset 4)
 '(sgml-mode-hook (quote ((lambda nil (flymake-mode nil) (flyspell-mode nil)))))
 '(visible-bell nil)
 '(x-select-enable-clipboard t))
(custom-set-faces)
(put 'dired-find-alternate-file 'disabled nil)


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
