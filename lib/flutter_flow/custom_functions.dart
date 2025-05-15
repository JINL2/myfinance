import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

int? companyCount(List? myCompanies) {
  if (myCompanies == null) return 0;
  return myCompanies.length;
}

/// findstorename
String? getStoreNameByIdFromList(
  List<StoresStruct>? dataInput,
  String? storeId,
) {
  if (dataInput == null) return null;

  for (final store in dataInput) {
    if (store.storeId == storeId) {
      return store.storeName;
    }
  }

  return null;
}

dynamic convertListToJson(List<String> items) {
  if (items == null) return [];
  return jsonDecode(jsonEncode(items));
}

List<String> cleanStringList(List<String> inputList) {
  return inputList.map((item) {
    // 양쪽 쌍따옴표 제거
    return item.replaceAll(RegExp(r'^"|"$'), '');
  }).toList();
}

List<String> convertJsonToList(dynamic jsonItems) {
  if (jsonItems == null) return [];

  // JSON이 List가 아닌 경우 대비
  if (jsonItems is! List) {
    return [];
  }

  // 각 항목을 String으로 캐스팅
  return jsonItems.map((item) => item.toString()).toList();
}

bool? isListHave(
  String? item,
  List<dynamic>? list,
) {
  if (list == null || item == null) return false;

  // list가 List<dynamic>이면 List<String>으로 변환
  List<String> stringList = List<String>.from(list);

  return stringList.contains(item);
}

double convertToInt(String stringSalaryAmount) {
  return double.tryParse(stringSalaryAmount) ?? 0;
}

String? formatNumberWithComma(double? number) {
  if (number == null) return '';
  return number.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]},',
      );
}

String? formatTimeOnly(DateTime? time) {
  if (time == null) return '시간 없음';
  return DateFormat('hh:mm a').format(time);
}

String? formatTimeForSupabase(DateTime? time) {
  if (time == null) return '00:00:00';
  return DateFormat('HH:mm:ss').format(time);
}

List<CalendarDayStruct> getCalendarForMonth(DateTime inputDate) {
  List<CalendarDayStruct> calendar = [];

  // Start by finding the first day of the current month
  DateTime firstOfMonth = DateTime(inputDate.year, inputDate.month, 1);

  // Find the last day of the current month
  DateTime lastOfMonth = DateTime(inputDate.year, inputDate.month + 1, 0);

  // Find the first Monday on or before the first of the month
  DateTime startCalendar =
      firstOfMonth.subtract(Duration(days: firstOfMonth.weekday - 1));

  // Find the last Sunday after the end of the month
  DateTime endCalendar = lastOfMonth.weekday == 7
      ? lastOfMonth
      : lastOfMonth.add(Duration(days: 7 - lastOfMonth.weekday));

  // Populate the calendar
  for (DateTime date = startCalendar;
      date.isBefore(endCalendar.add(Duration(days: 1)));
      date = date.add(Duration(days: 1))) {
    bool isPreviousMonth = date.isBefore(firstOfMonth);
    bool isNextMonth = date.isAfter(lastOfMonth);

    CalendarDayStruct dayStruct = CalendarDayStruct(
        calendarDate: date,
        isPreviousMonth: isPreviousMonth,
        isNextMonth: isNextMonth);

    calendar.add(dayStruct);
  }

  return calendar;
}

/// findstorename
String? getAccountNameByIdFromList(
  List<FinanceAccountStruct>? dataInput,
  String? accountId,
) {
  if (dataInput == null || accountId == null) return null;

  for (final account in dataInput) {
    if (account.accountId == accountId) {
      return account.accountName;
    }
  }

  return null;
}

DateTime getLastMonthDateTime(DateTime inputDate) {
  int year = inputDate.year;
  int month = inputDate.month;

  if (month == 1) {
    year--;
    month = 12;
  } else {
    month--;
  }
  return DateTime(year, month);
}

