(require 'use-package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(setq-default inhibit-splash-screen t
              make-backup-files nil
              tab-width 4
              indent-tabs-mode nil
              compilation-scroll-output t)


(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)
(desktop-save-mode 1)
(doom-modeline-mode 1)
(global-display-line-numbers-mode 1)


(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(set-face-attribute 'default nil :height 160)

(use-package golden-ratio :ensure t :diminish golden-ratio-mode :init (golden-ratio-mode 1))

(add-hook 'after-init-hook 'global-company-mode)   '("0c83e0b50946e39e237769ad368a08f2cd1c854ccbcd1a01d39fdce4d6f86478"
     "0325a6b5eea7e5febae709dab35ec8648908af12cf2d2b569bedc8da0a3a81c1"
     "e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7"
     default))
 '(highlight-indent-guides-method 'character)
 '(lsp-ui-doc-enable t)
 '(package-selected-packages
   '(all-the-icons company consult doom-modeline doom-themes golden-ratio
                   gruber-darker-theme highlight-indent-guides
                   json-mode lsp-ui orderless page-break-lines popup
                   projectile tree-sitter tree-sitter-langs vertico
                   vertico-posframe)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
