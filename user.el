;; Set the debug option to enable a backtrace when a
;; problem occurs.
;; (setq debug-on-error t)

;; stop creating those backup~ files
(setq make-backup-files nil)

;; never use tab for indentation
(setq-default indent-tabs-mode nil)

;; options font-lock, region highlighting, parentheses matching
(global-font-lock-mode t)
(show-paren-mode t)
(transient-mark-mode t)

;; numéros de lignes
(line-number-mode t)
;; numéros de colonnes
(column-number-mode t)

;; mollette souris
(mouse-wheel-mode t)

;; supprimer le bip ; le remplacer par un clignotement
(setq visible-bell t)

;; toujours y or n
(defalias 'yes-or-no-p 'y-or-n-p)

(blink-cursor-mode 0)                          ; No blinking cursor
(setq track-eol nil)                           ; Cursor don't track end-of-line
(setq mouse-yank-at-point t)                   ; Paste at cursor position
(setq scroll-preserve-screen-position t)       ; Scroll without moving cursor
(mouse-avoidance-mode 'jump)                   ; Mouse avoids cursor

;; use eww as web browser
(setq browse-url-browser-function 'eww-browse-url)

;; eshell
;; set environment variables
(setenv "M2_HOME" "/usr/local/share/maven")
(setenv "ANT_HOME" "/usr/local/share/ant")
(setenv "PATH"
        (concat
         (getenv "HOME") "/bin:"
         (getenv "JAVA_HOME") "/bin:"
         (getenv "M2_HOME") "/bin:"
         (getenv "ANT_HOME") "/bin:"
         (getenv "PATH"))) ; inherited from OS
(setq exec-path
      (append exec-path
              (list "/usr/sbin")
              (list (concat (getenv "HOME") "/bin"))
              (list (concat (getenv "JAVA_HOME") "/bin"))
              (list (concat (getenv "M2_HOME") "/bin"))
              (list (concat (getenv "ANT_HOME") "/bin"))))

;; see http://stackoverflow.com/questions/9242651/emacs-ediff-error-no-newline-at-end-of-file
;; (setq ediff-diff-program "/home/neuville/bin/mydiff.sh")
;; (setq ediff-diff3-options "--diff-program=/home/neuville/bin/mydiff.sh")

;; add tail to eshell visual commands
;; (eshell-visual-commands is void at emacs startup)
;; (we could have used the customize-settings.el 
;; - through the customization interface - though)
(add-hook
 'eshell-first-time-mode-hook
 (lambda ()
   (setq
    eshell-visual-commands
    (append
     '("mutt" "vim" "tail" "lftp" "telnet" "pacman" "yaourt" "less")
     eshell-visual-commands))))

;; tramp : sudo on a remote server
;; alias (ex: mylevain) must NOT equals hostname (ex: levain) (otherwise bug)
(set-default 'tramp-default-proxies-alist (quote (("mylevain" nil "/sshx:gneuvill@levain:"))))
(add-to-list 'tramp-default-proxies-alist '("myvmjavatest1" nil "/sshx:gneuvill@vmjavatest1:"))
(add-to-list 'tramp-default-proxies-alist '("myvmqual" nil "/sshx:gneuvill@vmqualite:"))
(add-to-list 'tramp-default-proxies-alist '("myenor" nil "/sshx:gneuvill@enor:"))
(add-to-list 'tramp-default-proxies-alist '("mypdevq1" nil "/sshx:gneuvill@vmjava-pdevq1:"))
(add-to-list 'tramp-default-proxies-alist '("mytsnum1" nil "/sshx:gneuvill@vmjava-tsnum1:"))
(add-to-list 'tramp-default-proxies-alist '("mypsnum1" nil "/sshx:gneuvill@vmjava-psnum1:"))
(add-to-list 'tramp-default-proxies-alist '("mytopenidm" nil "/sshx:gneuvill@vmjava-topenidm:"))
(add-to-list 'tramp-default-proxies-alist '("mygipapplis1" nil "/sshx:gneuvill@vmjava-gi-papplis1:"))
(add-to-list 'tramp-default-proxies-alist '("mygipapplis2" nil "/sshx:gneuvill@vmjava-gi-papplis2:"))
(add-to-list 'tramp-default-proxies-alist '("mytapplis4" nil "/sshx:gneuvill@vmjava-gi-tapplis4:"))
(add-to-list 'tramp-default-proxies-alist '("mytexas3" nil "/sshx:gneuvill@vmjava-texas3:"))

;; supplementary packages archives
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ;; ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ;; ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
                         ))
(package-initialize)

;; deferred (https://github.com/kiwanami/emacs-deferred) + concurrent
(require 'deferred)
(require 'concurrent)

;; emojify
(add-hook 'after-init-hook #'global-emojify-mode)

;; point-undo
(require 'point-undo)
(global-set-key (kbd "C-M-,") 'point-undo)
(global-set-key (kbd "C-M-;") 'point-redo)

;; ace-link
(require 'ace-link)
(ace-link-setup-default)
(add-hook 'gnus-group-mode-hook
          (lambda ()
            (define-key gnus-summary-mode-map (kbd "M-o") 'ace-link-gnus)
            (define-key gnus-article-mode-map (kbd "M-o") 'ace-link-gnus)))

;; global smartparens mode (https://github.com/Fuco1/smartparens)
(smartparens-global-mode t)
(sp-local-tag '(nxml-mode) "<" "<_>" "</_>")

;; ido + flx-ido
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; ido-vertical-mode https://github.com/rson/ido-vertical-mode.el
(ido-vertical-mode t)

;; projectile
(projectile-global-mode)

;; smex https://github.com/nonsequitur/smex
(smex-initialize)

;; OrgMode
;; syntax highlighting of source code blocks in .org files
(setq org-src-fontify-natively t)
;; syntax highlighting of source code blocks when exporting to latex/pdf
;; (setq org-export-latex-listings 'minted)

;; org-impress (https://github.com/kinjo/org-impress-js.el)
;; (add-to-list 'load-path "~/org-impress-js.el")
;; (require 'ox-impress-js)
;; (require 'org-latex)
;; (add-to-list 'org-export-latex-packages-alist '("" "minted")) ;; broken ?
;; org-asciidoc (https://github.com/yashi/org-asciidoc)
;; (require 'ox-asciidoc)

;; Slime-style navigation for Emacs Lisp (https://github.com/purcell/elisp-slime-nav)
(require 'elisp-slime-nav)
(add-hook 'emacs-lisp-mode-hook (lambda () (elisp-slime-nav-mode t)))

;; our functions
(require 'my-functions)

;; nix-mode
(require 'nix-mode)

;; darcs
(require 'darcsum)

;; Uniquify (for buffers with identical names
(require 'uniquify)

;; EUDC
(require 'ldap)
(require 'eudc)

(setq ldap-ldapsearch-args (quote ("-tt" "-LLL" "-x" "-ZZ")))
(setq ldap-host-parameters-alist
      (quote (("ldap.univ-rennes1.fr" base "ou=people,dc=univ-rennes1,dc=fr"))))

(setq eudc-default-return-attributes nil
      eudc-strict-return-matches nil)
(setq eudc-inline-query-format '((name)
                                 (firstname)
                                 (firstname name)
                                 (email)))
(eudc-set-server "ldap.univ-rennes1.fr" 'ldap t)
(setq eudc-server-hotlist '(("ldap.univ-rennes1.fr" . ldap)))
(setq eudc-inline-expansion-servers 'hotlist)

(defun my-eudc-expand-inline()
  (interactive)
  (move-end-of-line 1)
  (insert "*")
  (unless (condition-case nil
              (eudc-expand-inline)
            (error nil))
    (backward-delete-char-untabify 1)))

;; ICalendar pour Gnus
(require 'gnus-icalendar)
(gnus-icalendar-setup)

;; ajout d'extensions pour charger le nxml-mode
(setq auto-mode-alist
      (append '(("\\.\\(xml\\|xsd\\|rng\\|xmap\\|xsl\\|xbl\\|xhtml\\)\\'" . nxml-mode))
              auto-mode-alist))
;; rnc-mode (http://www.pantor.com/download.html)
(require 'rnc-mode)
(autoload 'rnc-mode "rnc-mode")
(setq auto-mode-alist       
      (cons '("\\.rnc\\'" . rnc-mode) auto-mode-alist))

;; vdiff-magit
;; (require 'vdiff-magit)
;; (define-key magit-mode-map "e" 'vdiff-magit-dwim)
;; (define-key magit-mode-map "E" 'vdiff-magit-popup)
;; (setcdr (assoc ?e (plist-get magit-dispatch-popup :actions))
;;         '("vdiff dwim" 'vdiff-magit-dwim))
;; (setcdr (assoc ?E (plist-get magit-dispatch-popup :actions))
;;         '("vdiff popup" 'vdiff-magit-popup))

;; This flag will default to using ediff for merges. vdiff-magit does not yet
;; support 3-way merges. Please see the docstring of this variable for more
;; information
;; (setq vdiff-magit-use-ediff-for-merges nil)

;; Whether vdiff-magit-dwim runs show variants on hunks.  If non-nil,
;; vdiff-magit-show-staged or vdiff-magit-show-unstaged are called based on what
;; section the hunk is in.  Otherwise, vdiff-magit-dwim runs vdiff-magit-stage
;; when point is on an uncommitted hunk.  (setq vdiff-magit-dwim-show-on-hunks
;; nil)

;; Whether vdiff-magit-show-stash shows the state of the index.
;; (setq vdiff-magit-show-stash-with-index t)

;; Only use two buffers (working file and index) for vdiff-magit-stage
;; (setq vdiff-magit-stage-is-2way nil)

;; yasnippet: répertoire de snippets supplémentaires à ceux fournis par yasnippet-bundle
;;(ce dernier installé dans avec ELPA)
(require 'yasnippet)
(yas-global-mode 1)
(setq yas-snippet-dirs (concat grail-dist-elisp "my-snippets"))

;; Scala
;; (require 'scala-mode-auto)
;; Scala Mode 2 => https://github.com/hvesalai/scala-mode2
(require 'scala-mode)

;; Scala : emacs-scalaz-unicode-input-method
(require 'scalaz-unicode-input-method)
(add-hook 'scala-mode-hook 
	  (lambda () (set-input-method "scalaz-unicode")))

;; Scala : Ensime for Scala
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
;; (remove-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; ensime semantic highlighting
(setq ensime-sem-high-faces
      '(
        ;; (var . (:foreground "#df8600"))
        (val . (:foreground "#784000"))
        (varField . (:foreground "#cc3333"))
        (valField . (:foreground "#784000"))
        ;; (functionCall . (:foreground "#4400b1"))
        (param . (:foreground "#cc9900"))
        (class . font-lock-type-face)
        (trait . font-lock-type-face)
        ;; (object . (:foreground "#00c800"))
        (package . font-lock-preprocessor-face)
        ))

;; haskell-mode
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;; ghc-mod (haskell) (https://github.com/kazu-yamamoto/ghc-mod)
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;; js2-mode
(setq js2-bounce-indent-p t)
(setq js2-auto-indent-p nil)

;; typescript (http://github.com/ananthakumaran/tide)
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save idle-change new-line mode-enabled))
  (eldoc-mode +1)
  (company-mode +1))

(add-hook 'typescript-mode-hook 'setup-tide-mode)

(add-hook 'js2-mode-hook 'setup-tide-mode)
