(use-package ivy
  :ensure t
  :diminish ivy-mode
  :config
  (setq ivy-use-virtual-buffers t
        ivy-count-format "%d/%d ")
  (ivy-mode)
  :general
  (
   :states 'normal
   :prefix ","
   "b" 'ivy-switch-buffer
   )
  )

(use-package counsel
  :ensure t
  :diminish counsel-mode
  :config
  (counsel-mode))

(use-package counsel-projectile
  :ensure t)

(use-package swiper
  :ensure t)

(use-package smex
  :ensure t
  :config
  (smex-initialize)
  (setq smex-completion-method 'ivy)
  )

(use-package company
  :ensure t
  :init (add-hook 'after-init-hook 'global-company-mode))
