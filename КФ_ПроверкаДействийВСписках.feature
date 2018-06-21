#language: ru

@ExportScenarios
 

Функционал: Фокус проверка действий в списках

Как Тестировщик
Я хочу проверять выполнение тех или иных действий в созданных списках
Чтобы убедиться в их работоспособности 

Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий без закрытия окон
	


Сценарий: Фокус проверка действий с заполненным списком
    Когда открылось окно "Контур.Фокус*"
    И     я нажимаю на кнопку "Обновить"
    Тогда открылось окно "Контур.Фокус"
    И     я нажимаю на кнопку "Отметить все как прочитанное"
    Тогда элемент формы с именем "КоличествоНовыхСписка4" стал равен "-"
    И     я нажимаю на кнопку "Скачать все выписки из ЕГРЮЛ"
    Тогда в Папке создались файлы
