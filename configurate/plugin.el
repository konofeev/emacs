;; Плагины
;; На данный момент закачиваю вручную и помещаю в каталог plugin
;; Переход на менеджер плагинов пока не планирую


;; Подключаем каталог с плагинами
(add-to-list 'load-path "~/.emacs.d/plugin")

;; Эмуляция режима VIM
(add-to-list 'load-path "~/.emacs.d/plugin/evil")
(require 'evil)
(evil-mode 1)
;; Не перемещать курсор при переключении режимов
(setq evil-move-cursor-back nil)

;; Дерево проекта
(require 'sr-speedbar)
(define-key evil-normal-state-map (kbd "SPC f f") 'sr-speedbar-toggle)
(setq speedbar-use-images t)

;; Сниппеты
(add-to-list 'load-path "~/.emacs.d/plugin/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
(yas/load-directory "~/.emacs.d/plugin/yasnippet/snippets")

;; Переход по объектам - Projectile
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

;; Игра судоку
(require 'sudoku)

;; Статус строка - PowerLine
;; https://github.com/Dewdrops/powerline
(add-to-list 'load-path "~/.emacs.d/plugin/powerline")
(require 'powerline)
(powerline-evil-theme)

;; Индексация файлов Gnu Global
(require 'gtags)
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-suggested-key-mapping t)
(setq gtags-auto-update t)

;; Подсветка слов
(require 'highlight-symbol)

;; Подсветка скобок по уровням вложенности
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(rainbow-delimiters-mode t)

;; Подсказки в командах alt-x
(require 'smex)
(smex-initialize)
