;;; ***********  custom-set-variables **************
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#657b83" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#fdf6e3"))
 '(browse-url-browser-function (quote w3m-browse-url))
 '(current-language-environment "UTF-8")
 '(custom-enabled-themes (quote (sanityinc-solarized-light)))
 '(custom-safe-themes
   (quote
    ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(ediff-custom-diff-program "/home/neuville/bin/mydiff.sh")
 '(ediff-diff-program "/home/gneuvill/bin/mydiff.sh")
 '(eudc-options-file "~/emacs/eudc-options")
 '(fci-rule-color "#eee8d5")
 '(ido-enabled (quote both) nil (ido))
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen t)
 '(keyboard-coding-system (quote utf-8))
 '(ldap-host-parameters-alist
   (quote
    (("ldap.univ-rennes1.fr" base "ou=people,dc=univ-rennes1,dc=fr" auth simple))))
 '(max-lisp-eval-depth 20000)
 '(max-specpdl-size 20000)
 '(nxml-child-indent 4)
 '(nxml-outline-child-indent 4)
 '(package-user-dir grail-dist-elpa)
 '(remote-shell-program "ssh")
 '(rng-schema-locating-files
   (quote
    ("schemas.xml" "/usr/share/emacs/23.4/etc/schema/schemas.xml" "~/emacs/schemas/schemas.xml")))
 '(show-paren-mode t)
 '(speedbar-use-images t)
 '(speedbar-use-imenu-flag t)
 '(tool-bar-mode nil)
 '(url-personal-mail-address "gregoire.neuville@gmail.com")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil)
 '(vc-handled-backends (quote (RCS CVS SVN SCCS Bzr Hg Mtn Arch))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(put 'narrow-to-region 'disabled nil)
