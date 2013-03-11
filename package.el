(load "package")
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(
                      ; emacs mode for interacting with the Git
		      magit
                      ; install color themes
                      color-theme
                      ; M-x ido-style fuzzy matching
                      smex
		      ; Pop-Up window manager
		      popwin
                      ; faster emacs startup
                      elisp-cache
                      ; save partial status of emacs
                      desktop
                      ; regexp evaluation tool
                      regex-tool
                      ; minor mode for spell checking
                      speck
		      ; writable grep buffer
		      wgrep
                      ; auto-completion for emacs
                      auto-complete
		      ; jump to window by number
		      window-number
		      		      
                      ; universal on-the-fly syntax checker
                      ;flymake
                      ; show flymake messages in minibuffer
                      ;flymake-cursor
                      ; slime
                      ; installed through apt-get
                      ;ac-slime

                      ; template engine
                      ;yasnippet)
) "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
