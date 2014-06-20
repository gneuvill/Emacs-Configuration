;;; ***********  custom-set-variables **************
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-browser-function (quote w3m-browse-url))
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
 '(ediff-custom-diff-program "/home/neuville/bin/mydiff.sh")
 '(ediff-diff-program "/home/gneuvill/bin/mydiff.sh")
 '(ido-enabled (quote both) nil (ido))
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen t)
 '(keyboard-coding-system (quote utf-8))
 '(max-lisp-eval-depth 20000)
 '(max-specpdl-size 20000)
 '(nxml-child-indent 4)
 '(nxml-outline-child-indent 4)
 '(package-user-dir grail-dist-elpa)
 '(remote-shell-program "ssh")
 '(rng-schema-locating-files (quote ("schemas.xml" "/usr/share/emacs/23.4/etc/schema/schemas.xml" "~/emacs/schemas/schemas.xml")))
 '(show-paren-mode t)
 '(speedbar-use-images t)
 '(speedbar-use-imenu-flag t)
 '(tool-bar-mode nil)
 '(url-personal-mail-address "gregoire.neuville@gmail.com")
 '(vc-handled-backends (quote (RCS CVS SVN SCCS Bzr Hg Mtn Arch))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(put 'narrow-to-region 'disabled nil)
