;; Customize interface settings go in here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#839496" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#002b36"))
 '(column-number-mode t)
 '(company-auto-complete nil)
 '(company-auto-complete-chars (quote (32 41 119 46)))
 '(company-idle-delay 0.2)
 '(company-statistics-mode t)
 '(compilation-auto-jump-to-first-error nil)
 '(compilation-environment (quote ("TERM=xterm-256color")))
 '(compilation-read-command nil)
 '(compilation-scroll-output t)
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("8577da1641ed4bdf255341ca92e3d0e49c9f4d574458f09ce78159690442cade" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(electric-layout-mode nil)
 '(electric-pair-mode t)
 '(enable-local-variables :all)
 '(fci-rule-color "#073642")
 '(gc-cons-threshold 100000000)
 '(global-company-mode t)
 '(global-discover-mode t)
 '(global-evil-surround-mode t)
 '(global-flycheck-mode t)
 '(global-linum-mode t)
 '(initial-buffer-choice t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(initial-major-mode (quote lisp-interaction-mode))
 '(initial-scratch-message nil)
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(js2-include-node-externs t)
 '(magit-branch-arguments nil)
 '(magit-commit-show-diff nil)
 '(magit-push-always-verify nil)
 '(magit-revert-buffers t)
 '(make-backup-files nil)
 '(mocha-options "--recursive --reporter dot")
 '(neo-create-file-auto-open t)
 '(neo-smart-open t)
 '(nodejs-repl-arguments (quote ("--interactive")))
 '(nyan-mode t)
 '(projectile-create-missing-test-files t)
 '(projectile-enable-caching t)
 '(projectile-global-mode t)
 '(projectile-sort-order (quote modification-time))
 '(projectile-switch-project-action (quote helm-projectile-find-file))
 '(show-paren-mode t)
 '(show-paren-style (quote expression))
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
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
     (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil)
 '(yas-global-mode t nil (yasnippet))
 '(yas-snippet-dirs
   (quote
    ("~/.emacs.d/snippets" yas-installed-snippets-dir "/Users/ajs/.emacs.d/elpa/angular-snippets-20140513.2223/snippets" "/Users/ajs/.emacs.d/elpa/ember-yasnippets-20160111.907/snippets" "/Users/ajs/.emacs.d/elpa/react-snippets-20151104.1540/snippets" "/Users/ajs/.emacs.d/elpa/mocha-snippets-20150116.800/snippets")) nil (yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-error ((t (:inherit error :height 1.5))))
 '(flycheck-color-mode-line-error-face ((t (:inherit flycheck-fringe-error :background "#ff5555" :weight normal))))
 '(flycheck-color-mode-line-warning-face ((t (:inherit flycheck-fringe-warning :background "#ffb86c" :weight normal))))
 '(idle-highlight ((t (:background "#333"))))
 '(mode-line ((t (:background "#282a36" :box (:line-width 1 :color "#839496") :weight normal :height 0.5))))
 '(mode-line-buffer-id ((t (:background "#073642" :foreground "#d33682"))))
 '(region ((t (:background "#44475a" :foreground nil))))
 '(show-paren-match ((t (:background "#44475a"))))
 '(smerge-base ((t (:background "#333300"))))
 '(smerge-mine ((t (:background "#331111"))))
 '(smerge-other ((t (:background "#113311"))))
 '(smerge-refined-added ((t (:inherit smerge-refined-change :background "#224422"))))
 '(smerge-refined-removed ((t (:inherit smerge-refined-change :background "#442222")))))
