;
; Evil mode
;
; Coming from vim, living with original emacs keybindings is just
; not possible in the long run.
;

(require 'evil)

(add-to-list 'evil-emacs-state-modes 'eshell)

(evil-mode 1)

; Putting this stuff here, since I don't need key-chord anywhere
; else. If that day comes, I'll have to think about it.

; Key chord
(require 'key-chord)
(key-chord-mode 1)

; ESC is soooo far away...
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)

(provide 'init-evil)
