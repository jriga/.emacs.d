;; No cursor blinking, it's distracting
(blink-cursor-mode 0)

;; Show line numbers
;;(global-linum-mode)

;; Turn off the menu bar at the top of each frame because it's distracting
(menu-bar-mode -1)

;; no bell
(setq ring-bell-function 'ignore)

;;(load-theme 'tango-dark)
;;(load-theme 'manoj-dark)
(load-theme 'bliss t)

;; shrink-window 
(global-set-key (kbd "C-x <up>") 'shrink-window)

;; enlarge-window
(global-set-key (kbd "C-x <down>") 'enlarge-window)


;; (setq powerline-arrow-shape 'arrow)   ;; the default
(setq powerline-arrow-shape 'curve)   ;; give your mode-line curves
;;(setq powerline-arrow-shape 'arrow14) ;; best for small fonts

