;; Настройка внешнего вида


;; Шрифт
(set-default-font "Consolas 14")

;; Отключаем панель инструментов
(tool-bar-mode -1)

;; Отключаем меню
(menu-bar-mode -1)

;; Отключаем полосы прокрутки
(scroll-bar-mode -1)

;; Отключаем мигание курсора
(blink-cursor-mode -1)

;; Отключаем графические диалоги
(setq use-dialog-box nil)

;; Лучшая отрисовка буфера
(setq redisplay-dont-pause t)

;; Отключаем звуковой сигнал
(setq ring-bell-function 'ignore)

;; Отключаем экраны приветствия
(setq inhibit-splash-screen t)
(setq ingibit-startup-message t)

;; Подсветка выражений в скобках
(setq show-paren-style 'expression)
(show-paren-mode 2)

;; Формат времени
(setq display-time-24hr-format t)

;; Отображение часов в статус-строке
(display-time-mode t)

;; Подсветка результатов поиска
(setq search-highlight t)
(setq query-replace-highlight t)

;; Раскраска статус-строки в зависимости от текущего режима
(lexical-let ((default-color (cons (face-background 'mode-line)
                                    (face-foreground 'mode-line))))
    (add-hook 'post-command-hook
        (lambda ()
            (let ((color (cond ((minibufferp) default-color)
                            ((evil-insert-state-p)  '("#FFCCCC" . "#884444"))
                            ((evil-replace-state-p) '("#FFAAAA" . "#884444"))
                            ((evil-normal-state-p)  '("#CCCCFF" . "#444488"))
                            ((evil-visual-state-p)  '("#FFFFCC" . "#888844"))
                            ((evil-emacs-state-p)   '("#CCCCCC" . "#444444"))
                            (t default-color))))
            (set-face-background 'mode-line (car color))
            (set-face-foreground 'mode-line (cdr color))))))

;; Цвета
(set-background-color "#FFFFFF")
(set-foreground-color "#335599")

;; Подсветка текущей строки
(hl-line-mode t)

;; Расцветка курсора в зависимости от режима
(setq evil-emacs-state-cursor    '("#FF0000" box))
(setq evil-normal-state-cursor   '("#444488" box))
(setq evil-visual-state-cursor   '("#886644" box))
(setq evil-insert-state-cursor   '("#884444" bar))
(setq evil-replace-state-cursor  '("#AA4444" hbar))
(setq evil-operator-state-cursor '("#FF0000" hollow))