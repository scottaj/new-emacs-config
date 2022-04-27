;;;; Company Mode
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "M-SPC") #'company-complete)
(add-hook 'after-init-hook 'company-statistics-mode)


;;;; Editorconfig
(require 'editorconfig)
(editorconfig-mode t)
(add-hook 'prog-mode-hook 'editorconfig-mode-apply)
(add-hook 'text-mode-hook 'editorconfig-mode-apply)


;;;; Evil
(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
(setq evil-want-keybinding nil)
(require 'evil)
(when (require 'evil-collection nil t)
  (evil-collection-init))

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
(evil-set-initial-state 'text-mode 'normal)

;; Clear insert state bindings.
(setcdr evil-insert-state-map nil)

                                        ; Don't wait for any other keys after escape is pressed.
(setq evil-esc-delay 0)

;; Make sure escape gets back to normal state and quits things.
(global-set-key [escape] 'keyboard-quit)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(define-key evil-visual-state-map [escape] 'evil-normal-state)
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
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-cask-setup))



;;;; Helm
(global-set-key (kbd "M-x") 'helm-M-x)




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
(define-key neotree-mode-map [escape] 'neotree-hide)


;;;; Selectable kill ring
(global-set-key (kbd "M-y") 'popup-kill-ring)



;;;; Projectile
(projectile-global-mode)
(setq projectile-enable-caching t)
(require 'helm-projectile)
(helm-projectile-on)



;;;; Undo tree
(global-set-key (kbd "s-z") 'undo-tree-undo)
(global-set-key (kbd "s-y") 'undo-tree-redo)



;;;; Search engines
(require 'engine-mode)
(engine-mode t)

(defengine duckduckgo "https://duckduckgo.com/html/?q=%s"
  :browser 'eww-browse-url)

(defengine google "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s")

(defengine stack-overflow
  "https://stackoverflow.com/search?q=%s")

(defengine wikipedia "http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s")

(defengine wolfram-alpha "http://www.wolframalpha.com/input/?i=%s")



;;;; Emoji
(add-hook 'after-init-hook #'global-emojify-mode)




;;;; Dumb jump
(dumb-jump-mode t)




;;;; Line numbers
(global-display-line-numbers-mode)
(linum-mode nil)
