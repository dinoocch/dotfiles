;;;; Remove whitespace
(use-package ws-butler
             :ensure t :pin melpa
             :diminish ws-butler-mode
             :commands (ws-butler-mode)
             :config (add-hook 'prog-mode-hook #'ws-butler-mode))
