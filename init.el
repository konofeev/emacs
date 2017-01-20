; Необходимо организовать более корректную структуру
; Возможно стоит разбить на разные файлы
; Необходимо вынести на GitHub

; Шрифт
(set-default-font "Consolas 14")

; Отключаем панель инструментов
(tool-bar-mode -1)

; Отключаем меню
(menu-bar-mode -1)

; Отключаем полосы прокрутки
(scroll-bar-mode -1)

; Отключаем мигание курсора
(blink-cursor-mode -1)

; Отключаем графические диалоги
(setq use-dialog-box nil)

; Лучшая отрисовка буфера
(setq redisplay-dont-pause t)

; Отключаем звуковой сигнал
(setq ring-bell-function 'ignore)

; Система - линукс
(defun system-is-linux()
  (string-equal system-type "gnu/linux"))

; Система - винда
(defun system-is-windows()
  (string-equal system-type "windows-nt"))

; Для линукса запускаем как сервер
(when (system-is-linux)
    (require 'server)
    (unless (server-running-p)
        (server-start)))

; Кодировка
(when (system-is-windows)
    ;(codepage-setup 1251)
    (define-coding-system-alias 'windows-1251 'cp1251)
    (define-coding-system-alias 'microsoft-1251 'cp1251)
    (define-coding-system-alias 'microsoft-cp1251 'cp1251)
    (define-coding-system-alias 'windows-cp1251 'cp1251)
    (define-coding-system-alias 'koi8-u 'cyrillic-koi8)
    (define-coding-system-alias 'KOI8-R 'cyrillic-koi8)
    ;(set-language-environment "Cyrillic-ISO")
    ;(cond (window-system (set-frame-font "-cronyx-courier-medium-r-normal-*-17-*-*-*-*-*-*-cp1251")))
    ;(set-input-mode nil nil 'We-will-use-eighth-bit-of-input-byte)
    ;(setq-default coding-system-for-read 'cp1251)
    ;(set-terminal-coding-system 'cp1251)
    (modify-coding-system-alist 'file "\\.java\\'" 'windows-1251)
    (modify-coding-system-alist 'file "\\.cmd\\'" 'windows-1251)
)

; Настройка режима работы с файловой системой
(require 'dired)

; Удаление каталогов с содержимым
(setq dired-recursive-deletes 'top)

; Информация о пользователе
(setq user-full-name "Konofeev Roman")
(setq user-mail-adress "roman@konofeev.ru")

; Заголовок - наименование файла
(setq frame-title-format "%b")

; Отключаем экраны приветствия
(setq inhibit-splash-screen t)
(setq ingibit-startup-message t)

; Подсветка выражений в скобках
(setq show-paren-style 'expression)
(show-paren-mode 2)

; Отключаем автозакрытие скобок
(electric-pair-mode -1)

; Включаем автоотступы
(electric-indent-mode 1)

; Замена выделенного текста
(delete-selection-mode t)

; Отключаем резервирование файлов
(setq make-backup-files nil)

; Отключаем автосохранение файлов
(setq auto-save-default nil)

; Формат времени
(setq display-time-24hr-format t)

; Отображение часов в статус-строке
(display-time-mode t)

; Отключаем добавление отступов клавишей <Tab>
(setq-default indent-tabs-mode nil)

; Ширина табуляции - 4 пробела
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default standart-indent 4)
(setq-default lisp-body-indent 4)

; Перевод строки добавляет табуляцию (4 пробела)
(global-set-key (kbd "RET") 'newline-and-indent)
(setq lisp-indent-function 'common-lip-indent-function)

; Шаг пролистывания
(setq scroll-step 1)

; Пролистывание в 7 строках до границы странцы
(setq scroll-margin 7)

; Плавная прокрутка
(setq scroll-conservatively 1000)

; Укоротить сообщения в минибуфере
(defalias 'yes-or-no-p 'y-or-n-p)

; Общий буфер обмена с системой
(setq x-select-enable-clipboard t)

; Подсветка результатов поиска
(setq search-highlight t)
(setq query-replace-highlight t)

; Подключаем репозиторий плагинов
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

; Эмуляция режима VIM
(add-to-list 'load-path "~/.emacs.d/plugin/evil")
(require 'evil)
(evil-mode 1)

; Подключаем каталог с плагинами
(add-to-list 'load-path "~/.emacs.d/plugin")
(require 'sr-speedbar)
(define-key evil-normal-state-map (kbd "SPC f f") 'sr-speedbar-toggle)
(setq speedbar-use-images t)

;; Краткое руководство
; c-h k <hotkey> - узнать действие комбинации клавиш
; c-h f <function> - узнать действие функции
; c-h v <variable> - узнать назначение переменной
; c-h a <name> - поиск по функциям\переменным
; (+ 3 4 3 4) - сложение
; (message "test text") - вывод текста
;
; Объявление функции
; (defun my-function ()
;   (interactive)          ; для вызова с помощью клавиш
;   (message "test text"))
; Вызов функции
; (my-function)
; Использование горячих клавиш
; (global-set-key (kbd "C-<f9>") 'my-function)
; Снять комбинацию горячих клавиш
; (global-unset-key (kbd "C-<f9>"))

; Выход из режима ввода и редактирование комбинацией Shift-Space
(define-key evil-insert-state-map (kbd "S-SPC") 'evil-normal-state)
(define-key evil-replace-state-map (kbd "S-SPC") 'evil-normal-state)

; Подсказки при выборе команд
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

; Сохранение файла
(define-key evil-normal-state-map (kbd "SPC w") 'save-buffer)

; Закрыть всё
(define-key evil-normal-state-map (kbd "SPC ESC") 'save-buffers-kill-terminal)

; Открыть буфер
(define-key evil-normal-state-map (kbd "SPC b") 'ido-switch-buffer)

; Сниппеты
(add-to-list 'load-path "~/.emacs.d/plugin/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
(yas/load-directory "~/.emacs.d/plugin/yasnippet/snippets")

; Переход по объектам
; Плагин Projectile
(add-to-list 'load-path "~/.emacs.d/plugin/projectile")
(require 'projectile)
(projectile-mode 1)
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)
; Помощь по плагину "C-c p C-h"

; Очистка терминала
(defun eshell-clear-buffer ()
  "Очистка терминала"
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))
(add-hook 'eshell-mode-hook
      '(lambda()
          (local-set-key (kbd "C-l") 'eshell-clear-buffer)))

; Закладки
(define-key evil-normal-state-map (kbd "SPC m s") 'bookmark-set)
(define-key evil-normal-state-map (kbd "SPC m g") 'bookmark-jump)
(define-key evil-normal-state-map (kbd "SPC m l") 'bookmark-bmenu-list)

; Сворачивание текста
(defvar hs-special-modes-alist
    (mapcar 'purecopy
      '((c-mode "{" "}" "/[*/]" nil nil)
        (c++-mode "{" "}" "/[*/]" nil nil)
        (java-mode "{" "}" "/[*/]" nil nil)
        (emacs-list-mode "(" ")" nil))))
(require 'hideshow)

; Переоткрыть в указанной кодировке C-x RET r
; Сохранить в указанной кодировке C-x RET f

; Заметки Org
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

; Переход по строкам
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)

; Раскраска статус-строки в зависимости от текущего режима
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
            (set-face-foreground 'mode-line (cdr color))
            )
        )
    )
)

; По умолчания язык ввода для внутреннего переключения русский
(setq default-input-method "russian-computer")

; Переключение комментирования выделенного участка текста
(define-key evil-visual-state-map (kbd "g c") 'comment-or-uncomment-region)
(define-key evil-normal-state-map (kbd ", b") 'toggle-truncate-lines)

; Игра судоку
(require 'sudoku)

; Буферы
(require 'bs)
(require 'ibuffer)
(defalias 'list-buffers 'ibuffer)
(global-set-key (kbd "<f2>") 'bs-show)

; Цвета
(set-background-color "#FFFFFF")
(set-foreground-color "#335599")

; Подсветка текущей строки
(hl-line-mode t)

; Выравнивание с повтором до конца строки
(defun align-repeat (start end regexp)
    "Выравнивание кода по регулярному выражению с повтором"
    (interactive "r\nsВыравнивание по выражению: ")
    (align-regexp start end
        (concat "\\(\\s-*\\)" regexp) 1 1 t))
(define-key evil-visual-state-map (kbd "SPC a") 'align-repeat)
(define-key evil-normal-state-map (kbd "SPC a") 'align-repeat)

; Projectile
(define-key evil-normal-state-map (kbd "SPC p p") 'projectile-switch-project)
(define-key evil-normal-state-map (kbd "SPC p f") 'projectile-find-file)

; Открыть файл настроек
(defun open-emacs-configurate()
    (interactive)
    (find-file "~/.emacs.d/init.el"))
(define-key evil-normal-state-map (kbd "SPC o e") 'open-emacs-configurate)

; Открыть файл org по вопросам явы
(defun open-org-java()
    (interactive)
    (find-file "d:/work/repository/org/main.org"))
(define-key evil-normal-state-map (kbd "SPC o j") 'open-org-java)

; ido: вертикальное расположение элементов
(setq ido-decorations
    (quote
        ("\n-> " "" "\n   " "\n   ..." "[" "]" " [Не найдено]" " [Найдено]" " [Не читабильно]" " [Крупный]" " [Подтвердите]")))

; Расцветка курсора в зависимости от режима
(setq evil-emacs-state-cursor    '("#FF0000" box))
(setq evil-normal-state-cursor   '("#444488" box))
(setq evil-visual-state-cursor   '("#886644" box))
(setq evil-insert-state-cursor   '("#884444" bar))
(setq evil-replace-state-cursor  '("#AA4444" hbar))
(setq evil-operator-state-cursor '("#FF0000" hollow))

; Коректная работа клавиши escape
(defun minibuffer-keyboard-quit ()
  "Отстановить рекурсивное редактирование.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

; Запуск в развернутом режиме окна
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

; Вставка пробелов при переводе строки
(define-key global-map (kbd "RET") 'newline-and-indent)

; Не перемещать курсор при переключении режимов
(setq evil-move-cursor-back nil)

;; Генерация файла тегов TAGS
;; https://www.emacswiki.org/emacs/BuildTags
;; cd <path-to-project>
;; dir /b /s <pattern-files> | <full-path-to-etags> -
;; dir /b /s *.java | c:\work\program\emacs\bin\etags.exe -
;; ls -LR - дерево файлов
;; du -sh - размер каталогов

;; Вкладки
;; (require 'elscreen)
;; (elscreen-start)
;; (define-key evil-normal-state-map (kbd "SPC n") 'elscreen-create)
;; (define-key evil-normal-state-map (kbd "SPC q") 'elscreen-kill)
;; (define-key evil-normal-state-map (kbd "SPC h") 'elscreen-previous)
;; (define-key evil-normal-state-map (kbd "SPC l") 'elscreen-next)

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

;;(setq gtags-rootdir "c:\\Users\\sbt-konofeyev-rr\\home\\project\\esa\\" )
;;(setq gtags-path-style "absolute") 

;; Использование тегов - Gnu Global
(define-key evil-normal-state-map (kbd "C-]") 'gtags-find-pattern)
(define-key evil-normal-state-map (kbd "C-t") 'gtags-pop-stack)

;; Подсветка слов
(require 'highlight-symbol)
(define-key evil-normal-state-map (kbd ", m m") 'highlight-symbol)
(define-key evil-normal-state-map (kbd ", m r") 'highlight-regexp)

;; Подсветка скобок по уровням вложенности
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(rainbow-delimiters-mode t)


;; Запуск шелла
(define-key evil-normal-state-map (kbd "SPC r s") 'eshell)

;; Кодировки
;; c-x RET c-h справка по клавишам для смены кодировки\языка\раскладки
;; c-x RET p   смена кодировок для терминала

;; Подсказки в командах alt-x
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
;(global-set-key (kbd "M-x") 'smex-major-mode-commands)
