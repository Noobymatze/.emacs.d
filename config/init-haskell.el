;
; Haskell mode
; 

(require 'haskell-interactive-mode)
(require 'haskell-process)

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(custom-set-variables
 '(haskell-auto-import-loaded-modules t)
 '(haskell-process-type 'stack-ghci)
 '(haskell-process-suggest-remove-import-lines t))

(provide 'init-haskell)
