#language: ru



Функционал: Запуск и быстрая проверка КФ

Как Тестировщик
Я хочу Быстренько проверить модуль КФ
Чтобы убедиться, что основной функционал работает

Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И Сброс настроек КФ


Сценарий: Запуск и быстрая проверка КФ

	Когда Запуск модуля КФ в УТ11
	Тогда открылось окно 'Контур.Фокус*'
	И в поле 'КлючApiСтартовая' я ввожу текст '2837e6e7fd3b95be2854f539e7e654235f4c3728'
	И я перехожу к следующему реквизиту
	И пауза 2
	И я нажимаю на гиперссылку "Продолжить"
	И я перехожу к закладке "Анализ базы результаты"
    И я перехожу к закладке "Страница основная"
	И я нажимаю на гиперссылку "Начать работу"
    И в поле 'Быстрая проверка ИНН' я ввожу текст '7707194434'
	И я нажимаю на кнопку 'Проверить'
	Тогда открылось окно 'Сводка по *'
	И     у табличного документа с именем "ПолеТабличногоДокумента" я перехожу к ячейке "R5C4:R5C12"
	И Фокус Проверка сохранения выписки из ЕГРЮЛ
	И Фокус Проверка сохранения отчета
	И Фокус Проверка сохранения экспресс отчета
	И Фокус Проверка сохранения финансового анализа
	И Фокус Проверка создания контрагента из сводки и его удаление "7707194434"
#	И я нажимаю на кнопку 'Карточка в Контур.Фокус'
#   Тогда сгенерировалась ссылка
	И Я закрываю окно "Сводка по*"
	И Фокус Создание списка проверки по ИНН
	И Фокус проверка действий с заполненным списком
	

