;; Общие настройки


;; Кодировка
(when (system-is-windows)
    (define-coding-system-alias 'windows-1251 'cp1251)
    (define-coding-system-alias 'microsoft-1251 'cp1251)
    (define-coding-system-alias 'microsoft-cp1251 'cp1251)
    (define-coding-system-alias 'windows-cp1251 'cp1251)
    (define-coding-system-alias 'koi8-u 'cyrillic-koi8)
    (define-coding-system-alias 'KOI8-R 'cyrillic-koi8)
    (modify-coding-system-alist 'file "\\.java\\'" 'windows-1251)
    (modify-coding-system-alist 'file "\\.cmd\\'" 'windows-1251)
    (set-terminal-coding-system 'cp1251))

;; Информация о пользователе
(setq user-full-name "Konofeev Roman")
(setq user-mail-adress "roman@konofeev.ru")

;; Заголовок - наименование файла
(setq frame-title-format "%b")

;; Отключаем автозакрытие скобок
(electric-pair-mode -1)

;; Включаем автоотступы
(electric-indent-mode 1)

;; Замена выделенного текста
(delete-selection-mode t)

;; Отключаем резервирование файлов
(setq make-backup-files nil)

;; Отключаем автосохранение файлов
(setq auto-save-default nil)

;; Отключаем добавление отступов клавишей <Tab>
(setq-default indent-tabs-mode nil)

;; Ширина табуляции - 4 пробела
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default standart-indent 4)
(setq-default lisp-body-indent 4)

;; Перевод строки добавляет табуляцию (4 пробела)
(global-set-key (kbd "RET") 'newline-and-indent)
(setq lisp-indent-function 'common-lip-indent-function)

;; Шаг пролистывания
(setq scroll-step 1)

;; Пролистывание в 7 строках до границы странцы
(setq scroll-margin 7)

;; Плавная прокрутка
(setq scroll-conservatively 1000)

;; Укоротить сообщения в минибуфере
(defalias 'yes-or-no-p 'y-or-n-p)

;; Общий буфер обмена с системой
(setq x-select-enable-clipboard t)

;; По умолчания язык ввода для внутреннего переключения русский
(setq default-input-method "russian-computer")

;; ido: вертикальное расположение элементов
(setq ido-decorations
    (quote
        ("\n-> " "" "\n   " "\n   ..." "[" "]" " [Не найдено]" " [Найдено]" " [Не читабильно]" " [Крупный]" " [Подтвердите]")))

;; Запуск в развернутом режиме окна
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))
