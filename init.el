;; Репозиторий http://github.com/konofeev/emacs
;; Настройки


(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; Подгрузка функций
(load "~/.emacs.d/configurate/function.el")

;; Для линукса запускаем как сервер
(when (system-is-linux)
    (require 'server)
    (unless (server-running-p)
        (server-start)))

;; Общие настройки
(load "~/.emacs.d/configurate/common.el")

;; Модули (встроенные плагины)
(load "~/.emacs.d/configurate/module.el")

;; Плагины (внешние модули, подгружаем вручную)
(load "~/.emacs.d/configurate/plugin.el")

;; Внешний вид
(load "~/.emacs.d/configurate/style.el")

;; Клавиши (как по стандартной функциональности, так и по плагинам)
(load "~/.emacs.d/configurate/hotkey.el")
