;; Настройка встроенных модулей


;; Настройка режима работы с файловой системой
(require 'dired)

;; Удаление каталогов с содержимым
(setq dired-recursive-deletes 'top)

;; Подсказки при выборе команд
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; Сворачивание текста
(defvar hs-special-modes-alist
    (mapcar 'purecopy
      '((c-mode "{" "}" "/[*/]" nil nil)
        (c++-mode "{" "}" "/[*/]" nil nil)
        (java-mode "{" "}" "/[*/]" nil nil)
        (emacs-list-mode "(" ")" nil))))
(require 'hideshow)
(add-hook 'prog-mode-hook #'hs-minor-mode)

;; Буферы
(require 'bs)
(require 'ibuffer)
(defalias 'list-buffers 'ibuffer)
