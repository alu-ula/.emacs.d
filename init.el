;; 文字コード
(set-keyboard-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)

;; nihongo入力
(require 'mozc)
(setq default-input-method "japanese-mozc")
(global-set-key [zenkaku-hankaku] 'toggle-input-method)
(add-hook 'mozc-mode-hook
          (lambda()
            (define-key mozc-mode-map (kbd "<zenkaku-hankaku>") 'toggle-input-method)))

;; キーバインディング
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-z" 'undo)
(global-set-key "\C-x\C-g" 'goto-line)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-w" 'clipboard-kill-region)

;;フレームのサイズ
(setq initial-frame-alist
      (append
       '((top           . 200)
         (left          . 600)
         (width         . 120)
         (height        . 40)
         (cursor-type   . bar)
         )
       initial-frame-alist))

(setq default-frame-alist initial-frame-alist)

;; ホイールの加速度を無効化
(setq mouse-wheel-progressive-speed nil)

;; 対応する括弧を強調
(show-paren-mode 1)

;; メニューバーを消す
(menu-bar-mode -1)

;; ツールバーを消す
(tool-bar-mode -1)

;; バックアップファイルを作らない
(setq backup-inhibited t)

;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)
(setq auto-save-default nil)

;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;; 行末の空白を表示
(setq-default show-trailing-whitespace t)

;; ミニバッファの履歴を保存する
(savehist-mode 1)

;; 行番号を表示
(global-linum-mode)

;; タイトルバーにバッファの名前を表示
(setq frame-title-format "%f")

;; 起動画面はいらない
(setq inhibit-startup-message t)

;; スクロールバーを右側に表示する
(set-scroll-bar-mode 'right)

;; テーマ
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-taylor)))

;; Webモード
(load "~/.emacs.d/web-mode.el")
(add-to-list 'auto-mode-alist '("\\.twig\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.volt\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(setq web-mode-engines-alist '(("php" . "\\.tpl\\'") ("django" . "\\.volt")))
(defun web-mode-hook ()
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-indent-style 2)
  (setq web-mode-disable-auto-pairing t)
)
(add-hook 'web-mode-hook 'web-mode-hook)

;; PHPモード
(load "~/.emacs.d/php-mode.el")
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

;; YAMLモード
(load "~/.emacs.d/yaml-mode.el")

;; SCSSモード
(load "~/.emacs.d/scss-mode.el")

;; モードごとにインデント幅の指定
(add-hook 'sgml-mode-hook '(lambda () (setq sgml-basic-offset 4)))
(setq-default indent-tabs-mode nil)

(set-frame-font "Ricty-11")

;; eshell
(add-hook 'eshell-mode-hook '(lambda() (setq show-trailing-whitespace nil)))

;; sql
(require 'sql)
(eval-after-load "sql"
  '(progn
     (load-library "~/.emacs.d/sql-indent.el")
     (load-library "~/.emacs.d/sql-complete.el")
     (load-library "~/.emacs.d/sql-transform.el")))
(add-to-list 'auto-mode-alist '("\\.sql$" . sql-mode))

;; Markdown
(autoload 'markdown-mode "~/.emacs.d/markdown-mode.el" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
