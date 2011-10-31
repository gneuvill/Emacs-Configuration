;; Set the debug option to enable a backtrace when a
;; problem occurs.
(setq debug-on-error t)

;; save desktop session => disabled : buggy !
;; (desktop-save-mode t)

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
;; => emacs ne ferait plus de bip ? En tout cas, sans clignotement, c'est mieux.
(setq visible-bell t)

;; déplacer le pointeur génant
(mouse-avoidance-mode  'exile)

;; toujours y or n
(defalias 'yes-or-no-p 'y-or-n-p)

;; eshell
;; set environment variables
(setenv "JAVA_HOME" "/usr/lib/jvm/java-1.6.0-openjdk")
(setenv "M2_HOME" "/usr/local/share/maven")
(setenv "ANT_HOME" "/usr/local/share/ant")
(setenv "SCALA_HOME" "/usr/local/scala")
(setenv "PATH"
        (concat
         (getenv "HOME") "/bin:"
         (getenv "JAVA_HOME") "/bin:"
         (getenv "M2_HOME") "/bin:"
         (getenv "ANT_HOME") "/bin:"
         (getenv "SCALA_HOME") "/bin:"
         (getenv "PATH"))) ; inherited from OS
(setq exec-path
      (append exec-path
              (list (concat (getenv "HOME") "/bin"))
              (list (concat (getenv "JAVA_HOME") "/bin"))
              (list (concat (getenv "M2_HOME") "/bin"))
              (list (concat (getenv "ANT_HOME") "/bin"))
              (list (concat (getenv "SCALA_HOME") "/bin"))))

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
     '("mutt" "vim" "tail" "lftp" "telnet")
     eshell-visual-commands))))

;; tramp : sudo on a remote server
(set-default 'tramp-default-proxies-alist (quote (("mylevain" nil "/ssh:gneuvill@levain:"))))
(add-to-list 'tramp-default-proxies-alist '("myvmjavatest1" nil "/ssh:gneuvill@vmjavatest1:"))

;; OrgMode
;; => remember mode
(org-remember-insinuate)
;;(setq org-directory "/home/sf1staff/gneuvill/ori/")
;;(setq org-default-notes-file (concat org-directory "ori-oai-ao.org"))
(define-key global-map "\C-cr" 'org-remember)

;; our functions
(require 'my-functions)

;; git-emacs (https://github.com/tsgates/git-emacs)
(require 'git-emacs)

;; Uniquify (for buffers with identical names
(require 'uniquify)

;; Bitlbee
(require 'bitlbee)

;; PSVN (now shipped with emacs ?)
;; (require 'psvn)

;; NickNotify pour ERC
(require 'erc-nick-notify)

;; BBdB for Gnus
(require 'bbdb)
(bbdb-initialize 'gnus 'message)

;; ajout d'extensions pour charger le nxml-mode
(setq auto-mode-alist
      (append '(("\\.\\(xml\\|xsd\\|rng\\|xmap\\|xsl\\|xbl\\|xhtml\\)\\'" . nxml-mode))
              auto-mode-alist))
;; rnc-mode (http://www.pantor.com/download.html)
(require 'rnc-mode)
(autoload 'rnc-mode "rnc-mode")
(setq auto-mode-alist       
      (cons '("\\.rnc\\'" . rnc-mode) auto-mode-alist))

;; php-mode
;; on vérifie la syntaxe php à la frappe avec flymake
(require 'flymake-php)
(add-hook 'php-mode-hook 'flymake-php-load)
(add-hook 'php-mode-hook
	  (lambda ()
	    (define-key c-mode-map (kbd "C-c d") 'flymake-display-err-menu-for-current-line)))

;;répertoire de snippets supplémentaires à ceux fournis par yasnippet-bundle
;;(ce dernier installé dans avec ELPA)
(yas/load-directory (concat grail-dist-elisp "my-snippets"))

;; GEBEN (http://code.google.com/p/geben-on-emacs/)
(autoload 'geben "geben" "Remote Debugger on Emacs" t)

;; CEDET : now shipped with emacs ! (cedet.elc below is in /usr/share/emacs/23.../lisp/cedet)
;; (load-file (expand-file-name (concat grail-dist-elisp "cedet/common/cedet.el")))
;; (global-ede-mode 1)                      ; Enable the Project management system
;; (semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion
;; (semantic-load-enable-gaudy-code-helpers) ;; intellisense mode, decoration mode, and stickyfunc mode (plus regular code helpers)
;; Do we really need the following ?
;; (global-ede-mode 1)
;; (require 'semantic/sb)
;; (semantic-mode 1)

;; ECB (CVS version of ECB works with emacs 23.2 builtin CEDET)
(require 'ecb)

;; python : python-mode + pymacs + ropemacs
;; (require 'pymacs)
;; (pymacs-load "ropemacs" "rope-")

;; JDE
;; (load "jde-autoload")

;; malabar-mode => buggy for now...
;; (setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
;;                                           global-semanticdb-minor-mode
;;                                           global-semantic-idle-summary-mode
;;                                           global-semantic-mru-bookmark-mode))
;; (semantic-mode 1)
;; (require 'malabar-mode)
;; (setq malabar-groovy-lib-dir (concat grail-dist-elisp "malabar-1.4.0/lib"))
;; (add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

;; Scala
(require 'scala-mode-auto)

;; Ensime for Scala
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
;; ensime semantic highlighting
(setq ensime-sem-high-faces
      '(
        (var . (:foreground "#df8600"))
        (val . (:foreground "#784000"))
        (varField . (:foreground "#df8600"))
        (valField . (:foreground "#784000"))
        (functionCall . (:foreground "#4400b1"))
        (param . (:foreground "#c3a500"))
        (class . (:foreground "#009100"))
        (trait . (:foreground "#002f00"))
        (object . (:foreground "#00c800"))
        (package . font-lock-preprocessor-face)
        ))

;;JKB-MODE (édition m3u)
(autoload 'jkb-mode "jkb-mode" "" t)
(add-to-list 'auto-mode-alist '("\\.m3u$" . jkb-mode))

;; XQuery
(require 'xquery-mode)

;; html-script
(require 'html-script)

;; http://code.google.com/p/emacs-textmate/ (for brackets, parentheses, etc... insertion)
(require 'emacs-textmate)

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
(require 'plantuml-mode)

;; w3m (not installed through apt but from sources fetched from github)
(require 'w3m-load)
(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
 ;; optional keyboard short-cut : should find another one 'cause \C-xm seems to be bound to mail
 ;; (global-set-key "\C-xm" 'browse-url-at-point)
