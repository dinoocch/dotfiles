(eval-when-compile
  (require 'cl))

(require 'package)
(setf package-enable-at-startup nil)
(push '("melpa" . "https://melpa.org/packages/") package-archives)
(push '("org" . "http://orgmode.org/elpa/") package-archives)
(package-initialize)
;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

(use-package diminish :ensure t)
(use-package key-chord
  :ensure t
  :diminish key-chord-mode
  :config
  (setq key-chord-two-keys-delay 0.2)
  (key-chord-mode 1)
  )

(use-package general :ensure t
  :demand
  :config
  (general-evil-setup)
  )


(load "editor/completion")

(load "tools/flycheck")
(load "tools/magit")

(load "ui/theme")
(load "ui/neotree")

(load "languages/c")
(load "languages/java")
(load "languages/md")
(load "languages/org")
(load "languages/python")
(load "languages/rust")

(load "editor/evil")
(load "editor/utils")
(load "editor/projectile")
