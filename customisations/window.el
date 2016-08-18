; activate winner-mode for easy window zooming and restore
(winner-mode 1)

; when in graphical mode start server so that emacsclient can be used
(when (display-graphic-p)
    (server-start))
