#language: ru

@ExportScenarios



Функционал: Тестовое создание организации чрез вызов фичи

Как Тестировщик
Я хочу проверить раоту фичи
Чтобы знать что она работает


Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий без закрытия окон

#@Поставщик @Сеть
Сценарий: Тестовое создание организации
    Когда Создание организации Поставщик в УТ11