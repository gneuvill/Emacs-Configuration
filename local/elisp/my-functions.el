(defgroup my-functions nil
  "Mes fonctions à moi"
  :group 'local)

(defun my-eshell ()
  (interactive)
  (eshell)
  (call-interactively 'my-rename-buf))

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

;; from http://www.emacswiki.org/emacs/IncrementNumber
 (defun increment-number-at-point ()
   (interactive)
   (skip-chars-backward "0123456789")
   (or (looking-at "[0123456789]+")
       (error "No number at point"))
   (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

(provide 'my-functions)
