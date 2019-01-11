;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;;                               Melpa setup
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;;                               GUI setup
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(scroll-bar-mode -1)
(tool-bar-mode -1)
(add-to-list 'default-frame-alist '(width . 130))
(add-to-list 'default-frame-alist '(height . 65))
(add-to-list 'default-frame-alist '(left . 515))
(add-to-list 'default-frame-alist '(top . 25))
(setq visible-bell nil)           ; Do not flash the frame for the visual bell
(setq ring-bell-function 'ignore) ; Do not ring the bell at all


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;;                               Editor setup
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prefer-coding-system 'utf-8)
(show-paren-mode 1)
(electric-pair-mode 1)
(global-hl-line-mode 1)
(column-number-mode t)
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq-default tab-width 3)
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))

(add-hook 'prog-mode-hook 'auto-revert-mode)
(global-auto-revert-mode t)
(add-to-list 'auto-mode-alist '("\\.pddl\\'" . lisp-mode))

;; web-development
(add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))

(setq web-mode-enable-current-column-highlight t)
(setq web-mode-enable-current-element-highlight t)

(defun my-web-mode-hook ()
  (set (make-local-variable 'company-backends) '(company-css company-web-html company-yasnippet company-files))
)
(add-hook 'web-mode-hook  'emmet-mode)
(add-hook 'web-mode-before-auto-complete-hooks
    '(lambda ()
     (let ((web-mode-cur-language
  	    (web-mode-language-at-pos)))
               (if (string= web-mode-cur-language "php")
    	   (yas-activate-extra-mode 'php-mode)
      	 (yas-deactivate-extra-mode 'php-mode))
               (if (string= web-mode-cur-language "css")
    	   (setq emmet-use-css-transform t)
      	 (setq emmet-use-css-transform nil)))))

;; (require 'web-beautify) ;; Not necessary if using ELPA package
;; (eval-after-load 'js2-mode
;;   '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))
;; (eval-after-load 'json-mode
;;   '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))
;; (eval-after-load 'sgml-mode
;;   '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))
;; (eval-after-load 'css-mode
;;   '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))

;; (eval-after-load 'js2-mode
;;   '(add-hook 'js2-mode-hook
;; 			 (lambda ()
;; 			   (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

;; (eval-after-load 'json-mode
;;   '(add-hook 'json-mode-hook
;; 			 (lambda ()
;; 			   (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

;; (eval-after-load 'sgml-mode
;;   '(add-hook 'html-mode-hook
;; 			 (lambda ()
;; 			   (add-hook 'before-save-hook 'web-beautify-html-buffer t t))))

;; (eval-after-load 'css-mode
;;   '(add-hook 'css-mode-hook
;; 			 (lambda ()
;; 			   (add-hook 'before-save-hook 'web-beautify-css-buffer t t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;;                Emacs's custom-set-variables DO NOT EDIT!!!
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (base16-gruvbox-dark-medium)))
 '(custom-safe-themes
   (quote
	("6daa09c8c2c68de3ff1b83694115231faa7e650fdbb668bc76275f0f2ce2a437" "4feee83c4fbbe8b827650d0f9af4ba7da903a5d117d849a3ccee88262805f40d" default)))
 '(package-selected-packages
   (quote
	(js2-mode emmet-mode yasnippet web-beautify company-web web-mode base16-theme go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

