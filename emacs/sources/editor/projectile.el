(use-package projectile
  :ensure t
  :diminish projectile-mode
  :after (:all general)
  :config
  (projectile-mode +1)
  (setq projectile-completion-system 'ivy
        projectile-project-search-path '("~/dev/")
        projectile-switch-project-action 'neotree-projectile-action
        )
  :general
  (
   :states 'normal
   :prefix "M-p"
   "f" 'projectile-find-file
   "t" 'neotree-projectile-action
   )
  )

(use-package projectile-ripgrep
  :ensure t
  :after (:all general projectile ripgrep)
  :general
  (
   :states 'normal
   :prefix "M-p"
   "s" 'projectile-ripgrep
   ))
