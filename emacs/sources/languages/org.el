;; org mode

(use-package org
             :ensure t :pin org
             :mode ("\\.org\\'" . org-mode)
             :config (setf org-completion-use-ido t
                           org-src-fontify-natively t))
