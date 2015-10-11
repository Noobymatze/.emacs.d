; Dired+
(require 'dired+)

; Dired in evil mode
(evil-define-key 'normal dired-mode-map "-" 'diredp-up-directory-reuse-dir-buffer)
(evil-define-key 'normal dired-mode-map "d" 'dired-create-directory)
(evil-define-key 'normal dired-mode-map "n" 'evil-search-next)
(evil-define-key 'normal dired-mode-map "N" 'evil-search-previous)
(evil-define-key 'normal dired-mode-map "q" 'kill-this-buffer)

(provide 'init-diredp)
