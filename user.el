;; Custom user code that doesn't belong to a package goes here
;; Compilation
(setq compilation-read-command nil)
(global-set-key (kbd "<f5>") 'comment-or-uncomment-region)



;; Turn off Bell
(setq ring-bell-function 'ignore)



;; Electric indent
(setq electric-indent-mode t)
(defun disable-electric-indent ()
  (set (make-local-variable 'electric-indent-functions)
       (list (lambda (arg) 'no-indent))))



;; Auto-scroll and color compilation buffer
(setq compilation-scroll-output t)
(ignore-errors
  (require 'ansi-color)
  (defun my-colorize-compilation-buffer ()
    (when (eq major-mode 'compilation-mode)
      (ansi-color-apply-on-region compilation-filter-start (point-max))))
  (add-hook 'compilation-filter-hook 'my-colorize-compilation-buffer))



;; Comment or uncomment a marked region or your current line if there is no mark set
(defadvice comment-or-uncomment-region (before slick-comment activate compile)
	"When called interactively with no active region, comment a single line instead."
	(interactive
	 (if mark-active (list (region-beginning) (region-end))
		 (list (line-beginning-position)
					 (line-beginning-position 2)))))
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "s-/") 'comment-or-uncomment-region)



;; Make sure option key only acts as Meta on OSX
(setq mac-right-option-modifier 'nil)
(setq mac-option-key-is-meta t)
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super) ; sets the Command key as super



;; Font - I like Adobe Source Code Pro (it's free)
(when (display-graphic-p)
	(set-face-attribute 'default nil :font "Source Code Pro for Powerline")
	(set-face-attribute 'default nil :height 180)) ; 180 means 18pt



;; Vertical ido-prompt
(setq ido-decorations (quote
											 ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-truncation ()
	(set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)



;; Switch windows with SHIFT+arrow keys
(windmove-default-keybindings)
(global-set-key (kbd "<select>") 'windmove-up)



;; Match weird files to the appropriate modes
(setq auto-mode-alist  (cons '("Gemfile$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("Gemfile.lock$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("Rakefile$" . ruby-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.apex$" . java-mode))
(add-to-list 'auto-mode-alist '("\\.hamlc$" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.coffee\\.erb$" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.coffee\\.erb$" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.hbs$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$" . web-mode))



;; cursor - like a bar, but it can be a block or something
(setq-default cursor-type 'bar)



;; Shell settings
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell 
      (replace-regexp-in-string "[[:space:]\n]*$" "" 
        (shell-command-to-string "$SHELL -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(when (equal system-type 'darwin) (set-exec-path-from-shell-PATH))



;; Flyspell
(add-hook 'text-mode-hook (lambda () (flyspell-mode t)))



(require 'cl)
(defun hexcolour-luminance (color)
  "Calculate the luminance of a color string (e.g. \"#ffaa00\", \"blue\").
	This is 0.3 red + 0.59 green + 0.11 blue and always between 0 and 255."
  (let* ((values (x-color-values color))
	 (r (car values))
	 (g (cadr values))
	 (b (caddr values)))
    (floor (+ (* .3 r) (* .59 g) (* .11 b)) 256)))

(defun hexcolour-add-to-font-lock ()
  (interactive)
  (font-lock-add-keywords nil
			  `((,(concat "#[0-9a-fA-F]\\{3\\}[0-9a-fA-F]\\{3\\}?\\|"
				      (regexp-opt (x-defined-colors) 'words))
			     (0 (let ((colour (match-string-no-properties 0)))
				  (put-text-property
				   (match-beginning 0) (match-end 0)
				   'face `((:foreground ,(if (> 128.0 (hexcolour-luminance colour))
							     "white" "black"))
					   (:background ,colour)))))))))

(add-hook 'css-mode-hook 'hexcolour-add-to-font-lock)
(add-hook 'scss-mode-hook 'hexcolour-add-to-font-lock)
(add-hook 'sass-mode-hook 'hexcolour-add-to-font-lock)
(add-hook 'less-css-mode-hook 'hexcolour-add-to-font-lock)
(add-hook 'sgml-mode-hook 'hexcolour-add-to-font-lock)
(add-hook 'nxml-mode-hook 'hexcolour-add-to-font-lock)
(add-hook 'haml-mode-hook 'hexcolour-add-to-font-lock)
(add-hook 'slim-mode-hook 'hexcolour-add-to-font-lock)
(add-hook 'web-mode-hook 'hexcolour-add-to-font-lock)



(global-set-key (kbd "C-=") 'yas-expand)



;;
;; Start named Emacs server for emacsclient connections
;;
(require 'server)
(unless (server-running-p "emacs-server")
  (set 'server-name "emacs-server")
  (server-start))



;; Pretty symbols
(add-hook 'prog-mode-hook (lambda ()
                            (setq prettify-symbols-alist '(("===" . ?≡)
                                                           ("!==" . ?≢) (">=" . ?≥) ("<=" . ?≤)
                                                           ("alpha" . ?α) ("beta" . ?β) ("gamma" . ?γ)
                                                           ("delta" . Δ) ("epsilon" . ?ε) ("zeta" . ?ζ)
                                                           ("eta" . ?η) ("theta" . ?θ) ("lambda" . ?λ)
                                                           ("micro" . ?μ) ("pi" . ?π) ("rho" . ?ρ)
                                                           ("sigma" . ?σ) ("phi" . ?φ) ("omega" . ?Ω)
                                                           ("sqrt" . ?√) ("sum" . ∑) ("infinity" . ∞)
                                                           ("Infinity" . ∞) ("=>" . ?⇒) ("->" . ?→)))))

(defconst javascript--prettify-symbols-alist '(("function" . ?λ)
					       ("null" . ?∅)))
(add-hook 'js-mode-hook (lambda ()
			  (turn-on-prettify-symbols-mode)
			  (append prettify-symbols-alist javascript--prettify-symbols-alist)))

(add-hook 'js2-mode-hook (lambda ()
			   (turn-on-prettify-symbols-mode)
			   (append prettify-symbols-alist javascript--prettify-symbols-alist)))

(global-set-key (kbd "M-x") 'helm-M-x)



;; Scrolling
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)
(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

(setq-default indent-tabs-mode nil)
(setq tab-width 3)



;; Add NodeJS error format
(require 'compile) 
(pushnew '(node "^[  ]+at \\(?:[^\(\n]+ \(\\)?\\([a-zA-Z\.0-9_/-]+\\):\\([0-9]+\\):\\([0-9]+\\)\)?$" 1 2 3)
            compilation-error-regexp-alist-alist)
(setq compilation-error-regexp-alist
      (cons 'node compilation-error-regexp-alist))

(pushnew '(npm "^[  ]+at \\(?:[^\(\n]+ \(\\)?\\([a-zA-Z\.0-9_/-]+\\):\\([0-9]+\\):\\([0-9]+\\)\)?$" 1 2 3)
            compilation-error-regexp-alist-alist)
(setq compilation-error-regexp-alist
      (cons 'npm compilation-error-regexp-alist))



;; Scrolling
(setq scroll-margin 1
      scroll-conservatively 0
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)
    (setq-default scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)
