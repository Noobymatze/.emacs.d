;
; Whitespace mode
; 

(require 'whitespace)

(setq whitespace-line-column 80)
(setq whitespace-style '(face lines-tail))

(add-hook 'markdown-mode-hook 'whitespace-mode)

(provide 'init-whitespace)
