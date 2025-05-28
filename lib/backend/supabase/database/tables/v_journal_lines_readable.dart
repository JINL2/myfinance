import '../database.dart';

class VJournalLinesReadableTable
    extends SupabaseTable<VJournalLinesReadableRow> {
  @override
  String get tableName => 'v_journal_lines_readable';

  @override
  VJournalLinesReadableRow createRow(Map<String, dynamic> data) =>
      VJournalLinesReadableRow(data);
}

class VJournalLinesReadableRow extends SupabaseDataRow {
  VJournalLinesReadableRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VJournalLinesReadableTable();

  DateTime? get entryDate => getField<DateTime>('entry_date');
  set entryDate(DateTime? value) => setField<DateTime>('entry_date', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);

  String? get storeName => getField<String>('store_name');
  set storeName(String? value) => setField<String>('store_name', value);

  String? get accountName => getField<String>('account_name');
  set accountName(String? value) => setField<String>('account_name', value);

  String? get cashLocationName => getField<String>('cash_location_name');
  set cashLocationName(String? value) =>
      setField<String>('cash_location_name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  double? get debit => getField<double>('debit');
  set debit(double? value) => setField<double>('debit', value);

  double? get credit => getField<double>('credit');
  set credit(double? value) => setField<double>('credit', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get journalType => getField<String>('journal_type');
  set journalType(String? value) => setField<String>('journal_type', value);
}
