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
                               (setq position (get-text-property 1
                                               'org-imenu-marker symbol))))

                             (unless (or (null position) (null name))
                               (add-to-list 'symbol-names name)
                               (add-to-list 'name-and-pos
                                            (cons name position))))))))
      (addsymbols imenu--index-alist))
    (let* ((selected-symbol (ido-completing-read "Symbol? " symbol-names))
           (position (cdr (assoc selected-symbol name-and-pos))))
      (goto-char position))))

(global-set-key (kbd "C-t") 'ido-goto-symbol)


;; Немного настроим выравнивание отступов под себя
;; Более подробно о кастомизации этого дела можно почитать
;;   в сорцах SLIME, а именно
;;     в %путь_к_slime%/contrib/slime-cl-indent.el
(define-common-lisp-style "my-indent-style"
  "My custom indent style."
  (:inherit "modern")
  (:variables
    (lisp-loop-indent-subclauses t))    
  (:indentation
    (if (4 2 2))
    (define (&lambda 2))
    (with-gensyms ((&whole 4 &rest 1) &body))
    (once-only (as with-gensyms))))

(setq common-lisp-style-default "my-indent-style")
(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))

(add-hook 'comint-output-filter-functions
            'comint-strip-ctrl-m)

(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