double getTotalCredit(List<dynamic> transactionDetail) {
  double totalCredit = 0;

  for (final item in transactionDetail) {
    if (item is Map<String, dynamic>) {
      final value = item['credit'];
      double credit = 0.0;

      if (value != null) {
        if (value is String) {
          credit = double.tryParse(value) ?? 0.0;
        } else if (value is int) {
          credit = value.toDouble();
        } else if (value is double) {
          credit = value;
        }
      }

      totalCredit += credit;
    }
  }

  return totalCredit;
}

DateTime getNextMonthDateTime(DateTime inputDate) {
  int year = inputDate.year;
  int month = inputDate.month;

  if (month == 12) {
    year++;
    month = 1;
  } else {
    month++;
  }
  return DateTime(year, month);
}

List<dynamic>? removeFromList(
  List<dynamic> originalList,
  String? requestId,
  String? fieldName,
) {
  if (originalList == null || fieldName == null || requestId == null) {
    return [];
  }

  return originalList.where((item) {
    final value = item[fieldName]?.toString(); // 필드 이름도 동적으로 접근
    return value != requestId;
  }).toList();
}

List<dynamic>? mergeJsonListsRemoveDuplicates(
  dynamic existingList,
  dynamic newList,
  String? keyField,
) {
  final Map<dynamic, Map<String, dynamic>> uniqueMap = {};

  // 기존 리스트 넣기
  for (var item in existingList) {
    uniqueMap[item[keyField]] = item;
  }

  // 새로운 리스트 넣기 (덮어쓰기 방식)
  for (var item in newList) {
    uniqueMap[item[keyField]] = item;
  }

  // 결과값: 중복 없는 리스트 반환
  return uniqueMap.values.toList();
}

double getTotalDebit(List<dynamic> transactionDetail) {
  double totalDebit = 0;

  for (final item in transactionDetail) {
    dynamic value = item['debit'];
    double debit = 0.0;

    if (value != null) {
      if (value is String) {
        debit = double.tryParse(value) ?? 0.0;
      } else if (value is int) {
        debit = value.toDouble();
      } else if (value is double) {
        debit = value;
      }
    }

    totalDebit += debit;
  }

  return totalDebit;
}

List<String> getUniqueDatesFromShiftList(List shiftList) {
  final uniqueDates = <String>{}; // set을 이용해 중복 제거
  for (final shift in shiftList) {
    uniqueDates.add(shift.requestDate); // 날짜만 추출
  }
  return uniqueDates.toList()..sort(); // 정렬도 해줌 (옵션)
}

int? countIfApproved(
  List? list,
  DateTime? dateAndTime,
  String? storeId,
) {
  if (list == null || dateAndTime == null || storeId == null) {
    return 0;
  }

  final filteredList = list.where((item) {
    final isSameDate =
        item.requestDate == DateFormat('yyyy-MM-dd').format(dateAndTime);
    final isSameStore = item.storeId == storeId;
    return isSameDate && isSameStore && item.isApproved == true;
  }).toList();

  return filteredList.length;
}

String? changeDateTimeToString(DateTime? dateTime) {
  if (dateTime == null) return null;
  return DateFormat('yyyy-MM-dd').format(dateTime);
}

int? hRcomparison(
  int? requiredHRNumber,
  int? currentHRNumber,
) {
  if (requiredHRNumber == null || currentHRNumber == null) {
    return null;
  }

  return requiredHRNumber - currentHRNumber;
}

DateTime? changeStringToDateTime(String? date) {
  if (date == null || date.isEmpty) {
    return null; // 입력이 null 또는 빈 문자열일 경우 null 반환
  }

  try {
    // 문자열이 시간만 있는 경우, 현재 날짜와 결합하여 DateTime으로 변환
    if (date.length == 8) {
      // 현재 날짜를 가져와서 시간과 결합
      String currentDate = DateTime.now()
          .toIso8601String()
          .substring(0, 10); // 현재 날짜 (예: "2025-05-05")
      date = "$currentDate $date"; // 현재 날짜와 시간 결합 (예: "2025-05-05 16:00:00")
    }

    return DateTime.tryParse(date); // 결합된 문자열을 DateTime으로 변환
  } catch (e) {
    return null; // 변환 실패 시 null 반환
  }
}

