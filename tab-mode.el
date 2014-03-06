(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))

(add-hook 'css-mode-hook
          '(lambda ()
             (setq indent-tabs-mode t)
             (setq tab-width 4)
             (setq css-indent-level tab-width)))

(add-hook 'web-mode-hook
          '(lambda ()
             (setq indent-tabs-mode t)
             (setq web-mode-indent-style 4)
             (setq tab-width 4)))

(add-hook 'php-mode-hook
          '(lambda ()
             (setq indent-tabs-mode t)
             (setq tab-width 4)))

(add-hook 'js-mode-hook
          '(lambda ()
             (setq indent-tabs-mode t)
             (setq tab-width 4)))
