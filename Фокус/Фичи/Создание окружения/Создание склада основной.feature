#language: ru

@ExportScenarios

Функционал: Создание склада Основной

Как Тестировщик
Я хочу иметь инструмент для быстрого создания склада Основной 
Чтобы делать это автоматически

Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий


Сценарий: Создание склада основной в УТ 11

	Когда В командном интерфейсе я выбираю "Нормативно-справочная информация" "Настройки и справочники"
	Тогда открылось окно "Настройки и справочники"
	И     я нажимаю на кнопку "Настройка складского учета"
	Тогда открылось окно "Склад (создание)"
	И     в поле "Наименование" я ввожу текст "Основной склад"
	И     я нажимаю на кнопку "Записать и закрыть"
	И     Я закрываю окно "Настройки и справочники"
