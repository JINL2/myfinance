import '../database.dart';

class CashierAmountLinesTable extends SupabaseTable<CashierAmountLinesRow> {
  @override
  String get tableName => 'cashier_amount_lines';

  @override
  CashierAmountLinesRow createRow(Map<String, dynamic> data) =>
      CashierAmountLinesRow(data);
}

class CashierAmountLinesRow extends SupabaseDataRow {
  CashierAmountLinesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CashierAmountLinesTable();

  String get lineId => getField<String>('line_id')!;
  set lineId(String value) => setField<String>('line_id', value);

  String get companyId => getField<String>('company_id')!;
  set companyId(String value) => setField<String>('company_id', value);

  String? get storeId => getField<String>('store_id');
  set storeId(String? value) => setField<String>('store_id', value);

  String get locationId => getField<String>('location_id')!;
  set locationId(String value) => setField<String>('location_id', value);

  String get currencyId => getField<String>('currency_id')!;
  set currencyId(String value) => setField<String>('currency_id', value);

  DateTime get recordDate => getField<DateTime>('record_date')!;
  set recordDate(DateTime value) => setField<DateTime>('record_date', value);

  double get denomination => getField<double>('denomination')!;
  set denomination(double value) => setField<double>('denomination', value);

  int get quantity => getField<int>('quantity')!;
  set quantity(int value) => setField<int>('quantity', value);

  double get bookRate => getField<double>('book_rate')!;
  set bookRate(double value) => setField<double>('book_rate', value);

  double? get totalLocal => getField<double>('total_local');
  set totalLocal(double? value) => setField<double>('total_local', value);

  double? get totalBook => getField<double>('total_book');
  set totalBook(double? value) => setField<double>('total_book', value);

  String get createdBy => getField<String>('created_by')!;
  set createdBy(String value) => setField<String>('created_by', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
