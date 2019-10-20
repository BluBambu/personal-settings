;; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)

;; color theme
(load-theme 'tango-dark)

;; auto indent
(electric-indent-mode 1)

;; disable the menu bar
(menu-bar-mode -1)

;; scroll one line at a time
(setq mouse-wheel-scrollamount '(((shift) . 1)))
(setq scroll-step 1)

;; scroll half way down
(global-set-key [(control ?v)]
  (lambda() (interactive (next-line (/(window-height (selected-window)) 2)))))

;; set scroll margins
(setq scroll-margin 10)

;; add line numbers
(global-linum-mode 1)
(setq linum-format "%3d \u2502 ")

;; display column numbers
(setq column-number-mode t)

;; disable backup files
(setq make-backup-files nil)

;; disable auto save files
(setq auto-save-default nil)

;; no tabs
(setq-default tab-width 2)
(setq-default js-indent-level 2)
(setq-default css-indent-offset 2)
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'insert-tab)

;; MELPA
(require 'package)
(add-to-list
  'package-archives
  '("melpa" . "http://melpa.org/packages/")
  t)
(package-initialize)

;; plugins
(defvar required-packages '(
                            auto-complete
                            autopair
                            ) "Default packages")

;; check if all packages are installed
(require 'cl)
(defun packages-installed-p ()
  (loop for p in required-packages
     when (not (package-installed-p p)) do (return nil)                
     finally (return t)))

;; if not all packages are installed, check one by one and install the missing ones.
(unless (packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;; auto-complete plugin
(require 'auto-complete-config)
(ac-config-default)

;; autopair plugin
(require 'autopair)
(autopair-global-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
