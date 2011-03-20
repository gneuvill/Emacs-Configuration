;;on utilise pas les flèches
(global-unset-key [C-up])
(global-unset-key [C-down])
(global-unset-key [C-right])
(global-unset-key [C-left])
(global-unset-key [up])
(global-unset-key [down])
(global-unset-key [right])
(global-unset-key [left])
;;divers
(global-set-key [(control x) ?,]
		'previous-multiframe-window)
(global-set-key "\M-p"
		'backward-paragraph)
(global-set-key "\M-n"
		'forward-paragraph)
(global-set-key [C-tab]
		'completion-at-point)
;; ressiner les fenêtres dans les frames au clavier
(define-key global-map (kbd "S-C-<left>") 'enlarge-window-horizontally)
(define-key global-map (kbd "S-C-<right>") 'shrink-window-horizontally)
(define-key global-map (kbd "S-C-<up>") 'enlarge-window)
(define-key global-map (kbd "S-C-<down>") 'shrink-window)
;; OrgMode
(global-set-key "\C-ca" 'org-agenda)
;; reload file = refresh buffer (called revert-buffer in emacs)
(global-set-key "x" (quote revert-buffer))