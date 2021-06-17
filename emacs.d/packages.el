(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(require 'rainbow-mode)
(rainbow-mode t)

(require 'popwin)
(popwin-mode 1)
(global-set-key (kbd "C-z") popwin:keymap)

(require 'magit)
(define-key ctl-x-map "\C-n" 'magit-status)

(ido-mode t)
(setq ido-enable-flex-matching t)
(ido-everywhere t)
(ido-ubiquitous-mode t)

;; (require 'helm-config)
;; (helm-mode 1)
;; (helm-autoresize-mode 1)
;; (setq helm-mode-fuzzy-match t)
;; (setq helm-completion-in-region-fuzzy-match t)

;; (custom-set-faces
;;  '(helm-candidate-number ((t (:background "#002b36"))))
;;  '(helm-ff-directory ((t (:foreground "#2aa198"))))
;;  '(helm-ff-dotted-directory ((t (:foreground "gray30"))))
;;  '(helm-ff-dotted-symlink-directory ((t (:foreground "gray30"))))
;;  '(helm-ff-executable ((t (:foreground "#859900"))))
;;  '(helm-ff-file ((t (:foreground "#657b83"))))
;;  '(helm-ff-prefix ((t nil)))
;;  '(helm-header ((t nil)))
;;  '(helm-header-line-left-margin ((t nil)))
;;  '(helm-match ((t (:foreground "#d002b36" :background "#d33682"))))
;;  '(helm-selection ((t (:background "#073642" :foreground "#93a1a1" :underline nil))))
;;  '(helm-source-header ((t (:background "#002b36" :foreground "white" :weight bold)))))

;; (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)

(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

(require 'imenu)

(require 'desktop)

(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

(require 'paredit)
(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)

(require 'clojure-mode-extra-font-locking)

(require 'cider)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(setq nrepl-hide-special-buffers t)
(setq cider-repl-tab-command 'indent-for-tab-command)
(setq cider-popup-stacktraces nil)
(setq cider-auto-select-error-buffer t)
(setq cider-stacktrace-fill-column 80)
(setq cider-prompt-save-file-on-load nil)
(setq cider-repl-result-prefix " => ")
(setq cider-interactive-eval-result-prefix " => ")
(setq cider-repl-use-clojure-font-lock t)
(setq cider-repl-wrap-history t)
(setq cider-repl-pop-to-buffer-on-connect t)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(require 'linum-relative)
(linum-relative-mode t)
