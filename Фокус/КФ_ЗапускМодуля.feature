#language: ru

@ExportScenarios

Функционал: Запуск модуля КФ

Как Тестировщик
Я хочу иметь возможность запускать предварительно добавленный модуль КФ в дополнительные обработки
Чтобы поьзоваться этой возможностью в разных фичах

Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И Сброс настроек КФ


Сценарий: Запуск модуля КФ в УТ11
    Когда в командном интерфейсе я выбираю "Нормативно-справочная информация" "Дополнительные обработки"
	Тогда открылось окно "Дополнительные обработки*"
	И     в таблице "ТаблицаКоманд" я перехожу к строке:
		| 'Представление'               |
		| 'Открыть модуль Контур.Фокус' |
	И я нажимаю на кнопку 'Выполнить'
	Тогда открылось окно 'Контур.Фокус*'