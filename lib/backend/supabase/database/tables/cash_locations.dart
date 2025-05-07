import '../database.dart';

class CashLocationsTable extends SupabaseTable<CashLocationsRow> {
  @override
  String get tableName => 'cash_locations';

  @override
  CashLocationsRow createRow(Map<String, dynamic> data) =>
      CashLocationsRow(data);
}

class CashLocationsRow extends SupabaseDataRow {
  CashLocationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CashLocationsTable();

  String get locationId => getField<String>('location_id')!;
  set locationId(String value) => setField<String>('location_id', value);

  String get companyId => getField<String>('company_id')!;
  set companyId(String value) => setField<String>('company_id', value);

  String? get storeId => getField<String>('store_id');
  set storeId(String? value) => setField<String>('store_id', value);

  String get locationName => getField<String>('location_name')!;
  set locationName(String value) => setField<String>('location_name', value);

  String get locationType => getField<String>('location_type')!;
  set locationType(String value) => setField<String>('location_type', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
