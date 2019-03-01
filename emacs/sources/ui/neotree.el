(use-package neotree
  :ensure t
  :config (setq neo-theme 'arrow)
  :after (:all general all-the-icons)
  :general
  (
   :states 'normal
   :prefix ","
   "e" 'neotree-toggle
   )
  )
