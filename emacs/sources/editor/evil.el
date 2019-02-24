;;; vim
(use-package evil
             :ensure t
             :diminish evil-mode
             :init (setq evil-want-keybinding nil)
             :config (evil-mode 1))

;;; vim-surround
(use-package evil-surround
             :ensure t
             :config (global-evil-surround-mode 1))

;;; vim for other things
(use-package evil-collection
             :after evil
             :ensure t
             :config (evil-collection-init))

;;; vim for magit
(use-package evil-magit
             :after (evil magit)
             :ensure t)


;;; cool indicators for evil
(use-package evil-goggles
             :ensure t
             :diminish evil-goggles-mode
             :config
             (evil-goggles-mode)
             (evil-goggles-use-diff-faces))
