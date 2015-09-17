;;;;
;; Javascript
;;;;

(defun my-paredit-nonlisp ()
  "Turn on paredit mode for non-lisps.
   source: https://truongtx.me/2014/02/22/emacs-using-paredit-with-non-lisp-mode/
  "
  (interactive)
  (set (make-local-variable 'paredit-space-for-delimiter-predicates)
       '((lambda (endp delimiter) nil)))
  (paredit-mode 1))


;; JSHint
;; before run cmd `$npm install -g jshint`
(require 'flymake-jshint)
(add-hook 'js-mode-hook 'flymake-jslint-load)
(add-hook 'js-mode-hook 'electric-pair-mode)

;; JS intdent 2 spaces for TAB
(setq js-indent-level 2)
