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

(load-theme 'atom-one-dark t)

(global-set-key (kbd "M-j") 'windmove-down)
(global-set-key (kbd "M-k") 'windmove-up)
(global-set-key (kbd "M-l") 'windmove-right)
(global-set-key (kbd "M-h") 'windmove-left)

; Editing
(setq indent-tabs-mode nil)
(setq js-indent-level 2)

;
; Packages
;

(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))


(require 'init-evil)
(require 'init-whitespace)
(require 'init-haskell)
(require 'init-flycheck)
(require 'init-diredp)
(require 'init-markdown)
(require 'init-web-mode)
(require 'init-purescript)
(require 'init-php-mode)
(require 'init-r-mode)