int? simplePlus(
  int? inputNumber,
  int? plusHowMany,
) {
  if (inputNumber == null || plusHowMany == null) return null;
  return inputNumber + plusHowMany;
}

List<CompaniesStruct>? addtoListInUserCompanyStore(
  List<StoresStruct>? inputStoreData,
  UserStruct? inputUserData,
  String? inputCompanyid,
) {
  if (inputStoreData == null ||
      inputUserData == null ||
      inputCompanyid == null) {
    return null;
  }

  final companies = inputUserData.companies;

  return companies.map((company) {
    if (company.companyId == inputCompanyid) {
      final updatedStores = [...company.stores, ...inputStoreData];
      return CompaniesStruct(
        companyId: company.companyId,
        companyName: company.companyName,
        companyCode: company.companyCode,
        storeCount: updatedStores.length,
        role: company.role,
        stores: updatedStores,
      );
    }
    return company;
  }).toList();
}

bool? isListHaveString(
  String? item,
  List<String>? list,
) {
  if (list == null || item == null) return false;

  final set = list.toSet(); // 리스트 → Set으로 변환 (O(n), 한 번만)
  return set.contains(item); // 이후 O(1) 탐색
}

bool? isListHaveDatatypeList(
  String? string,
  List<ShiftMetaDataStruct>? datatype,
) {
  if (string == null || datatype == null) return false;

  // store_id 필드를 비교
  return datatype.any((e) => e.storeId == string);
}

String? changeLocationToString(LatLng? location) {
  if (location == null) return null;
  return 'POINT(${location.longitude} ${location.latitude})';
}

bool managerShiftIsHaveData(
  List<ManagerShiftDetailStruct>? managerShiftList,
  String? requestDate,
  String? shiftId,
  String? userId,
  String? storeId,
) {
  if (managerShiftList == null ||
      requestDate == null ||
      shiftId == null ||
      userId == null ||
      storeId == null) return false;

  for (final detail in managerShiftList) {
    if (detail.requestDate != requestDate || detail.storeId != storeId)
      continue;

    for (final shift in detail.shifts) {
      if (shift.shiftId != shiftId) continue;

      final pending = shift.pendingEmployees ?? [];
      final approved = shift.approvedEmployees ?? [];

      final foundInPending = pending.any((e) => e.userId == userId);
      final foundInApproved = approved.any((e) => e.userId == userId);

      if (foundInPending || foundInApproved) return true;
    }
  }

  return false;
}

bool isAnyApprovedForDate(
  List<ShiftStatusStruct>? shiftStatus,
  String? requestDate,
) {
  /// null 값 예외 처리
  if (shiftStatus == null ||
      shiftStatus.isEmpty ||
      requestDate == null ||
      requestDate.isEmpty) {
    return false;
  }

  for (final shift in shiftStatus) {
    if (shift == null) continue;

    final date = shift.requestDate;
    final isApproved = shift.isApproved ?? false;

    if (date == requestDate && isApproved) {
      return true;
    }
  }

  return false;
}

int checkAmountDebitCredit(
  List<TransactionDetailStruct>? list,
  String? debitOrCredit,
) {
  if (list == null || debitOrCredit == null) return 0;

  int count = 0;

  for (final item in list) {
    if (item == null) continue;

    final value = debitOrCredit == 'debit' ? item.debit : item.credit;

    if (value != null && value != '0') {
      count++;
    }
  }

  return count;
}

String? combineSystimeWithMunite(
  String? systemTime,
  String? munite,
) {
  if (systemTime == null) return null;

  try {
    final minuteValue =
        (munite == null || munite.isEmpty) ? 0 : int.parse(munite);

    final inputFormat = DateFormat('HH:mm:ss');
    final outputFormat = DateFormat('HH:mm');

    final baseTime = inputFormat.parse(systemTime);
    final newTime = baseTime.add(Duration(minutes: minuteValue));

    return outputFormat.format(newTime);
  } catch (e) {
    return null;
  }
}

