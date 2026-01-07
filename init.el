(require 'use-package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(setq-default inhibit-splash-screen t
              make-backup-files nil
              tab-width 4
              indent-tabs-mode nil
              compilation-scroll-output t)


(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode 1)
(desktop-save-mode 1)
(global-display-line-numbers-mode 1)
(electric-pair-mode 1)

(global-set-key (kbd "C-x g") 'magit-status)

(setq desktop-restore-eager 5)

(setq python-indent-offset 4)

(defun my/insert-ipdb-trace ()
  "Insert 'import ipdb; ipdb.set_trace()' for debugging."
  (interactive)
  (insert "import ipdb\nipdb.set_trace()"))

(set-face-attribute 'default nil :height 150)

(setq major-mode-remap-alist
      '((python-mode . python-ts-mode)
        (js-mode . js-ts-mode)))
(setq python-indent-guess-indent-offset nil)

(setq lock-file-name-transforms '((".*" "~/.emacs.d/tmp/locks/" t)))

; Hooks

(add-hook 'after-init-hook 'global-company-mode)
(setq lsp-completion-provider :capf)

(add-hook 'web-mode-hook (lambda () (electric-pair-mode -1)))

; This configures auto-saves to go into the backups directory
(defvar my-auto-save-dir (concat user-emacs-directory "backups/"))
(setf kill-buffer-delete-auto-save-files t)

(setq auto-save-file-name-transforms
      `((".*" ,my-auto-save-dir t)))

(defun cesco/django ()
    (if (projectile-project-p)
        (if (file-exists-p (concat (projectile-project-root) "manage.py"))
            (web-mode-set-engine "django"))))
(add-hook 'web-mode-hook 'cesco/django)

(add-hook 'prog-mode-hook #'highlight-indent-guides-mode)

; Packages

(use-package lsp-mode
  :hook (python-mode . lsp-deferred))

(use-package projectile
  :ensure t)

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

(use-package web-mode
  :ensure t
  :custom
  (web-mode-markup-indent-offset 2) 
  (web-mode-css-indent-offset 2)    
  (web-mode-code-indent-offset 2)   
  :mode
  (("\\.phtml\\'" . web-mode)
   ("\\.php\\'" . web-mode)
   ("\\.tpl\\'" . web-mode)
   ("\\.[agj]sp\\'" . web-mode)
   ("\\.as[cp]x\\'" . web-mode)
   ("\\.erb\\'" . web-mode)
   ("\\.mustache\\'" . web-mode)
   ("\\.djhtml\\'" . web-mode)
   ("\\.html?\\'" . web-mode)))


(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode))

(use-package hl-todo
  :ensure t
  :init
  (global-hl-todo-mode))

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

(use-package vertico
  :ensure t
  :custom
  (vertico-count 20)
  :init
  (vertico-mode))

(use-package which-key
  :ensure t
  :config
  (which-key-mode +1))

;; This is for diplaying results in a new frame instead of the minibuffer
(use-package vertico-posframe
  :ensure t
  :init
  (vertico-posframe-mode)
  :custom
  (vertico-posframe-parameters
   '((left-fringe . 8)
     (right-fringe . 8)
     (height . 20))))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; Emacs minibuffer configurations.
(use-package emacs
  :custom
  ;; Enable context menu. `vertico-multiform-mode' adds a menu in the minibuffer
  ;; to switch display modes.
  (context-menu-mode t)
  ;; Support opening new minibuffers from inside existing minibuffers.
  (enable-recursive-minibuffers t)
  ;; Hide commands in M-x which do not work in the current mode.  Vertico
  ;; commands are hidden in normal buffers. This setting is useful beyond
  ;; Vertico.
  (read-extended-command-predicate #'command-completion-default-include-p)
  ;; Do not allow the cursor in the minibuffer prompt
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt)))

;; Optionally use the `orderless' completion style.
(use-package orderless
  :custom
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil) ;; Disable defaults, use our settings
  (completion-pcm-leading-wildcard t)) ;; Emacs 31: partial-completion behaves like substring
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(doom-one))
 '(custom-safe-themes
   '("19d62171e83f2d4d6f7c31fc0a6f437e8cec4543234f0548bad5d49be8e344cd"
     "b5fd9c7429d52190235f2383e47d340d7ff769f141cd8f9e7a4629a81abc6b19"
     "0325a6b5eea7e5febae709dab35ec8648908af12cf2d2b569bedc8da0a3a81c1"
     "13096a9a6e75c7330c1bc500f30a8f4407bd618431c94aeab55c9855731a95e1"
     default))
 '(doom-modeline-buffer-encoding 'nondefault)
 '(highlight-indent-guides-method 'character)
 '(lsp-headerline-breadcrumb-enable nil)
 '(lsp-modeline-code-actions-enable nil)
 '(lsp-ui-doc-position 'at-point)
 '(lsp-ui-doc-show-with-cursor t)
 '(org-agenda-files '("~/screener_dev/notes/cams.org"))
 '(package-selected-packages nil)
 '(safe-local-variable-values '((web-mode-engine . django)))
 '(scroll-conservatively 100)
 '(scroll-margin 3)
 '(vertico-posframe-height 20)
 '(web-mode-engines-alist nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

