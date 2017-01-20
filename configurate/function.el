;; Функции


;; Система - линукс
(defun system-is-linux()
  (string-equal system-type "gnu/linux"))

;; Система - винда
(defun system-is-windows()
  (string-equal system-type "windows-nt"))

;; Очистка терминала
(defun eshell-clear-buffer ()
  "Очистка терминала"
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))

;; Выравнивание с повтором до конца строки
(defun align-repeat (start end regexp)
    "Выравнивание кода по регулярному выражению с повтором"
    (interactive "r\nsВыравнивание по выражению: ")
    (align-regexp start end
        (concat "\\(\\s-*\\)" regexp) 1 1 t))

;; Открыть файл настроек
(defun open-emacs-configurate()
    (interactive)
    (find-file "~/.emacs.d/init.el"))

;; Открыть файл org
(defun open-org-java()
    (interactive)
    (find-file "d:/work/repository/org/main.org"))