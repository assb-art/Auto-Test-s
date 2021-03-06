﻿
#Область Служебные_функции_и_процедуры

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,ОписаниеШага,ТипШага,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ОчиститьНастройкиКФ()","ОчиститьНастройкиКФ","Когда Очистить настройки КФ","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"НастройкиКФОчищены()","НастройкиКФОчищены","Тогда настройки КФ очищены","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ОчиститьСправочникСписков()","ОчиститьСправочникСписков","Когда Очистить справочник списков","","");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции

#КонецОбласти



#Область Работа_со_сценариями

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры

#КонецОбласти


///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//Когда Очистить настройки КФ
//@ОчиститьНастройкиКФ()
Процедура ОчиститьНастройкиКФ() Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	//ВызватьИсключение "Не реализовано.";
	ОчиститьНаСервере();
КонецПроцедуры

&НаКлиенте
//Тогда настройки КФ очищены
//@НастройкиКФОчищены()
Процедура НастройкиКФОчищены() Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	//Если ЕстьДобавленныеОбъекты() Тогда
	//	ВызватьИсключение "Настройки не очищены";
	//КонецЕсли; 
	
КонецПроцедуры

&НаСервере
Процедура ОчиститьНаСервере()
	
	Если ЕстьДобавленныеОбъекты() Тогда
		
		РЗ = РегистрыСведений.Фокус_ДополнительныеРеквизиты.СоздатьНаборЗаписей();
		РЗ.Записать();
		
	Иначе 
		Возврат;
	КонецЕсли;
	
	ХранилищеСистемныхНастроек.Удалить("КонтурФокус_ПервыйЗапуск",,);
	ХранилищеСистемныхНастроек.Удалить("КонтурФокус_КлючДоступа",,);
	ХранилищеСистемныхНастроек.Удалить("КонтурФокус_НастроенныеСпискиКонтрагентов",,);
	ХранилищеСистемныхНастроек.Удалить("КонтурФокус_ПараметрыПочты",,);
	ХранилищеСистемныхНастроек.Удалить("КонтурФокус_ГраницаЗеленыхМаркеров",,);
	ХранилищеСистемныхНастроек.Удалить("КонтурФокус_ГраницаЖелтыхМаркеров",,);
	ХранилищеСистемныхНастроек.Удалить("КонтурФокус_ГраницаКрасныхМаркеров",,);
	ХранилищеСистемныхНастроек.Удалить("КонтурФокус_Маркеры",,);
	ХранилищеСистемныхНастроек.Удалить("КонтурФокус_НастройкиПрокси",,);
	
	Списки = Справочники.Фокус_СписокКонтрагентов.Выбрать();
	
	Пока Списки.Следующий() Цикл
		Списки.ПолучитьОбъект().Удалить();
	КонецЦикла;
	
КонецПроцедуры

&НаСервере
Функция ЕстьДобавленныеОбъекты() Экспорт
	
	ЕстьДобавленныеОбъекты = ЕстьНеобходимыеМетаданные("Справочники.Фокус_СписокКонтрагентов") И 
							ЕстьНеобходимыеМетаданные("РегистрыСведений.Фокус_ОтветыСервера") И 
							ЕстьНеобходимыеМетаданные("РегистрыСведений.Фокус_ИсторияМаркеров") И 
	   						ЕстьНеобходимыеМетаданные("РегистрыСведений.Фокус_ДополнительныеРеквизиты");
	 
	Возврат ЕстьДобавленныеОбъекты;
	
КонецФункции 

&НаСервере
Функция ЕстьНеобходимыеМетаданные(СтрокаМетаданных) Экспорт
	
	ТекПолеМетаданных = Метаданные;
	
	МассивИмен = Контур_РазложитьСтрокуВМассивСлов(СтрокаМетаданных, ".");

	КоличествоИмен = МассивИмен.Количество();
		
	Если НЕ (КоличествоИмен = 2 ИЛИ КоличествоИмен = 4 ИЛИ КоличествоИмен = 6) Тогда
		Возврат Ложь;
	КонецЕсли;
	
	КоличествоПоисков = КоличествоИмен/2;
	Для н = 1 По КоличествоПоисков Цикл
		ТекПолеМетаданных = ТекПолеМетаданных[МассивИмен[н*2-2]].Найти(МассивИмен[н*2-1]);
		Если ТекПолеМетаданных = Неопределено Тогда
			Возврат Ложь;
		КонецЕсли;
	КонецЦикла;
	
	Возврат Истина;	
	
КонецФункции

&НаСервере
Функция Контур_РазложитьСтрокуВМассивСлов(Знач Строка, РазделителиСлов = ",") Экспорт
	
	Слова = Новый Массив;
	
	Для Сч = 1 По СтрДлина(РазделителиСлов) Цикл
		Строка = СтрЗаменить(Строка, Сред(РазделителиСлов, Сч, 1),Символы.ПС);
	КонецЦикла;
	
	Для Сч = 1 По СтрЧислоСтрок(Строка) Цикл
		ТекСлово = СокрЛП(СтрПолучитьСтроку(Строка, Сч));
		Если ТекСлово<>"" Тогда
			Слова.Добавить(ТекСлово);
		КонецЕсли;	
	КонецЦикла;	
	
	Возврат Слова;
	
КонецФункции

&НаКлиенте
Процедура ОчиститьСправочникСписков() Экспорт
	ОчиситьСправочникСписковНаСервере();	
КонецПроцедуры

&НаСервере
Процедура ОчиситьСправочникСписковНаСервере()
	Выборка = Справочники.Фокус_СписокКонтрагентов.Выбрать();
	Пока Выборка.Следующий() Цикл 
		Выборка.ПолучитьОбъект().Удалить();
	КонецЦикла;
	
КонецПроцедуры


	