int? extratimeIntCalculator(
  String? systemTime,
  DateTime? dateTime,
) {
  if (systemTime == null || dateTime == null) return null;

  try {
    final format = DateFormat('HH:mm:ss');
    final baseTime = format.parse(systemTime);

    final nowTime = DateTime(2000, 1, 1, dateTime.hour, dateTime.minute, 0);
    final compareTime = DateTime(2000, 1, 1, baseTime.hour, baseTime.minute, 0);

    final diff = nowTime.difference(compareTime);

    return diff.inMinutes;
  } catch (e) {
    return null;
  }
}

String? simplePlusString(
  String? plusData1,
  String? plusData2,
) {
  try {
    final num1 =
        (plusData1 == null || plusData1.isEmpty) ? 0 : int.parse(plusData1);
    final num2 =
        (plusData2 == null || plusData2.isEmpty) ? 0 : int.parse(plusData2);

    final sum = num1 + num2;

    return sum.toString();
  } catch (e) {
    return null;
  }
}

bool? isListcashAmountSupa(
  List<CashierAmountLinesRow>? cashAmountList,
  String? currencyId,
) {
  if (cashAmountList == null || currencyId == null) {
    return false;
  }

  return cashAmountList.any((row) => row.currencyId == currencyId);
}

dynamic mapTransactionDetailtoObject(List<TransactionDetailStruct> list) {
  return list
      .map((item) => {
            "account_id": item.accountId,
            "description": item.description,
            "debit": item.debit,
            "credit": item.credit,
            "counterparty_id": item.counterpartyId,
            "amount": item.amount,
            if (item.cash != null &&
                item.cash.cashLocationId != null &&
                item.cash.cashLocationId != "")
              "cash": {"cash_location_id": item.cash.cashLocationId}
          })
      .toList();
}

bool? isListHaveDenomination(
  List<CurrencyDenominationsRow>? currnecyDenominationSupabase,
  int? value,
) {
  if (currnecyDenominationSupabase == null || value == null) {
    return false;
  }

  return currnecyDenominationSupabase.any((row) => row.value == value);
}

bool? isListHaveDenominationDatatype(
  List<DenominationsStruct>? denominations,
  String? denominationId,
) {
  if (denominations == null || denominationId == null) return false;

  final denominationSet = denominations
      .map((item) => item.denominationId)
      .whereType<String>() // null 값 제거
      .toSet();

  return denominationSet.contains(denominationId);
}

List<DenominationsStruct>? removeValuefromDenominationData(
  String? denominationId,
  int? value,
  List<DenominationsStruct>? denominationInput,
) {
  if (denominationId == null || value == null || denominationInput == null) {
    return denominationInput;
  }

  return denominationInput.map((item) {
    if (item.denominationId == denominationId) {
      return DenominationsStruct(
        denominationId: item.denominationId,
        quantity: value,
      );
    }
    return item;
  }).toList();
}

bool? isListHaveCurrnencies(
  List<CurrenciesStruct>? currenciesDataType,
  String? currencyId,
) {
  if (currenciesDataType == null || currencyId == null) return false;

  final currencyIdSet = currenciesDataType
      .map((item) => item.currencyId)
      .whereType<String>() // null 안전 처리
      .toSet();

  return currencyIdSet.contains(currencyId);
}

List<CurrenciesStruct>? removeCurrencies(
  List<CurrenciesStruct>? initialData,
  String? currencyId,
  CurrenciesStruct? inputData,
) {
  if (initialData == null || currencyId == null || inputData == null)
    return null;

  final updatedList =
      initialData.where((item) => item.currencyId != currencyId).toList();

  updatedList.add(inputData);

  return updatedList;
}

dynamic mapListDatatoJsonb(List<CurrenciesStruct> list) {
  return list
      .map((currency) => {
            "currency_id": currency.currencyId,
            "denominations": currency.denominations
                .map((denom) => {
                      "denomination_id": denom.denominationId,
                      "quantity": denom.quantity
                    })
                .toList()
          })
      .toList();
}

bool? isListHaveCurrnecyid(
  List<CompanyCurrencyRow>? supabaseCurrency,
  String? currencyId,
) {
  if (supabaseCurrency == null || currencyId == null) {
    return false;
  }

  return supabaseCurrency.any((row) => row.currencyId == currencyId);
}
