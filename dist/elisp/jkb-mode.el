;;; jkb-mode.el --- A major mode for editing .m3u files

;; Copyright (C) 1998, 99 Stéphane Levant <sun@tuxfamily.org>

;; Author: Stéphane Levant <sun@tuxfamily.org>
;; Created: 1998
;; Keywords: multimedia
;; Version: 1.3
;; URL: http://arsunik.free.fr/emacs

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; I used this mode for playing all kinds of audio files whit a script shell in
;; some directories/hosts when I was on a solaris network.
;; I don't use it since I've xmms and I won't maintain it.

;; All comments/menus are in french.

;; Permet d'editer des fichiers d'extension .m3u
;; obtenus par exemple à l'aide de locate .mp3 > toto.jkb
;; (Pour plus d'info, voir l'aide de jkb-mode)
;;
;;  Rajouter les lignes suivantes dans le .emacs :
;;    (autoload 'jkb-mode "jkb-mode" "" t)
;;    (add-to-list 'auto-mode-alist '("\\.m3u$" . jkb-mode))

;;; Code:

;;; Princiaples options :
(defvar jkb-use-random t
  "* Joue les sons selectionne aleatoirement si non nil")
(defvar jkb-random-nb 10
  "* Nombre de sons selectionnes par la fonction random")
(defvar jkb-highlight nil
  "* Met en surbrillance les noms de fichier si different de nil")
(defvar jkb-message t
  "* Affiche des messages (play, stop...) si different de nil")
(defvar jkb-hide-directory t
  "* Cache le nom des repertoires si different de nil")
(defvar jkb-hide-extension t
  "* Cache l'extension du fichier si different de nil")
(defvar jkb-height-window 12
  "* Taille de le fenetre ou s'execute le programme `jkb-play-commande'
si nil, aucune fenetre n'est affiche")

;;; Autres variables
(defvar jkb-play-commande "mplayer")
(defvar jkb-volume-commande ":")
(defvar jkb-buffer "*Jkb Command*")

(defvar jkb-mode-hook nil)

;;; Couleur

(cond ((not (facep 'jkb-face-title1))
       (defvar jkb-face-title1 'jkb-face-title1)
       (copy-face 'bold 'jkb-face-title1)))
(cond ((not (facep 'jkb-face-title2))
       (defvar jkb-face-title2 'jkb-face-title2)
       (copy-face 'font-lock-function-name-face 'jkb-face-title2)))
(cond ((not (facep 'jkb-face-title3))
       (defvar jkb-face-title3 'jkb-face-title3)
       (copy-face 'font-lock-constant-face 'jkb-face-title3)))
(cond ((not (facep 'jkb-face-select))
       (defvar jkb-face-select 'jkb-face-select)
       (copy-face 'font-lock-warning-face 'jkb-face-select)
       (set-face-inverse-video-p jkb-face-select t)))

(defvar jkb-font-lock-keywords
  '(("^#.*"   0 jkb-face-title3 t)
    ("^##.*"  0 jkb-face-title2 t)
    ("^###.*" 0 jkb-face-title1 t)
    ("^\\* \\(.*\\)" 1 jkb-face-select t)))

;;; Touches & Menu

(defvar jkb-mode-map nil "Local keymap for jkb-mode buffers.")

(if jkb-mode-map
    nil
  (let ((map (make-keymap))
	(menu (make-sparse-keymap)))
    (suppress-keymap map)
    (define-key map [?\C-/]	'jkb-undo)
    (define-key map "\^_"	'jkb-undo)
    (define-key map "E"	'jkb-edit-file)
    (define-key map "S"	'jkb-save-file)
    (define-key map "h"	'jkb-help)
    (define-key map "q"	'jkb-quit)

    (define-key map "n"	'jkb-next-sound)
    (define-key map " "	'jkb-mark)
    (define-key map "m"	'jkb-mark)
    (define-key map "u"	'jkb-unmark-all)
    (define-key map "a"	'jkb-mark-all)
    (define-key map "k"	'jkb-mark-select)
    (define-key map "r"	'jkb-random)

    (define-key map "\^m"	'jkb-play)
    (define-key map "p"	'jkb-play)
    (define-key map "s"	'jkb-stop)
    (define-key map "c"	'jkb-interrupt)
    (define-key map "t"	'jkb-type-sound)
    (define-key map "l"	'jkb-ls)
    (define-key map "v"	'jkb-volume)

    (define-key map [mouse-1]	'jkb-mouse-mark)
    (define-key map [mouse-2]	'jkb-mouse-play)

    (define-key map [menu-bar jkb-mode]
      (cons "Juke-Box" menu))
    (define-key menu [aide]
      '("Aide (help)" . jkb-help))
    (define-key menu [edit]
      '("Editer le fichier (edit)" . jkb-edit-file))
    (define-key menu [save]
      '("Enregistrer le fichier (save)" . jkb-save-file))
    (define-key menu [volume]
      '("Volume" . jkb-volume))
    (define-key menu [ls]
      '("Info sur le fichier (ls)" . jkb-ls))
    (define-key menu [random]
      '("Selection aleatoire (random)" . jkb-random))
    (define-key menu [supprimer]
      '("Supprimer toutes les selections (unmark)" . jkb-unmark-all))
    (define-key menu [mark]
      '("Selectionner (mark)" . jkb-mark))
    (define-key menu [suivant]
      '("Suivant (next / C-c)" . jkb-interrupt))
    (define-key menu [arreter]
      '("Arreter (stop)" . jkb-stop))
    (define-key menu [jouer]
      '("Jouer (play)" . jkb-play))

    (setq jkb-mode-map map)))

;;;###autoload
(defun jkb-mode ()
  "* Jkb-mode:
	Un mode pour jouer des sons

	Raccourci :
	 SPACE / Mouse-1 : selectionne la ligne
	 ENTER / Mouse-2 : play

	Touches :
	 p : joue les sons selectionnes (play)
	     si aucun son n'est selectionne,
	     joue celui qui se trouve sur la ligne
	     utilise `jkb-play-programme'
	 s : arrete le son (stop)
	 c : passe au son suivant

	 n : va sur la ligne suivante (next)
	 m : selectionne ou deselectionne la ligne
	 r : selectionne des lignes au hasard (random)
	     par defaut, selectionne `jkb-random-nb'=10 lignes
	 a : selectionne tout
	 u : supprime toute les selections
	 k : selectionne une region

	 v : lance un programme permettant de modifier
	     le volume interactivement (`jkb-volume-programme')
	 l : fait un ls -l sur le fichier
	 t : affiche le nom du fichier en entier

	 E : permet d'editer le fichier (fundamental-mode)
	     pour revenir : M-x jkb-mode ou C-c C-j
	 S : enregistre le fichier (avec les selections)
	 q : quitte
	 h : affiche cette aide

	Selections par region :
	 On peut aussi selectionner a l'aide des regions d'emacs.
	 La selection est automatique quand on commence a jouer les sons.
	 On peut aussi appuyer sur k.

	Type de fichers :
	 Les lignes des fichiers edites sont de la forme:
	 [machine:]nom_de_fichier1
	 [machine:]nom_de_fichier2
	 ...
	 [machine:]nom_de_fichier_n

	 Il est possible de mettre des titres ou des commentaires :
	 il suffit de faire commencer la ligne par un #
	 On peut aussi laisser des lignes vides.
	 Pour creer un fichier, on peut par exemple faire :
	 locate .mp3 > toto.jkb

	Exemple de fichier :
	 ### kim kay
	 ## Bien
	 chico:/tmp/.toto/kim-kay.mp3
	 zeppo:/tmp/.tata/kim-kay-remix.mp3

	 ## Pas bien
	 harpo:/tmp/.titi/kim-kay-remix-beta3.mp3
	 groucho:/tmp/.tutu/kim-kay-remix-beta4.mp3

	Couleur :
	 On distingue trois types de titre, suivant le nombre de # :
	 ### couleur de la face jkb-face-title1
	 ##  couleur de la face jkb-face-title2
	 #   couleur de la face jkb-face-title3
	 Pour les lignes selectionnees :
	 *   couleur de la face jkb-face-select

	Affichage du texte :
	 Trois variables permettent de modifier l'affichage du texte,
	 selon qu'elle valent t ou nil :
	 `jkb-highlight'	: met le nom des sons en surbrillance
	 `jkb-hide-directory'	: cache les repertoires
	 `jkb-hide-extension'	: cache l'extension des noms de fichier

	Message :
	 Pour avoir ou non des messages (play, stop...),
	 donner a la variable `jkb-message' la valeur nil ou t.

	Random :
	 Par defaut, les sons sont joues aleatoirement, ce comportement
	 peut etre inhibe en donnant la valeur nil a la variable
	 `jkb-use-random'.

	Arguments prefixes :
	 Il est possible d'en specifier pour play, random, next et mark :
	 C-3 p jouera 3 fois les sons selectionnes.
	 C-3 r choisira 3 lignes au hasard.
	 C-3 m selectionnera 3 lignes a la suite.
	 C-3 n se deplacera 3 sons plus loin.

	Fenetre d'execution :
	 Pour voir dans une fenetre le buffer dans lequel s'execute le
	 programme `jkb-play-commande', donner une valeur non nulle à
	 la variable `jkb-height-window'.

	Hook : `jkb-mode-hook'

	Pour toutes suggestions, ne pas hesiter a m'ecrire :
	sun@tuxfamily.org"
  (interactive)
  (kill-all-local-variables)
  (setq major-mode 'jkb-mode
	mode-name "Juke Box"
	mode-line-buffer-identification '("Jkb: %12b"))
  (setq	truncate-lines t)
  (random t)
  (use-local-map jkb-mode-map)
  (make-local-variable 'font-lock-defaults)
  (setq font-lock-defaults '(jkb-font-lock-keywords nil nil nil))
  (jkb-prepare-txt)
  (toggle-read-only 1)
  (run-hooks 'jkb-mode-hook))

;;; Affichage du texte

(defun jkb-prepare-txt ()
  "  Executee avant l'affichage du buffer"
  (interactive)
  (goto-char (point-min))
  (let ((pt))
    (while (jkb-goto-sound t)
      (if (looking-at "[* ] ")
	  (forward-char 2)
	(insert "  "))
      (cond (jkb-highlight
	     (put-text-property (point) (line-end-position)
				'mouse-face 'highlight)))
      (cond ((and jkb-hide-directory (looking-at ".*/"))
	     (setq pt (point))
	     (end-of-line)
	     (search-backward "/" nil t)
	     (facemenu-set-invisible pt (1+ (point)))))
      (cond ((and jkb-hide-extension (looking-at ".*\\."))
	     (end-of-line)
	     (setq pt (point))
	     (search-backward "." nil t)
	     (facemenu-set-invisible (point) pt)))
      (next-line 1)))
  (goto-char (point-min))
  (set-buffer-modified-p nil))

;;; Global

(defun jkb-edit-file ()
  "  Permet d'editer le fichier
Pour revenir : M-x jkb-mode ou C-c C-j"
  (interactive)
  (let ((f (buffer-file-name)))
    (kill-this-buffer)
    (find-file-literally f)
    (local-set-key "\^c\^j" 'jkb-mode)))

(defun jkb-save-file ()
  "  Enregistre le buffer"
  (interactive)
  (set-buffer-modified-p t)
  (save-buffer))

(defun jkb-help ()
  "  Affiche une aide complete sur le mode jkb"
  (interactive)
  (describe-function 'jkb-mode))

(defun jkb-quit ()
  "  Quitte : met le buffer a la fin de la liste des buffers"
  (interactive)
  (bury-buffer))

(defun jkb-undo ()
  "  comme undo"
  (interactive)
  (toggle-read-only -1)
  (undo)
  (toggle-read-only 1)
  (set-buffer-modified-p nil))

;;; Traitement de ligne

(defun jkb-current-sound ()
  "  Retourne le nom du son sur la ligne"
  (buffer-substring (+ 2 (line-beginning-position)) (line-end-position)))

(defun jkb-goto-sound (&optional do-not-err-p)
  "Se positionne au debut de la prochaine ligne contenant le nom d'un nom"
  (beginning-of-line)
  (while (and (not (eobp)) (looking-at "^\\(#\\|[ \t]*$\\)"))
    (next-line 1)
    (beginning-of-line))
  (if (eobp)
      (if do-not-err-p
	  nil
	  (jkb-error "End of buffer"))
    t))

(defun jkb-sound-p ()
  "  Retourne t s'il y a un son sur la ligne"
  (save-excursion
    (beginning-of-line)
    (looking-at "^[* ] [^ \t]")))

(defun jkb-selection ()
  "  Retourne la liste de tous les sons selectionnes"
  (cond (mark-active
	 (jkb-mark-select)))
  (let ((selection '()))
    (save-excursion
      (goto-char (point-min))
      (let ((deb t))
	(while deb
	  (setq deb (search-forward-regexp "^\\*" nil t))
	  (if deb
	      (setq selection (cons (jkb-current-sound) selection)))
	  )))
    (if selection
	(if jkb-use-random
	    (jkb-shuffle selection)
	  (reverse selection))
      (progn
	(jkb-goto-sound)
	(list (jkb-current-sound))))))

(defun jkb-error (txt)
  (toggle-read-only 1)
  (set-buffer-modified-p nil)
  (error txt))

;;; Texte

(defun jkb-next-sound (arg)
  "  Va sur le son suivant"
  (interactive "P")
  (setq arg (prefix-numeric-value arg))
  (while (> arg 0)
    (next-line 1)
    (jkb-goto-sound)
    (setq arg (1- arg))))

(defun jkb-mark (arg)
  "  Selectionne ou deselectionne la ligne"
  (interactive "P")
  (setq arg (prefix-numeric-value arg))
  (toggle-read-only -1)
  (if (< arg 0)
      (jkb-unmark-all)
    (while (> arg 0)
      (jkb-goto-sound)
      (let ((m (looking-at "^\\*")))
	(delete-char 1)
	(insert (if m ?   ?*)))
      (next-line 1)
      (beginning-of-line)
      (if (eobp) (setq arg 0))
      (setq arg (1- arg))))
  (toggle-read-only 1)
  (set-buffer-modified-p nil))

(defun jkb-unmark-all ()
  "  Deselectionne toutes les lignes"
  (interactive)
  (toggle-read-only -1)
  (save-excursion
    (goto-char (point-min))
    (while (search-forward-regexp "^*" nil t)
      (beginning-of-line)
      (delete-char 1)
      (insert ? )))
  (toggle-read-only 1)
  (set-buffer-modified-p nil))

(defun jkb-mark-all ()
  "  Selectionne toute les lignes"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (condition-case ()
	(jkb-mark (count-lines (point-min) (point-max)))
      (error nil))))

(defun jkb-mark-select ()
  (interactive)
  "  Permet de selectionner toutes les lignes d'un region"
  (save-excursion
    (let ((deb (if mark-active (min (mark) (point)) (point-min)))
	  (fin (if mark-active (max (mark) (point)) (point-max))))
      (deactivate-mark)
      (goto-char deb)
      (while (and (jkb-goto-sound t) (< (point) fin))
	(jkb-mark 1)))))

;;; random & shuffle

(defun jkb-shuffle-aux (nb v)
  (let* ((r (random nb))
	 (e (aref v r)))
    (aset v r (aref v (1- nb)))
    (cons e (if (eq nb 1)
		'()
	      (jkb-shuffle-aux (1- nb) v)))))

(defun jkb-shuffle (l)
  "Melange une liste aleatoirement"
  (let ((v (apply 'vector l)))
    (jkb-shuffle-aux (length l) v)))

(defun jkb-random (arg)
   " Choisit `jkb-random-nb' (ou n, si un argument prefixe n est donne)
 sons au hasard. Par default, `jkb-random-nb' vaut 10."
   (interactive "P")
   (if jkb-message (message "random"))
   (save-excursion
     (setq arg (if arg (prefix-numeric-value arg) jkb-random-nb))
     (let ((nb (1- (count-lines (point-min) (point-max)))))
       (while (> arg 0)
	 (goto-line (1+ (random nb)))
	 (jkb-goto-sound t)
	 (if (or (eobp) (looking-at "^\\*"))
	     nil
	   (jkb-mark 1)
	   (setq arg (1- arg)))))))

;;; Process

(defun jkb-volume ()
  "Lance un programme permettant de modifier le volume"
  (interactive)
  (if jkb-message (message "volume"))
  (start-process "volume" nil  jkb-volume-commande))

(defun jkb-sentinel (process signal)
  (if (memq (process-status process) '(exit signal))
      (message "sound finished")))

(defun jkb-play (arg)
  "  Joue un son (appelle `jkb-play-commande')
Joue le son n fois si un argument prefixe n est donne"
  (interactive "P")
  (setq arg (prefix-numeric-value arg))
  (if jkb-message (message "play"))
  (let* ((selection)
	 (selection-1 (jkb-selection))
	 (buffer (get-buffer-create jkb-buffer))
	 (proc (get-buffer-process buffer))
	 (dir default-directory))
    (while (> arg 0)
      (setq arg (1- arg))
      (setq selection (append selection-1 selection)))
    (if proc
	(jkb-error "Le son precedent n'est pas termine"))
    (save-excursion
      (set-buffer buffer)
      (setq buffer-read-only nil)
      (erase-buffer)
      (cond (jkb-height-window
	      (display-buffer buffer)
	      (let* ((w (get-buffer-window (get-buffer jkb-buffer)))
		     (h (window-height w)))
		(if (> h jkb-height-window)
		    (enlarge-window (- h jkb-height-window))))))
      (setq default-directory dir)
      (setq proc (apply 'start-process "jkb" buffer
			jkb-play-commande selection))
      (setq mode-line-process '(":%s"))
      (require 'shell) (shell-mode)
      (set-process-sentinel proc 'jkb-sentinel)
      )))


(defun jkb-stop ()
  "  Arrete les sons"
  (interactive)
  (if jkb-message (message "stop"))
  (quit-process jkb-buffer))

(defun jkb-interrupt ()
  "  Passe au son suivant"
  (interactive)
  (if jkb-message (message "next"))
  (interrupt-process jkb-buffer))

;;; Info

(defun jkb-ls ()
  "  Fait un ls -l sur le fichier"
  (interactive)
  (let ((l (jkb-selection)))
    (while l
      (let* ((fic (car l))
	     (pos (string-match ":" fic)))
	(if (string-match "^\\(http\\|[sf]tp\\)" fic)
	    (error "Pas de ftp/http... %s" fic))
	(if pos (shell-command
		 (concat "rsh " (substring fic 0 pos) " /bin/ls -l '\""
			 (substring fic (1+ pos)) "\"'"))
	  (shell-command (concat "/bin/ls -l " fic ))))
      (setq l (cdr l)))))

(defun jkb-type-sound ()
  "Affiche le nom du son en entier.
Utile si `jkb-hide-extension' ou `jkb-hide-directory' sont actifs"
  (interactive)
  (if (jkb-sound-p)
      (message (jkb-current-sound))
    (error "Pas de nom de fichier sur la ligne")))

;;; Souris

(defun jkb-mouse-play (event)
  (interactive "e")
  (save-excursion
    (set-buffer (window-buffer (posn-window (event-end event))))
    (save-excursion
      (goto-char (posn-point (event-end event)))
      (jkb-play 1)))
    (select-window (posn-window (event-end event))))

(defun jkb-mouse-mark (event)
  (interactive "e")
  (save-excursion
    (set-buffer (window-buffer (posn-window (event-end event))))
    (save-excursion
      (goto-char (posn-point (event-end event)))
      (if (jkb-sound-p)
	  (jkb-mark 1)))
    (select-window (posn-window (event-end event))))
  (deactivate-mark))

;;; jkb-mode.el ends here
