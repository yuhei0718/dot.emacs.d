(require 'helm-config)

;http://d.hatena.ne.jp/tomoya/20130519/1368942603
(define-key global-map (kbd "C-]") 'helm-for-files)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
(define-key global-map (kbd "C-M-]") 'helm-resume)


;http://shibayu36.hatenablog.com/entry/2013/10/19/191958
(global-set-key (kbd "C-M-o") 'helm-occur)
;(define-key isearch-mode-map (kbd "C-o") 'helm-occur-from-isearch)
;(define-key helm-map (kbd "C-c C-a") 'all-from-helm-occur)


;http://d.hatena.ne.jp/syohex/20130302/1362182193
(require 'helm-files)
(require 'helm-ag)
(global-set-key (kbd "M-g .") 'helm-ag)
(global-set-key (kbd "M-g ,") 'helm-ag-pop-stack)
(global-set-key (kbd "C-M-s") 'helm-ag-this-file)


;https://github.com/emacs-helm/helm-descbinds
;(require 'helm-descbinds)
;(helm-descbinds-mode)
;;; prior to emacs24
;(helm-descbinds-mode 1)


;https://github.com/emacs-helm/helm-migemo
(require 'helm-migemo)
(setq helm-use-migemo t)
;(define-key global-map [(control ?:)] 'helm-migemo)

(require 'helm-project)
(define-key global-map (kbd "C-c b") 'helm-project)
(define-key global-map (kbd "C-S-f") 'helm-project-grep)
;; hg project
(hp:add-project 
 :name 'hg
 :look-for '(".hg")
 :exclude-regexp '("\\.pyc$"))


;http://www49.atwiki.jp/ntemacs/pages/32.html
;; helmコマンドで migemo を有効にする
;(setq helm-migemize-command-idle-delay helm-idle-delay)
;(helm-migemize-command helm-for-files)
;(helm-migemize-command helm-occur)


;; 情報源 helm-source-occur と helm-source-grep について、利用開始時点から helm-follow-mode を ON にする
;; 情報源 helm-source-locate と helm-source-grep について、検索必要最低文字数を 2 とする。
;; helm-occur コマンドを使う際に migemo でマッチした箇所がハイライトするようにする
(add-hook 'helm-before-initialize-hook
          (lambda ()
            (when helm-source-locate
              ;; (setcdr (assq 'candidate-number-limit helm-source-locate) helm-candidate-number-limit)
              (setcdr (assq 'requires-pattern helm-source-locate) 2))
            (when helm-source-occur
              (helm-attrset 'follow 1 helm-source-occur)
              (delete '(nohighlight) helm-source-occur))
            (when helm-source-grep
              (helm-attrset 'follow 1 helm-source-grep)
              ;; (setcdr (assq 'candidate-number-limit helm-source-grep) helm-candidate-number-limit)
              (setcdr (assq 'requires-pattern helm-source-grep) 2))))
