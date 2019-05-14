;;; ~/Lab/personal/mespieds/emacs/doom/.doom.d/+bindings.el -*- lexical-binding: t; -*-

;; Yukio Usuzumi
(map! ;; :e "RET"           #'newline-and-indent
      :e "C-S-k"         #'backward-kill-line
      :g "M-<up>"        #'evil-window-up
      :g "M-<down>"      #'evil-window-down
      :g "M-<left>"      #'evil-window-left
      :g "M-<right>"     #'evil-window-right
      :g "C-a"           #'mwim-beginning-of-code-or-line
      :g "C-e"           #'mwim-end-of-code-or-line
      :g "M-S-<mouse-1>" #'mc/add-cursor-on-click
      :g "C-="           #'er/expand-region
      :g "C--"           #'er/contract-region)

(map! :e [remap newline]                #'newline-and-indent
      :i "C-j"                          #'+default/newline)

(map! :leader
      :desc "Find file in project"            "M-m"  #'projectile-find-file
      (:prefix ("/" . "search")))
;;        :desc "Search current symbol in project"                "P"
;;        (cond ((featurep! :completion ivy) #'projectile-find-current-symbol)
;;              ((featurep! :completion helm) #'+helm/project-search))))
