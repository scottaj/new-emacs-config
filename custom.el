;; Customize interface settings go in here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(company-auto-complete nil)
 '(company-auto-complete-chars (quote (32 41 119 46)))
 '(company-idle-delay 0.2)
 '(company-statistics-mode t)
 '(compilation-auto-jump-to-first-error nil)
 '(compilation-environment (quote ("TERM=xterm-256color")))
 '(compilation-read-command nil)
 '(compilation-scroll-output t)
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(electric-layout-mode nil)
 '(electric-pair-mode t)
 '(enable-local-variables :all)
 '(gc-cons-threshold 100000000)
 '(global-company-mode t)
 '(global-discover-mode t)
 '(global-evil-surround-mode t)
 '(global-flycheck-mode t)
 '(global-linum-mode t)
 '(initial-buffer-choice t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(initial-major-mode (quote org-mode))
 '(initial-scratch-message nil)
 '(js2-include-node-externs t)
 '(magit-branch-arguments nil)
 '(magit-commit-show-diff nil)
 '(magit-push-always-verify nil)
 '(magit-revert-buffers t)
 '(make-backup-files nil)
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
 '(idle-highlight ((t (:background "#333"))))
 '(mode-line ((t (:background "#073642" :box (:line-width 1 :color "#839496") :weight normal :height 0.5))))
 '(mode-line-buffer-id ((t (:background "#073642" :foreground "#d33682"))))
 '(smerge-base ((t (:background "#333300"))))
 '(smerge-mine ((t (:background "#331111"))))
 '(smerge-other ((t (:background "#113311"))))
 '(smerge-refined-added ((t (:inherit smerge-refined-change :background "#224422"))))
 '(smerge-refined-removed ((t (:inherit smerge-refined-change :background "#442222")))))
