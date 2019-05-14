;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
;; (setq doom-theme 'doom-one-light)
(setq doom-theme 'doom-dracula)

;; Smooth scrolling
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1))) ;; one line at a time

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(setq scroll-step 1) ;; keyboard scroll one line at a time

(load! "+bindings")
(require 'company)

(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))

(general-define-key
 "C-S-k" 'backward-kill-line)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-n") nil)
  (define-key company-active-map (kbd "C-p") nil)
  (define-key company-active-map (kbd "C-f") nil)
  (define-key company-active-map (kbd "C-b") nil)
  (define-key company-active-map (kbd "C-v") nil)
  (define-key company-active-map (kbd "M-v") nil)
  (define-key company-active-map (kbd "C-d") nil)
  (define-key company-active-map (kbd "<return>") nil)
  (define-key company-active-map (kbd "RET") nil)
  (define-key company-active-map (kbd "C-<return>") 'company-complete-selection)
  (define-key company-active-map (kbd "C-RET") 'company-complete-selection))
(setq company-idle-delay 0.2
      company-minimum-prefix-length 1)

(setq doc-view-resolution 300)
