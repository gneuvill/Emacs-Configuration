(defgroup my-functions nil
  "Mes fonctions à moi"
  :group 'local)

(defun my-rename-buf (name)
  "Renames current buffer"
  (interactive "MBuffer Name :")
  (let ((buf-name (buffer-name)))
    (let ((new-buf-name (generate-new-buffer-name (concat buf-name "<" name ">"))))
      (rename-buffer new-buf-name))))

;; from http://www.emacswiki.org/emacs/GlobalTextScaleMode
(define-globalized-minor-mode 
  global-text-scale-mode
  text-scale-mode
  (lambda () (text-scale-mode 1)))

;; from http://www.emacswiki.org/emacs/GlobalTextScaleMode
(defun global-text-scale-adjust (inc) (interactive)
  (text-scale-set 1)
  (kill-local-variable 'text-scale-mode-amount)
  (setq-default text-scale-mode-amount (+ text-scale-mode-amount inc))
  (global-text-scale-mode 1)
  )

(provide 'my-functions)