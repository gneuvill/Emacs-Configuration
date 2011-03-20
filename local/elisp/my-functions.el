(defgroup my-functions nil
  "Mes fonctions à moi"
  :group 'local)

(defun my-rename-buf (name)
  "Renames current buffer"
  (interactive "M")
(let ((buf-name (buffer-name)))
  (let ((new-buf-name (generate-new-buffer-name (concat buf-name "<" name ">"))))
      (rename-buffer new-buf-name))))

(provide 'my-functions)