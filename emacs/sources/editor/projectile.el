(use-package projectile
             :ensure t
             :diminish projectile-mode
             :config
             (projectile-mode +1)
             (setq projectile-completion-system 'ivy
                   projectile-project-search-path '("~/dev/")
                   projectile-switch-project-action 'neotree-projectile-action
             ))
