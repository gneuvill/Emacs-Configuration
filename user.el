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
(add-to-list 'tramp-default-proxies-alist '("mypsnum1" nil "/sshx:gneuvill@vmjava-psnum1:"))
(add-to-list 'tramp-default-proxies-alist '("mytopenidm" nil "/sshx:gneuvill@vmjava-topenidm:"))

;; supplementary packages archives
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ;; ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
                         ))
(package-initialize)

;; global smartparens mode (https://github.com/Fuco1/smartparens)
(smartparens-global-mode t)
(sp-local-tag '(nxml-mode) "<" "<_>" "</_>")

;; ido-vertical-mode https://github.com/rson/ido-vertical-mode.el
(ido-vertical-mode t)

;; smex https://github.com/nonsequitur/smex
(smex-initialize)

;; OrgMode
;; syntax highlighting of source code blocks in .org files
(setq org-src-fontify-natively t)
;; syntax highlighting of source code blocks when exporting to latex/pdf
(setq org-export-latex-listings 'minted)

;; org-impress (https://github.com/kinjo/org-impress-js.el)
;; (add-to-list 'load-path "~/org-impress-js.el")
(require 'ox-impress-js)
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

;; git-emacs (https://github.com/tsgates/git-emacs)
;; (require 'git-emacs) => we use magit now

;; darcs
(require 'darcsum)

;; Uniquify (for buffers with identical names
(require 'uniquify)

;; Bitlbee
(require 'bitlbee)

;; PSVN (now shipped with emacs ?)
(require 'psvn)

;; NickNotify pour ERC
(require 'erc-nick-notify)

;; BBdB pour Gnus => on utilise https://www.gnu.org/software/emacs/manual/html_mono/eudc.html
;; (require 'bbdb)
;; (bbdb-initialize 'gnus 'message)

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

;;répertoire de snippets supplémentaires à ceux fournis par yasnippet-bundle
;;(ce dernier installé dans avec ELPA)
;; (yas/load-directory (concat grail-dist-elisp "my-snippets"))

;; GEBEN (http://code.google.com/p/geben-on-emacs/)
(autoload 'geben "geben" "Remote Debugger on Emacs" t)

;; Scala
;; (require 'scala-mode-auto)
;; Scala Mode 2 => https://github.com/hvesalai/scala-mode2
(require 'scala-mode2)

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

;;JKB-MODE (édition m3u)
(autoload 'jkb-mode "jkb-mode" "" t)
(add-to-list 'auto-mode-alist '("\\.m3u$" . jkb-mode))

;; XQuery
(require 'xquery-mode)

;; html-script
(require 'html-script)

;; http://code.google.com/p/emacs-textmate/ (for brackets, parentheses, etc... insertion)
;; (require 'emacs-textmate)

;; js-comint : javascript dev with js2-mode + comint + rhino
(require 'js-comint)
(setq inferior-js-program-command "/usr/bin/js")
(add-hook 'js2-mode-hook '(lambda () 
			    (local-set-key "\C-x\C-e" 'js-send-last-sexp)
			    (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
			    (local-set-key "\C-cb" 'js-send-buffer)
			    (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
			    (local-set-key "\C-cl" 'js-load-file-and-go)
			    ))

;; plantuml
(setq custom-plantuml-jar-path "/usr/local/share/plantuml.jar")
(require 'plantuml-mode)

;; w3m (not installed through apt but from sources fetched from github)
(require 'w3m)
(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;; optional keyboard short-cut : should find another one 'cause \C-xm seems to be bound to mail
;; (global-set-key "\C-xm" 'browse-url-at-point)
