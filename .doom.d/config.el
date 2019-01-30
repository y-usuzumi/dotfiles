;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
;; (setq doom-theme 'doom-one-light)
(load! "+bindings")
(require 'company)
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
