;; Modules setup
; magit
(autoload 'magit-status "magit" nil t)

; flymake
(eval-after-load 'flymake '(require 'flymake-cursor))

; windows number
(autoload 'window-number-meta-mode "window-number" "" t)
(window-number-meta-mode 1)

; desktop mode
(desktop-save-mode 1)

; auto-compile
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")

; auto-complete
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; dirty fix for having AC everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                         (auto-complete-mode 1))
                       ))
(real-global-auto-complete-mode t)

; ido mode
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)

; ORG mode
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
; TO CHANGE
(setq org-agenda-files (list "~/Dropbox/orgs/*.org"))

; SLIME
; (setq-default indent-tabs-mode nil)
; (setq inferior-lisp-program "sbcl")
; (setq slime-net-coding-system 'utf-8-unix)

; (slime-setup '(slime-repl
;               slime-fuzzy
;               slime-fancy-inspector
;               slime-indentation))

; (setq lisp-indent-function 'common-lisp-indent-function)


;; Appearance
; Disable GUI
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

; Color theme
(require 'color-theme)
(color-theme-subtle-hacker)
; bharadwaj-slate classic gnome2 gray30 green-kingsajz
; jedit-grey robin-hood shaman snow subtle-hacker vim-colors
; whateverytouwant white-on-gray

; Font setup
(set-default-font "DejaVu Sans Mono")
(set-face-attribute 'default nil :height 100)

;; Emacs Behavior
; History
(setq history-length 1000)

; Languages
(setq current-language-environment "UTF-8")
(setq default-input-method "russian-computer")

; Disabel autosave
(setq auto-save-default nil)
(setq backup-inhibited t)

; Disable cursor blinking
(blink-cursor-mode 0)

; Need final newline
(setq require-final-newline t)

; Set bell to visible
(setq visible-bell nil)

; Smooth scrool
(setq scroll-step 1
      scroll-conservatively 10000)

; Better C-w behaviour
(defun unix-werase-or-kill (arg)
  (interactive "*p")
  (if (and transient-mark-mode
	   mark-active)
      (kill-region (region-beginning) (region-end))
    (backward-kill-word arg)))
