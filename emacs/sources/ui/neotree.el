;; Neotree
(use-package neotree
             :ensure t
             :config (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
             :general
             (
              :states 'normal
              :prefix ","
              "e" 'neotree-toggle
              )
 )
