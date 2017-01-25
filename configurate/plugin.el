;; Плагины
;; На данный момент закачиваю вручную и помещаю в каталог plugin
;; Переход на менеджер плагинов пока не планирую


;; Подключаем каталог с плагинами
(add-to-list 'load-path "~/.emacs.d/plugin")

;; Эмуляция режима VIM
;; https://www.emacswiki.org/emacs/Evil
(add-to-list 'load-path "~/.emacs.d/plugin/evil")
(require 'evil)
(evil-mode 1)
;; Не перемещать курсор при переключении режимов
(setq evil-move-cursor-back nil)

;; Дерево проекта
;; https://www.emacswiki.org/emacs/download/sr-speedbar.el
(require 'sr-speedbar)
(define-key evil-normal-state-map (kbd "SPC f f") 'sr-speedbar-toggle)
(setq speedbar-use-images t)

;; Сниппеты
;; https://www.emacswiki.org/emacs/Yasnippet
;; https://github.com/joaotavora/yasnippet
(add-to-list 'load-path "~/.emacs.d/plugin/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
(yas/load-directory "~/.emacs.d/plugin/yasnippet/snippets")

;; Переход по объектам - Projectile
;; https://github.com/bbatsov/projectile
;; http://projectile.readthedocs.io/en/latest
;; Помощь по плагину "C-c p C-h"
(add-to-list 'load-path "~/.emacs.d/plugin/projectile")
(require 'projectile)
(projectile-mode 1)
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)

;; Заметки Org
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-log-done t)

;; Индексация файлов Gnu Global
;; http://www.gnu.org/software/global
(require 'gtags)
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-suggested-key-mapping t)
(setq gtags-auto-update t)

;; Подсветка слов
;; https://github.com/nschum/highlight-symbol.el
(add-to-list 'load-path "~/.emacs.d/plugin/highlight-symbol.el")
(require 'highlight-symbol)

;; Подсветка скобок по уровням вложенности
;; https://github.com/Fanael/rainbow-delimiters
(add-to-list 'load-path "~/.emacs.d/plugin/rainbow-delimiters")
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(rainbow-delimiters-mode t)

;; Подсказки в командах alt-x
;; https://www.emacswiki.org/emacs/Smex
;; https://github.com/nonsequitur/smex/
(add-to-list 'load-path "~/.emacs.d/plugin/smex")
(require 'smex)
(smex-initialize)

;; Статус строка - PowerLine
;; https://github.com/Dewdrops/powerline
(add-to-list 'load-path "~/.emacs.d/plugin-change")
(require 'powerline)
(powerline-evil-theme)
