
Перем мИсполнителиКоманд;
Перем мРегистраторКоманд;

Процедура ЗарегистрироватьКоманды(Знач Парсер) Экспорт
	
	КомандыИРеализация = Новый Соответствие;
	мРегистраторКоманд.ПриРегистрацииКомандПриложения(КомандыИРеализация);
	
	Для Каждого КлючИЗначение Из КомандыИРеализация Цикл
		ДобавитьКоманду(КлючИЗначение.Ключ, КлючИЗначение.Значение, Парсер);
	КонецЦикла;
	
КонецПроцедуры

Процедура РегистраторКоманд(Знач ОбъектРегистратор) Экспорт
	мИсполнителиКоманд = Новый Соответствие;	
	мРегистраторКоманд = ОбъектРегистратор;
КонецПроцедуры

Функция ПолучитьКоманду(Знач ИмяКоманды) Экспорт
	
	КлассРеализации = мИсполнителиКоманд[ИмяКоманды];
	Если КлассРеализации = Неопределено Тогда
		ВызватьИсключение "Неверная операция. Команда '"+ИмяКоманды+"' не предусмотрена";
	КонецЕсли;
	
	Возврат КлассРеализации;
	
КонецФункции

Функция ВыполнитьКоманду(Знач ИмяКоманды, Знач ПараметрыКоманды) Экспорт
	
	Команда = ПолучитьКоманду(ИмяКоманды);

    РезультатКоманды = Команда.ВыполнитьКоманду(ПараметрыКоманды);
	Если РезультатКоманды = Неопределено Тогда
		РезультатКоманды = 0;
	КонецЕсли;

	Возврат РезультатКоманды;

КонецФункции

Процедура ДобавитьКоманду(Знач ИмяКоманды, Знач КлассРеализации, Знач Парсер)
	
	РеализацияКоманды = Новый(КлассРеализации);
	РеализацияКоманды.ЗарегистрироватьКоманду(ИмяКоманды, Парсер);
	мИсполнителиКоманд.Вставить(ИмяКоманды, РеализацияКоманды);

КонецПроцедуры

Процедура ПоказатьСправкуПоКомандам() Экспорт
	ВыполнитьКоманду("help", Новый Соответствие);
КонецПроцедуры