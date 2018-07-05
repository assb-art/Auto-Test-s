#language: ru

@ExportScenarios
@Tree
 
Функционал: Создание контргаентов в БД

Как Тестировщик	
Я хочу создать контрагентов в БД и создать движения (РТУ/ПТУ) для возможности
настройки списка для проверки и проверки сочетаемости условий в нгастройках списка
Предполагается что в БД нет этих контрагентов


Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий без закрытия окон
	

Структура сценария: Создание контрагентов в УТ11
	Когда В командном интерфейсе я выбираю "Нормативно-справочная информация" "Контрагенты"
	Тогда открылось окно "Контрагенты"
	И в таблице "Список" я нажимаю на кнопку "Создать нового"
	Тогда открылось окно "Контрагент (создание)"
	И     в поле "ИНН" я ввожу текст <ИНН>
	И     в поле "КПП" я ввожу текст <КПП>
	И     в поле "Код по ОКПО" я ввожу текст <ОКПО>
	И     в поле "Сокр. юр. наименование" я ввожу текст <СокрНаименование>
	И     в поле "Рабочее наименование" я ввожу текст <РабочееНаименовение>
	И     я изменяю флаг "Клиент"
	И     я изменяю флаг "Поставщик"
	И     в поле "Комментарий" я ввожу текст "Создан автотестом Vanessa Behavior"	
	И     я нажимаю на кнопку "Записать и закрыть"
	И  	  Я закрыл все окна клиентского приложения


	Примеры:
		| ИНН			| КПП		  | ОКПО		| СокрНаименование  | РабочееНаименовение |
		| "7453227718" 	| "745301001" | "68676111" | ООО Бабушка	    | ООО Бабушка		  |
		| "2315097649" 	| "231501001" | "34960088" | ООО Дедушка	    | ООО Дедушка		  |
		| "8603228850"	| "860301001" | "16066159" | ООО Внук и внучка  | ООО Внук и внучка   |
		| "5258086241" 	| "525801001" | "63261859" | ООО Кошка		    | ООО Кошка			  |
		| "3661063781" 	| "366101001" | "29685148" | ООО Мышка		    | ООО Мышка			  |
		| "7422019669"	| "741301001" | "45650349" | ООО Репка		    | ООО Репка			  |
