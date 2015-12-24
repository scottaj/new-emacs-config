;;;; Company Mode
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "M-SPC") #'company-complete)



;;;; Editorconfig
(require 'editorconfig)
(editorconfig-mode 1)


;;;; Evil
(require 'evil)

;; Change cursor in different modes.
(setq evil-default-cursor 'bar)
(setq evil-normal-state-cursor 'box)
(setq evil-visual-state-cursor 'hollow)
(setq evil-replace-state-cursor 'box)

;; Replace uses global option by default
(setq evil-ex-substitute-global t)

;; Set the initial evil state that certain major modes will be in.
(evil-set-initial-state 'grep-mode 'emacs)
(evil-set-initial-state 'special-mode 'emacs)

;; Clear insert state bindings.
(setcdr evil-insert-state-map nil)

                                        ; Don't wait for any other keys after escape is pressed.
(setq evil-esc-delay 0)

;; Make sure escape gets back to normal state and quits things.
(global-set-key [escape] 'keyboard-quit)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(define-key evil-visual-state-map [escape] 'evil-normal-state)
(define-key evil-emacs-state-map [escape] 'evil-normal-state)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-ns-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-completion-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-must-match-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-isearch-map [escape] 'abort-recursive-edit)

;; Make C-e work in normal and visual mode
(define-key evil-visual-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-normal-state-map (kbd "C-e") 'move-end-of-line)


;;;; Misc useful keybindings

;; Toggle visible whitespace
(define-key evil-normal-state-map (kbd ",w") 'whitespace-mode)

;; Open file
(define-key evil-normal-state-map (kbd ",e") 'helm-find-files)

;; Jump to file in project
(define-key evil-normal-state-map (kbd ",T") 'helm-semantic-or-imenu)
(define-key evil-normal-state-map (kbd ", C-t") 'projectile-invalidate-cache)
(define-key evil-normal-state-map (kbd ",t") 'helm-projectile-find-file)
(define-key evil-normal-state-map (kbd "C-p") 'helm-show-kill-ring)

;; Code Folding 
(define-key evil-normal-state-map (kbd ",.") 'hs-toggle-hiding)
(define-key evil-normal-state-map (kbd ",>") 'hs-hide-all)

;; Spellcheck
(define-key evil-normal-state-map (kbd ",ce") 'flyspell-mode)
(define-key evil-normal-state-map (kbd ",cb") 'flyspell-buffer)
(define-key evil-normal-state-map (kbd ",cw") 'flyspell-word)
(define-key evil-normal-state-map (kbd ",cc") 'flyspell-correct-word-before-point)

;; Git tools
;; REQUIRES Magit
(define-key evil-normal-state-map (kbd ",gs") 'magit-status) ;; git control panel
(define-key evil-normal-state-map (kbd ",gh") 'magit-file-log) ; Commit history for current file
(define-key evil-normal-state-map (kbd ",gb") 'magit-blame-mode) ; Blame for current file
(define-key evil-normal-state-map (kbd ",gg") 'magit-grep) ; Git grep

;; Switch to another open buffer
(define-key evil-normal-state-map (kbd ",,") 'helm-mini)

;; REQUIRES CUSTOM DEFINED FUNCTION
(define-key evil-normal-state-map (kbd ",/") 'comment-or-uncomment-region)
(define-key evil-visual-state-map (kbd ",/") 'comment-or-uncomment-region)

;; File tree navigation window
(define-key evil-normal-state-map (kbd ",n") 'neotree-toggle)

;; Prompt for snippet
;; REQUIRES Yasnippet
(define-key evil-normal-state-map (kbd ", SPC") (lambda ()
                                                  (interactive)
                                                  (evil-insert-state)
                                                  (yas-insert-snippet)))

;; Window moving
(define-key evil-normal-state-map (kbd "C-w <left>") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-w <right>") 'windmove-right)
(define-key evil-normal-state-map (kbd "C-w <up>") 'windmove-up)
(define-key evil-normal-state-map (kbd "C-w <down>") 'windmove-down)

;; Find string recursively in files
(define-key evil-normal-state-map (kbd ",f") 'ack)

;; Show undo tree
(define-key evil-normal-state-map (kbd ",u") 'undo-tree-visualize)
;; Dash
(define-key evil-normal-state-map (kbd ",d") 'dash-at-point)

(evil-mode)


;;;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)


;;;; Helm
(global-set-key (kbd "M-x") 'helm-M-x)



;;;; Hideshow
(add-hook 'prog-mode-hook (lambda ()
                            (hs-minor-mode)
                            (hideshowvis-minor-mode)))



;;;; Highlight word under cursor
(add-hook 'prog-mode-hook '(lambda () (idle-highlight-mode t)))



;;;; Markdown
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))



;;;; Neotree
(require 'neotree)

(defun shell-cmd (command)
  "Runs a shell command and then refreshes the Nav window."
  (interactive "sShell command: ")
  (neotree-refresh))

(defun neotree-delete ()
  "Delete and refresh"
  (interactive)
  (neotree-delete-node)
  (neotree-refresh))

(defun neotree-rename ()
  "Rename and refresh"
  (interactive)
  (neotree-rename-node)
  (neotree-refresh))

(define-key neotree-mode-map (kbd "a") 'ack)
(define-key neotree-mode-map (kbd "!") 'shell-cmd)
(define-key neotree-mode-map (kbd "m") 'neotree-rename)
(define-key neotree-mode-map (kbd "k") 'neotree-delete)
(define-key neotree-mode-map (kbd "n") 'neotree-create-node)
(define-key neotree-mode-map (kbd ".") 'neotree-hidden-file-toggle)


;;;; Selectable kill ring
(global-set-key (kbd "M-y") 'popup-kill-ring)



;;;; Projectile
(projectile-global-mode)
(setq projectile-enable-caching t)
(require 'helm-projectile)
(helm-projectile-on)



;;;; Theme
(load-theme 'sanityinc-solarized-dark t)



;;;; Undo tree
(global-set-key (kbd "s-z") 'undo-tree-undo)
(global-set-key (kbd "s-y") 'undo-tree-redo)
