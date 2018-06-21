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

	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ФайлСохраняется()","ФайлСохраняется","Тогда файл сохраняется","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ФайлСоздан(Парам01)","ФайлСоздан","Тогда файл создан ""C:\Temp\АвтоТесты_Выписка_из_ЕГРЮЛ.PDF""","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ПроверитьСозданиеФайловПоШаблону(Парам01,Парам02,Парам03)","ПроверитьСозданиеФайловПоШаблону","Тогда Проверить Создание Файлов По Шаблону ""C:\Temp"" ""ВыпискаЕГРЮЛ-*.pdf"" ""7""","","");
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
//Тогда файл создан "C:\Temp\АвтоТесты_Выписка_из_ЕГРЮЛ.PDF"
//@ФайлСоздан(Парам01)
Процедура ФайлСоздан(Парам01) Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	//ВызватьИсключение "Не реализовано.";
	Файл = Новый Файл(Парам01);
	Если НЕ Файл.Существует() Тогда
		ВызватьИсключение("Файл "+Парам01+ " не сохранился");			
	КонецЕсли;
	УдалитьФайлы(Парам01);
КонецПроцедуры

&НаКлиенте
//Ищет созданные файлы в каталоге Парам01 по шаблону Парам02
//если находит - удаляет
//Парам03 не обязательный, содержит число искомых файлов
Процедура ПроверитьСозданиеФайловПоШаблону(Парам01,Парам02,Парам03) Экспорт 
	МассивНайденныхФайлов = НайтиФайлы(Парам01,Парам02,Ложь);
	
	Если Не ЗначениеЗаполнено(Парам03) Тогда
		Парам03 = 0;
	Иначе 
		Парам03 = Число(Парам03);
	КонецЕсли; 
	Если МассивНайденныхФайлов.Количество() >= Парам03 тогда
		//Для Каждого Файл Из МассивНайденныхФайлов Цикл
		//	
		//КонецЦикла;
		УдалитьФайлы(Парам01,Парам02);
	Иначе 
		ВызватьИсключение("Файлы, соответствующие шаблону: " + Парам02 + " в каталоге " + Парам01 + " не найдены");
	КонецЕсли;
	
КонецПроцедуры
