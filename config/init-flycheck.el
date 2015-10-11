;
; Flycheck configuration
;

(require 'flycheck)

(add-hook 'after-init-hook #'global-flycheck-mode)

; Don't want to continually get errors in my emacs-lisp code
(setq flycheck-disabled-checkers '(emacs-lisp-checkdoc))

(provide 'init-flycheck)
