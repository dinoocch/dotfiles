;;;; Remove whitespace
(use-package ws-butler
  :ensure t
  :diminish ws-butler-mode
  :commands (ws-butler-mode)
  :config (add-hook 'prog-mode-hook #'ws-butler-mode))

(use-package ripgrep
  :ensure t)

(general-define-key
 :states 'normal
 :prefix ","
 "s" 'term
 )
