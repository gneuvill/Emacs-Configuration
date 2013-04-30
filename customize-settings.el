;;; ***********  custom-set-variables **************
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(package-user-dir "~/emacs/dist/elpa")
 '(TeX-output-view-style (quote (("^dvi$" ("^landscape$" "^pstricks$\\|^pst-\\|^psfrag$") "%(o?)dvips -t landscape %d -o && gv %f") ("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "%(o?)dvips %d -o && gv %f") ("^dvi$" ("^\\(?:a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4\\)$" "^landscape$") "%(o?)xdvi %dS -paper a4r -s 0 %d") ("^dvi$" "^\\(?:a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4\\)$" "%(o?)xdvi %dS -paper a4 %d") ("^dvi$" ("^\\(?:a5\\(?:comb\\|paper\\)\\)$" "^landscape$") "%(o?)xdvi %dS -paper a5r -s 0 %d") ("^dvi$" "^\\(?:a5\\(?:comb\\|paper\\)\\)$" "%(o?)xdvi %dS -paper a5 %d") ("^dvi$" "^b5paper$" "%(o?)xdvi %dS -paper b5 %d") ("^dvi$" "^letterpaper$" "%(o?)xdvi %dS -paper us %d") ("^dvi$" "^legalpaper$" "%(o?)xdvi %dS -paper legal %d") ("^dvi$" "^executivepaper$" "%(o?)xdvi %dS -paper 7.25x10.5in %d") ("^dvi$" "." "%(o?)xdvi %dS %d") ("^pdf$" "." "evince %o") ("^pdf$" "." "xpdf -remote \"%s\" -raise %o %(outpage)") ("^html?$" "." "firefox %o"))))
 '(browse-url-browser-function (quote w3m-browse-url))
 '(browse-url-firefox-new-window-is-tab t)
 '(browse-url-mozilla-new-window-is-tab t)
 '(bsh-jar "/usr/share/java/bsh.jar")
 '(canlock-password "74c293aac2dbaf70f0dc2ab42af948302e8f65e5")
 '(company-eclim-auto-save t t)
 '(company-idle-delay 0.5 t)
 '(confluence-default-space-alist (quote (("confluence-url" . "~gneuvill@univ-rennes1.fr"))))
 '(confluence-url "http://www.ori-oai.org/rpc/xmlrpc")
 '(current-language-environment "UTF-8")
 '(ecb-compilation-buffer-names (quote (("*Calculator*") ("*vc*") ("*vc-diff*") ("*Apropos*") ("*Occur*") ("*shell*") ("\\*[cC]ompilation.*\\*" . t) ("\\*i?grep.*\\*" . t) ("*JDEE Compile Server*") ("*Help*") ("*Completions*") ("*Backtrace*") ("*Compile-log*") ("*bsh*") ("*Messages*") ("\\*ensime-sbt\\*<.*?>" . t) ("*ensime-inferior-scala*"))))
 '(ecb-compile-window-height 6)
 '(ecb-compile-window-temporally-enlarge (quote after-selection))
 '(ecb-eshell-auto-activate t)
 '(ecb-eshell-buffer-sync nil)
 '(ecb-layout-name "left2")
 '(ecb-layout-window-sizes (quote (("left2" (ecb-directories-buffer-name 0.15126050420168066 . 0.48214285714285715) (ecb-sources-buffer-name 0.15126050420168066 . 0.5)) ("left1" (ecb-directories-buffer-name 0.15498154981549817 . 0.4935064935064935) (ecb-sources-buffer-name 0.15498154981549817 . 0.4935064935064935) (ecb-methods-buffer-name 0.2177121771217712 . 0.5454545454545454) (ecb-analyse-buffer-name 0.2177121771217712 . 0.44155844155844154)))))
 '(ecb-method-non-semantic-face (quote ecb-default-highlight-face))
 '(ecb-non-semantic-methods-initial-expand (quote (php-mode scala-mode)))
 '(ecb-non-semantic-parsing-function (quote ((php-mode . speedbar-fetch-dynamic-etags) (scala-mode . speedbar-fetch-dynamic-etags))))
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(ecb-source-path (quote (("/home/neuville/emacs/" "emacs-conf") ("/usr/local/src/organichart" "organichart") ("/home/gneuvill/ori/src" "ori") ("/home/gneuvill/ori/src/ori-oai-ext-1.7" "ori-oai-ext-1.7") ("/home/gneuvill/ori/src-test" "ori-test") "/usr/local/src" ("/home/gneuvill/ur1" "ur1"))))
 '(ecb-tip-of-the-day nil)
 '(ecb-tree-indent 2)
 '(erc-autoaway-mode t)
 '(erc-modules (quote (autoaway autojoin button completion fill irccontrols list match menu move-to-prompt netsplit networks noncommands notify readonly ring smiley stamp)))
 '(erc-netsplit-mode t)
 '(erc-nick-notify-icon "~/emacs.d/talk.png")
 '(erc-nick-notify-urgency "normal")
 '(erc-notify-mode t)
 '(erc-notify-signoff-hook (quote (erc-notify-signoff)))
 '(erc-notify-signon-hook (quote (erc-notify-signon)))
 '(erc-port 6667)
 '(erc-server "localhost")
 '(erc-server-auto-reconnect nil)
 '(erc-server-reconnect-attempts 2)
 '(erc-server-reconnect-timeout 10)
 '(erc-server-send-ping-interval nil)
 '(erc-server-send-ping-timeout nil)
 '(erc-sound-path (quote ("/usr/share/sounds/")))
 '(erc-track-position-in-mode-line (quote after-modes))
 '(erc-track-switch-direction (quote importance))
 '(erc-track-visibility t)
 '(erc-track-when-inactive t)
 '(flymake-allowed-file-name-masks (quote (("\\.c\\'" flymake-simple-make-init) ("\\.cpp\\'" flymake-simple-make-init) ("\\.xml\\'" flymake-xml-init) ("\\.html?\\'" flymake-xml-init) ("\\.cs\\'" flymake-simple-make-init) ("\\.p[ml]\\'" flymake-perl-init) ("\\.php[345]?\\'" flymake-php-init) ("\\.h\\'" flymake-master-make-header-init flymake-master-cleanup) ("[0-9]+\\.tex\\'" flymake-master-tex-init flymake-master-cleanup) ("\\.tex\\'" flymake-simple-tex-init) ("\\.idl\\'" flymake-simple-make-init))))
 '(font-lock-maximum-decoration (quote ((t . t))))
 '(fringe-mode 0 nil (fringe))
 '(gimp-exe "/usr/bin/gimp")
 '(gnus-ignored-newsgroups "\"\"")
 '(gnus-registry-install t)
 '(html-script-regions (quote (("<%" "%>" visual-basic-mode) ("<\\?" "\\?>" php-mode c-mode) ("<style[ 	]+type=\"text/css\"" "</style>" css-mode c-mode) ("<style[ 	]+type=\"css\"" "</style>" css-mode c-mode) ("<script[ 	]+language=\"vbscript\"[ 	]*>" "</script>" visual-basic-mode) ("<script[ 	]+type=\"text/vbscript\"[ 	]*>" "</script>" visual-basic-mode) ("<script[ 	]+language=\"javascript\"[ 	]*>" "</script>" ecmascript-mode jde-mode java-mode javascript-generic-mode c-mode) ("<script[ 	]+type=\"text/javascript\"[ 	]*>" "</script>" ecmascript-mode jde-mode java-mode javascript-generic-mode c-mode) ("<xbl:style>" "</xbl:style>" css-mode) ("<xxforms:script>" "</xxforms:script>" js2-mode js-mode javascript-mode javascript-generic-mode))))
 '(ido-enabled (quote both) nil (ido))
 '(ido-mode (quote both) nil (ido))
 '(imap-default-user "gregoire.neuville")
 '(indicate-buffer-boundaries nil)
 '(inhibit-startup-screen t)
 '(jabber-account-list (quote (("gregoire.neuville@gmail.com" (:network-server . "talk.google.com") (:port . 5223) (:connection-type . ssl)))))
 '(jabber-display-menu nil)
 '(js2-auto-indent-p t)
 '(js2-enter-indents-newline t)
 '(js2-highlight-level 1)
 '(js2-indent-on-enter-key t)
 '(keyboard-coding-system (quote utf-8))
 '(mail-user-agent (quote gnus-user-agent))
 '(max-lisp-eval-depth 20000)
 '(max-specpdl-size 20000)
 '(nxhtml-default-encoding (quote utf-8))
 '(nxml-child-indent 4)
 '(nxml-outline-child-indent 4)
 '(org-agenda-columns-add-appointments-to-effort-sum t)
 '(org-agenda-files (quote ("/home/sf1staff/gneuvill/ori/index.org" "/home/sf1staff/gneuvill/ori/ori-oai-ao.org")))
 '(org-columns-default-format "%40ITEM(Task) %TODO %17Effort(Estimated Effort){:} %CLOCKSUM")
 '(org-enforce-todo-checkbox-dependencies t)
 '(org-enforce-todo-dependencies t)
 '(org-export-html-coding-system (quote utf-8))
 '(org-export-html-toplevel-hlevel 2)
 '(org-export-with-sub-superscripts (quote {}))
 '(org-export-with-tags nil)
 '(org-global-properties (quote (("Effort_ALL" . "0 0:10 0:30 1:00 2:00 3:00 4:00 5:00 6:00 7:00 8:00"))))
 '(org-icalendar-include-body 150)
 '(org-icalendar-include-todo nil)
 '(org-icalendar-store-UID t)
 '(org-icalendar-use-deadline (quote (event-if-not-todo event-if-todo todo-due)))
 '(org-icalendar-use-scheduled (quote (event-if-not-todo event-if-todo todo-start)))
 '(org-modules (quote (org-bbdb org-bibtex org-gnus org-info org-jsinfo org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m org-depend org-expiry org-toc)))
 '(org-use-property-inheritance (quote ("")))
 '(overflow-newline-into-fringe nil)
 '(php-basic-offset 2)
 '(php-completion-file (concat grail-dist-elisp "php-completion-file"))
 '(php-manual-path (concat grail-dist-elisp "php-manual"))
 '(php-mode-force-pear t)
 '(php-speedbar-config t)
 '(read-mail-command (quote gnus))
 '(reftex-plug-into-AUCTeX t)
 '(remote-shell-program "ssh")
 '(rng-schema-locating-files (quote ("schemas.xml" "/usr/share/emacs/23.4/etc/schema/schemas.xml" "~/emacs/schemas/schemas.xml")))
 '(scala-mode-feature:electric-on-per-default t)
 '(semantic-python-dependency-system-include-path (quote ("/usr/lib/python2.5" "/usr/lib/pymodules/python2.5" "/usr/lib/pyshared/python2.5" "/usr/lib/python-support")))
 '(show-paren-mode t)
 '(speedbar-use-images t)
 '(speedbar-use-imenu-flag t)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify))
 '(url-irc-function (quote url-irc-erc))
 '(url-personal-mail-address "gregoire.neuville@gmail.com"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(put 'narrow-to-region 'disabled nil)
