;; Modifiers work with russian layout
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

;; set up time & date
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time)

;; fci
(setq-default fill-column 80)
(setq fci-rule-width 1)
(setq fci-rule-color "lightblue")

;; whitespace
(setq whitespace-line-column 80)

