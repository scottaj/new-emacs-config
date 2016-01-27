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
(evil-set-initial-state 'neotree-mode 'emacs)
(evil-set-initial-state 'makey-key-mode 'emacs)

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


(defun open-command-menu ()
  (interactive)
  (discover-show-context-menu 'keymap))

(define-key evil-normal-state-map (kbd ",") 'open-command-menu)
(define-key evil-normal-state-map (kbd "C-p") 'helm-show-kill-ring)

;; Window moving
(define-key evil-normal-state-map (kbd "C-w <left>") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-w <right>") 'windmove-right)
(define-key evil-normal-state-map (kbd "C-w <up>") 'windmove-up)
(define-key evil-normal-state-map (kbd "C-w <down>") 'windmove-down)

(evil-mode)


;;;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))



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
