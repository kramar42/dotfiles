;; Color theme
(require 'color-theme-github)

;; Get out - GUI
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Window numbered mode
(autoload 'window-number-meta-mode "window-number" t)
(window-number-meta-mode 1)

;; Desktop
(setq history-length 250)
(add-to-list 'desktop-globals-to-save 'file-name-history)
(add-to-list 'desktop-modes-not-to-save 'Info-mode)
(add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)

(add-hook 'comint-output-filter-functions
            'comint-strip-ctrl-m)

;; whitespace
(require 'whitespace)
(setq whitespace-line-column 160)

;; fci
(setq-default fill-column 80)
(setq fci-rule-width 1)
(setq fci-rule-color "lightblue")

;;  ido-styled
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)

;; find-things-fast
(defvar ftf-filetypes '("*") "All files")

;; hotkeys
(global-set-key (kbd "M-p") 'ftf-find-file)
(global-set-key (kbd "M-F") 'ftf-grepsource)
(global-set-key (kbd "C-x C-g") 'goto-line)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "\e M-SPC") 'just-one-space)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-x a") 'org-cicle-agenda-files)

;; set macro commands
(global-set-key [f2] 'kmacro-call-macro)
(global-set-key [f3] 'kmacro-start-macro-or-insert-counter)
(global-set-key [f4] 'kmacro-end-or-call-macro)

;; Use backward-kill-word instead of Backspace
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)

;; Shortcuts for switching buffers
(global-set-key [?\C-,] 'previous-buffer)
(global-set-key [?\C-.] 'next-buffer)

;; Bookmarks
(global-set-key [f5] 'bookmark-set)
(global-set-key [f6] 'bookmark-jump)

;; ORG mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-agenda-files (list "~/Code/anarchy/anarchy.org"
                             "~/Dropbox/Documents/org.org"))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)

;; Compiling shortcut
(global-set-key [\C-f9] 'compile)

;; Python Run
;; (global-set-key [f9] 'py-execute-buffer-python)

;; set up time & date
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time)

(defun prh:kill-current-buffer ()
    (interactive)
    (kill-buffer (current-buffer)))
(global-set-key (kbd "M-k") 'prh:kill-current-buffer)

(defun copy-line (&optional arg)
  " copy line from current point to the end of line"
  (interactive)
  (toggle-read-only t)
  (kill-line arg)
  (toggle-read-only 0))
(setq-default kill-read-only-ok t)
(global-set-key (kbd "C-c k") 'copy-line)

;; Toggle between saved positions as in MIM editor
(defun save-point-and-switch ()
  "Save current point to register 0 and go
to the previously saved position"
 (interactive)
 (let (temp)
   (setq temp (point-marker))
   (when (not (equal (get-register 0) nil))
     (jump-to-register 0))
   (set-register 0 temp)))

;; Save current position to register 0
(defun save-point-only ()
 "Save current point to register 0"
 (interactive)
 (set-register 0 (point-marker)))

(global-set-key (kbd "\e\e/") 'save-point-and-switch)
(global-set-key (kbd "\e\e?") 'save-point-only)

;; uniquify - for files with same names
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Git
(autoload 'magit-status "magit" nil t)

;;; PATH
(setq *PATH* (shell-command-to-string "source $HOME/.zshrc && printf $PATH"))
(if (not (getenv "TERM_PROGRAM"))
       (setenv "PATH" *PATH*))
(setq exec-path (append exec-path (split-string *PATH* ":")))

(eval-after-load 'flymake '(require 'flymake-cursor))

;; python
(defun my-python-hook ()
  (whitespace-mode t)
  (fci-mode t)
  (setq py-ident-offset 4
        py-smart-indentation t)

  (setq font-lock-maximum-decoration t)
  (add-hook 'find-file-hook 'flymake-find-file-hook)

  ;; idle-highlight
  (idle-highlight-mode t)

  ;; yas
  (yas/load-directory "~/.emacs.d/snippets"))

(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode)
                                   interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)
(add-hook 'python-mode-hook 'my-python-hook)

(require 'imenu)
(defun ido-goto-symbol ()
  "Will update the imenu index and then use ido to select a
   symbol to navigate to"
  (interactive)
  (imenu--make-index-alist)
  (let ((name-and-pos '())
        (symbol-names '()))
    (flet ((addsymbols (symbol-list)
                       (when (listp symbol-list)
                         (dolist (symbol symbol-list)
                           (let ((name nil) (position nil))
                             (cond
                              ((and (listp symbol) (imenu--subalist-p symbol))
                               (addsymbols symbol))

                              ((listp symbol)
                               (setq name (car symbol))
                               (setq position (cdr symbol)))

                              ((stringp symbol)
                               (setq name symbol)
                               (setq position (get-text-property 1 'org-imenu-marker symbol))))

                             (unless (or (null position) (null name))
                               (add-to-list 'symbol-names name)
                               (add-to-list 'name-and-pos (cons name position))))))))
      (addsymbols imenu--index-alist))
    (let* ((selected-symbol (ido-completing-read "Symbol? " symbol-names))
           (position (cdr (assoc selected-symbol name-and-pos))))
      (goto-char position))))

(global-set-key (kbd "C-t") 'ido-goto-symbol)

;; uniquify – for uniq buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; deploy.sh
(defun deploy-message (process event)
  (message "Deploing project... Done."))

(defun my-deploy ()
  (interactive)
  (message "Deploing project... ")
  (save-buffer (current-buffer))
  (start-process-shell-command "deploy-process" "*Deploy*" "deploy.sh")
  (set-process-sentinel (get-process "deploy-process") 'deploy-message))

(global-set-key (kbd "C-c M-b") 'my-deploy)


(mapcar*
 (lambda (r e) ; R and E are matching Russian and English keysyms
   ; iterate over modifiers
   (mapc (lambda (mod)
    (define-key input-decode-map
      (vector (list mod r)) (vector (list mod e))))
  '(control meta super hyper))
   ; finally, if Russian key maps nowhere, remap it to the English key without
   ; any modifiers
   (define-key local-function-key-map (vector r) (vector e)))
   "йцукенгшщзхъфывапролджэячсмитьбю"
   "qwertyuiop[]asdfghjkl;'zxcvbnm,.")


;; markdown
(setq auto-mode-alist (cons '("\\.md$" . markdown-mode) auto-mode-alist))

;; haskell
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))

;; yaml
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "<enter>" 'newline-and-indent)))

;; popwin
(setq display-buffer-function 'popwin:display-buffer)

;; LaTex
;; (require 'tex-site)

;; auto-complete
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)

;; w3m
(setq browse-url-browser-function 'w3m-browse-url)
(global-set-key (kbd "C-x RET") 'browse-url-at-point)
(setq w3m-use-cookies t)

