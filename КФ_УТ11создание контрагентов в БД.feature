#language: ru

@ExportScenarios
 
Функционал: Создание собственного списка проверки по ИНН

Как Тестировщик
Я хочу создать контрагентов в БД и создать движения (РТУ/ПТУ) для возможности
настройки списка для проверки и проверки сочетаемости условий в нгастройках списка
Предполагается что в БД нет этих контрагентов


Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий без закрытия окон
	

Сценарий: Создание контрагентов и документов движений
