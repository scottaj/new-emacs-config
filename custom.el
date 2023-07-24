;; Customize interface settings go in here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#839496" "#ff5555" "#50fa7b" "#ffb86c" "#8be9fd" "#ff79c6" "#2aa198" "#bd93f9"])
 '(auth-source-debug t)
 '(auth-sources '("/Users/ajs/.authinfo"))
 '(column-number-mode t)
 '(company-dabbrev-downcase nil)
 '(company-dabbrev-ignore-case nil)
 '(company-idle-delay 0.2)
 '(company-insertion-on-trigger nil)
 '(company-insertion-triggers '(32 41 119 46))
 '(company-statistics-mode t)
 '(company-transformers '(company-sort-by-statistics))
 '(compilation-auto-jump-to-first-error nil)
 '(compilation-environment '("TERM=xterm-256color"))
 '(compilation-read-command nil)
 '(compilation-scroll-output t)
 '(custom-enabled-themes '(nord))
 '(custom-safe-themes
   '("197cefea731181f7be51e9d498b29fb44b51be33484b17416b9855a2c4243cb1" "f681100b27d783fefc3b62f44f84eb7fa0ce73ec183ebea5903df506eb314077" "05626f77b0c8c197c7e4a31d9783c4ec6e351d9624aa28bc15e7f6d6a6ebd926" "947190b4f17f78c39b0ab1ea95b1e6097cc9202d55c73a702395fc817f899393" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" "aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" "a4df5d4a4c343b2712a8ed16bc1488807cd71b25e3108e648d4a26b02bc990b3" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "d9129a8d924c4254607b5ded46350d68cc00b6e38c39fc137c3cfb7506702c12" "1bacdd5d24f187f273f488a23c977f26452dffbc82d4ac57250aa041f14159da" "959a77d21e6f15c5c63d360da73281fdc40db3e9f94e310fc1e8213f665d0278" "8577da1641ed4bdf255341ca92e3d0e49c9f4d574458f09ce78159690442cade" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default))
 '(electric-layout-mode nil)
 '(electric-pair-mode t)
 '(enable-local-variables :all)
 '(fci-rule-color "#073642")
 '(flycheck-python-pycompile-executable "/usr/local/bin/python3")
 '(flycheck-python-pylint-executable "/usr/local/bin/python3")
 '(fsharp-continuation-offset 2)
 '(fsharp-indent-level 2)
 '(fsharp-indent-offset 2)
 '(gc-cons-threshold 100000000)
 '(global-company-mode t)
 '(global-discover-mode t)
 '(global-evil-surround-mode t)
 '(global-flycheck-mode t)
 '(global-linum-mode t)
 '(helm-M-x-always-save-history t)
 '(helm-M-x-fuzzy-match t)
 '(helm-browse-project-default-find-files-fn 'helm-browse-project-walk-directory)
 '(helm-buffer-details-flag nil)
 '(helm-default-prompt-display-function 'evil-collection-helm--set-prompt-display)
 '(helm-minibuffer-history-key "M-p")
 '(initial-buffer-choice t)
 '(initial-frame-alist '((fullscreen . maximized)))
 '(initial-major-mode 'lisp-interaction-mode)
 '(initial-scratch-message nil)
 '(js-indent-level 2)
 '(js-switch-indent-offset 4)
 '(js2-include-node-externs t)
 '(js2-indent-switch-body t)
 '(magit-branch-arguments nil)
 '(magit-commit-show-diff nil)
 '(magit-push-always-verify nil)
 '(magit-revert-buffers t t)
 '(make-backup-files nil)
 '(neo-create-file-auto-open t)
 '(neo-smart-open t)
 '(nodejs-repl-arguments '("--interactive"))
 '(nyan-mode t)
 '(package-selected-packages
   '(nord-theme docker-compose-mode dockerfile-mode web-mode scss-mode realgud react-snippets racer popup-kill-ring nyan-mode nvm nodejs-repl neotree mocha-snippets mocha markdown-mode magit linum-relative json-mode js2-refactor idle-highlight-mode hideshowvis helm-projectile helm-ag fsharp-mode flycheck-rust flycheck-color-mode-line flycheck-cask feature-mode evil-surround engine-mode emojify emmet-mode ember-yasnippets editorconfig dumb-jump dracula-theme discover dash-at-point company-tern company-statistics coffee-mode angular-snippets ag ack))
 '(projectile-create-missing-test-files t)
 '(projectile-enable-caching t)
 '(projectile-global-mode t)
 '(projectile-sort-order 'modification-time)
 '(projectile-switch-project-action 'helm-projectile-find-file)
 '(show-paren-mode t)
 '(show-paren-style 'expression)
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16")))
 '(vc-annotate-very-old-color nil)
 '(warning-suppress-types
   '(((package reinitialization))
     ((package reinitialization))))
 '(yas-global-mode t nil (yasnippet))
 '(yas-snippet-dirs
   '("~/.emacs.d/snippets" yas-installed-snippets-dir "/Users/ajs/.emacs.d/elpa/angular-snippets-20140513.2223/snippets" "/Users/ajs/.emacs.d/elpa/ember-yasnippets-20160111.907/snippets" "/Users/ajs/.emacs.d/elpa/react-snippets-20151104.1540/snippets" "/Users/ajs/.emacs.d/elpa/mocha-snippets-20150116.800/snippets") nil (yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#282a36" :foreground "#f8f8f2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 200 :width normal :foundry "nil" :family "Comic Mono" :spacing 90))))
 '(compilation-error ((t (:inherit error :height 1.5))))
 '(compilation-mode-line-exit ((t (:inherit compilation-info :foreground "#50fa7b" :weight bold :height 0.5))))
 '(compilation-mode-line-fail ((t (:inherit compilation-error :weight bold :height 0.5))))
 '(compilation-mode-line-run ((t (:inherit compilation-warning :height 0.5))))
 '(error ((t (:foreground "#ff5555" :weight bold))))
 '(flycheck-color-mode-line-error-face ((t (:background "#ff5555" :weight normal))))
 '(flycheck-color-mode-line-warning-face ((t (:background "#ffb86c" :weight normal))))
 '(idle-highlight ((t (:background "#333"))))
 '(mode-line ((t (:background "#282a36" :box (:line-width 1 :color "#839496") :weight normal :height 0.5))))
 '(mode-line-buffer-id ((t (:background "#073642" :foreground "#d33682"))))
 '(region ((t (:background "#44475a" :foreground nil))))
 '(show-paren-match ((t (:background "#44475a"))))
 '(smerge-base ((t (:background "#333300"))))
 '(smerge-lower ((t (:background "#113311"))))
 '(smerge-refined-added ((t (:inherit smerge-refined-change :background "#224422"))))
 '(smerge-refined-removed ((t (:inherit smerge-refined-change :background "#442222"))))
 '(smerge-upper ((t (:background "#331111"))))
 '(success ((t (:foreground "#50fa7b" :weight bold)))))
