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


(add-hook 'js-mode-hook 'my-paredit-nonlisp)
(add-hook 'js-mode-hook 'electric-pair-mode)

;; JSHint
;; before run cmd `$npm install -g jshint jslint`
(require 'flymake-jslint)
(add-hook 'js-mode-hook 'flymake-jslint-load)


;; JS intdent 2 spaces for TAB
(setq js-indent-level 2)
