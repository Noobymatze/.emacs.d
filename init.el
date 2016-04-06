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
(global-unset-key (kbd "C-SPC"))

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

(use-package atom-one-dark-theme
  :ensure
  :init
  (load-theme 'atom-one-dark t))


;
; Evil leader
;

(use-package evil-leader
  :ensure
  :init
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key "g" 'magit-status)
  (evil-leader/set-key "b" 'ido-switch-buffer)
  (evil-leader/set-key "f" 'find-file)
  (evil-leader/set-key-for-mode 'org-mode "e" 'org-html-export-to-html))


;
; Evil mode
; 

(use-package evil
  :ensure
  :config 
  (add-to-list 'evil-emacs-state-modes 'eshell)
  (evil-mode t))


;
; Magit
;

(use-package magit
  :ensure
  :init
  (global-set-key (kbd "C-x g") 'magit-status))



;
; Evil Magit
;

(use-package evil-magit
  :ensure
  )


;
; Key chord mainly for exiting
; evil mode with 'jj'
; 

(use-package key-chord
  :ensure
  :config 
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (key-chord-mode t))


;
; Whitespace mode
; Mainly used to mark lines longer than 80 chars
; in markdown-mode.
;

(use-package whitespace
  :ensure
  :init 
  (add-hook 'markdown-mode-hook 'whitespace-mode)
  (add-hook 'tex-mode-hook 'whitespace-mode)
  :config
  (setq whitespace-line-column 80)
  (setq whitespace-style '(face lines-tail)))


;
; Flycheck
;

(use-package flycheck
  :ensure
  :init 
  (add-hook 'after-init-hook #'global-flycheck-mode)
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))


;
; Ido mode
;

(use-package ido
  :init
  (ido-mode 1)
  :config
  (setq ido-everywhere t)
  (setq ido-enable-flex-matching t))


;
; Dired+
;

(use-package dired+
  :ensure
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
  :ensure
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
  :ensure
  :init (add-to-list 'auto-mode-alist '(".md" . markdown-mode)))


; 
; Web mode
;

(use-package web-mode
  :ensure
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
  :ensure
  :init 
  (add-hook 'purescript-mode-hook 'turn-on-purescript-indentation))


;
; Elm mode
;

(use-package elm-mode
  :ensure
  )


;
; Javascript development
;

(use-package js2-mode
  :ensure
  :mode (("\\.js$" . js2-mode))
  :config
  (setq-default 
   js2-switch-indent-offset t
   js2-highlight-level 3
   js2-basic-offset 2))


;
; SCSS files
;

(use-package scss-mode
  :ensure
  :config
  (setq-default 
   scss-compile-at-save nil
   css-indent-offset 2))


;
; Company mode
;

(use-package company
  :ensure
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  (global-set-key (kbd "C-SPC") 'company-complete)
  (set 'company-idle-delay .3)

  :config 
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))


;
; Powerline
;

(use-package powerline
  :ensure
  :init
  (powerline-default-theme))


;
; Org mode
;

(use-package org
  :init
  (org-babel-do-load-languages 'org-babel-load-languages '((python . t)
                                                           (java . t)
                                                           (sql . t)
                                                           (C . t))))


;
; Which key
;

(use-package which-key
  :ensure
  :init
  (which-key-mode))
