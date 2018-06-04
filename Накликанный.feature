#language: ru



Функционал: Запуск и быстрая проверка КФ

Как Тестировщик
Я хочу Быстренько проверить модуль КФ
Чтобы убедиться, что основной функционал работает

Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И Сброс настроек КФ


Сценарий: Запуск и быстрая проверка КФ

	Когда в командном интерфейсе я выбираю "Нормативно-справочная информация" "Дополнительные обработки"
	Тогда открылось окно "Дополнительные обработки*"
	И     в таблице "ТаблицаКоманд" я перехожу к строке:
		| 'Представление'               |
		| 'Открыть модуль Контур.Фокус' |
	И я нажимаю на кнопку 'Выполнить'
	Тогда открылось окно 'Контур.Фокус*'
	И в поле 'КлючApiСтартовая' я ввожу текст '0572390436ed097a9498888a32cf04d4cc2d5c05'
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
	И Проверка сохранения выписки из ЕГРЮЛ
	И Проверка сохранения отчета
	И Проверка сохранения экспресс отчета
	И Проверка сохранения финансового анализа
	И Проверка создания контрагента
	И я нажимаю на кнопку 'Карточка в Контур.Фокус'
    Тогда сгенерировалась ссылка


