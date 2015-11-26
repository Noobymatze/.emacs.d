;
; Personal information
;

(setq user-full-name "Matthias Metzger")


;
; Online package locations
;

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.milkbox.net/packages/"))

(add-to-list 'package-archives
	     '("marmalade" . "https://marmalade-repo.org/packages/"))

(package-initialize)


;
; General configuration
;

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1))

(prefer-coding-system 'utf-8)

(global-linum-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)
(setq-default indent-tabs-mode nil)

(global-set-key (kbd "M-j") 'windmove-down)
(global-set-key (kbd "M-k") 'windmove-up)
(global-set-key (kbd "M-l") 'windmove-right)
(global-set-key (kbd "M-h") 'windmove-left)

;
; Packages with use-package
;

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

;
; Color theme
;

(use-package atom-one-dark
  :init
  (load-theme 'atom-one-dark t))


;
; Evil mode
; 

(use-package evil
  :config 
  (add-to-list 'evil-emacs-state-modes 'eshell)
  (evil-mode t))


;
; Key chord mainly for exiting
; evil mode with 'jj'
; 

(use-package key-chord
  :config 
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (key-chord-mode t))


;
; Whitespace mode
; Mainly used to mark lines longer than 80 chars
; in markdown-mode.
;

(use-package whitespace
  :init 
  (add-hook 'markdown-mode-hook 'whitespace-mode)
  :config
  (setq whitespace-line-column 80)
  (setq whitespace-style '(face lines-tail)))


;
; Flycheck
;

(use-package flycheck
  :init 
  (add-hook 'after-init-hook #'global-flycheck-mode)
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))


;
; Dired+
;

(use-package dired+
  :config
  (evil-define-key 'normal dired-mode-map "-" 'diredp-up-directory-reuse-dir-buffer)
  (evil-define-key 'normal dired-mode-map "d" 'dired-create-directory)
  (evil-define-key 'normal dired-mode-map "n" 'evil-search-next)
  (evil-define-key 'normal dired-mode-map "N" 'evil-search-previous)
  (evil-define-key 'normal dired-mode-map "q" 'kill-this-buffer))


;
; Haskell
;

(use-package haskell-mode
  :init
  (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
  :config
  (custom-set-variables
   '(haskell-process-type 'stack-ghci)
   '(haskell-auto-import-loaded-modules t)
   '(haskell-process-suggest-remove-import-lines t)))


;
; Markdown
;

(use-package markdown-mode
  :init (add-to-list 'auto-mode-alist '(".md" . markdown-mode)))


; 
; Web mode
;

(use-package web-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'"))))
; (setq css-indent-offset 2)


; 
; Purescript
;

(use-package purescript-mode
  :init 
  (add-hook 'purescript-mode-hook 'turn-on-purescript-indentation))


;
; Javascript development
;

(use-package js2-mode
  :mode (("\\.js$" . js2-mode))
  :config
  (setq-default 
   js2-highlight-level 3
   js2-basic-offset 2))
