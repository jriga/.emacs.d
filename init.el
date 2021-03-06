;;;;
;; Packages
;;;;
(require 'package)

;; Marmalade
;;(add-to-list 'package-archives
;;             '("marmalade" . "https://marmalade-repo.org/packages/") t)
;;(add-to-list 'package-archives
;;             '("tromey" . "http://tromey.com/elpa/") t)
;;(add-to-list 'package-archives
;;             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit

    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode

    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking

    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    cider
    
    ;; allow ido usage in as many contexts as possible. see
    ;; customizations/better-defaults.el line 47 for a description
    ;; of ido
    ido-completing-read+
    ;; ido-ubiquitous old

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; project navigation
    projectile

    ;; colorful parenthesis matching
    rainbow-delimiters

    ;; edit html tags like sexps
    tagedit

    ;; fuzzy repo file finder
    find-file-in-repository

    ;; git integration
    magit

    ;; editorconfig
    editorconfig

    ;; js hint, depends on npm install jshint -g
    flymake-jshint

    ;; web-mode better html-mode
    web-mode

    ;; org task management
    org

    ;; better window navigation
    ace-window

    ;; better mode bar
    powerline

    ;; smart-mode-line
    smart-mode-line

    ;; bliss-theme
    bliss-theme

    ;; smart-mode-line
    smart-mode-line
    smart-mode-line-powerline-theme

    ;; ruby stuff
    rbenv
    markdown-mode+
    yaml-mode
    rspec-mode
    inf-ruby

    ;; emacs interaction
    disable-mouse


    ;; python IDE
    elpy
    flycheck))

;; On OS X, an Emacs instance started from the graphical user
;; interface will have a different environment than a shell in a
;; terminal window, because OS X does not run a shell during the
;; login. Obviously this will lead to unexpected results when
;; calling external utilities like make from Emacs.
;; This library works around this problem by copying important
;; environment variables from the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; avoid theme confirmation at start up
(setq sml/no-confirm-load-theme t)

(add-to-list 'load-path "~/.emacs.d/vendor")

;; Rsense
;; (require 'rsense)
;;
;; ;; Rsense + Autocomplete
;; (add-hook 'ruby-mode-hook
;;           (lambda ()
;;             (add-to-list 'ac-sources 'ac-source-rsense-method)
;;             (add-to-list 'ac-sources 'ac-source-rsense-constant)))


;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customisations")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")


;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")


;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")


;; Customizations for clojure
(load "my-clojure")


;; specific customization for javascript
(load "my-js")


;; specific customization for javascript
(load "my-python")


;; Editing functions tabs, current line, etc...
(load "editing")

;; Window related stuff
(load "window")

;; Tmux workaround
(load "tmux")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))
 '(package-selected-packages
   '(typescript-mode vue-mode flymake-python-pyflakes py-autopep8 whitespace-cleanup-mode rubocop ruby-electric 4clojure yaml-mode web-mode tagedit smex smart-mode-line-powerline-theme rspec-mode rainbow-delimiters puppet-mode projectile paredit markdown-mode+ magit log4j-mode inf-ruby ido-ubiquitous haml-mode gherkin-mode flymake-jshint floobits find-file-in-repository feature-mode exec-path-from-shell editorconfig clojure-mode-extra-font-locking cider bliss-theme ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)


;; activate rbenv globally
(global-rbenv-mode)


;; disable mouse in emacs
(global-disable-mouse-mode)


;; activate ido everywhere
(ido-ubiquitous-mode 1)
