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
;; from http://www.emacswiki.org/emacs/GlobalTextScaleMode
;; see my-functions
;; doesn't work : text-scale-mode-amount must be set through user interaction
;; (global-set-key (kbd "M-0")
;;                 '(lambda () (interactive)
;;                    (global-text-scale-adjust (- text-scale-mode-amount))
;;                    (global-text-scale-mode -1)))
(global-set-key (kbd "M-+")
                '(lambda () (interactive) (global-text-scale-adjust 1)))
(global-set-key (kbd "M--")
                '(lambda () (interactive) (global-text-scale-adjust -1)))
;; in plantuml-mode only
(setq plantuml-mode-map (make-keymap))
(eval-after-load 'plantuml-mode
  '(define-key plantuml-mode-map (kbd "TAB") 'plantuml-complete-symbol))
;; smex https://github.com/nonsequitur/smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
