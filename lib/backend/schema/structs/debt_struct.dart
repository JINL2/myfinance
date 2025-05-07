// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DebtStruct extends BaseStruct {
  DebtStruct({
    String? counterpartyId,
    String? direction,
    String? category,
    String? accountId,
    int? originalAmount,
    double? interestRate,
    String? interestAccountId,
    String? interestDueDay,
    String? issueDate,
    String? dueDate,
    String? status,
    String? description,
    String? counterpartyStoreId,
  })  : _counterpartyId = counterpartyId,
        _direction = direction,
        _category = category,
        _accountId = accountId,
        _originalAmount = originalAmount,
        _interestRate = interestRate,
        _interestAccountId = interestAccountId,
        _interestDueDay = interestDueDay,
        _issueDate = issueDate,
        _dueDate = dueDate,
        _status = status,
        _description = description,
        _counterpartyStoreId = counterpartyStoreId;

  // "counterparty_id" field.
  String? _counterpartyId;
  String get counterpartyId => _counterpartyId ?? '';
  set counterpartyId(String? val) => _counterpartyId = val;

  bool hasCounterpartyId() => _counterpartyId != null;

  // "direction" field.
  String? _direction;
  String get direction => _direction ?? '';
  set direction(String? val) => _direction = val;

  bool hasDirection() => _direction != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "account_id" field.
  String? _accountId;
  String get accountId => _accountId ?? '';
  set accountId(String? val) => _accountId = val;

  bool hasAccountId() => _accountId != null;

  // "original_amount" field.
  int? _originalAmount;
  int get originalAmount => _originalAmount ?? 0;
  set originalAmount(int? val) => _originalAmount = val;

  void incrementOriginalAmount(int amount) =>
      originalAmount = originalAmount + amount;

  bool hasOriginalAmount() => _originalAmount != null;

  // "interest_rate" field.
  double? _interestRate;
  double get interestRate => _interestRate ?? 0.0;
  set interestRate(double? val) => _interestRate = val;

  void incrementInterestRate(double amount) =>
      interestRate = interestRate + amount;

  bool hasInterestRate() => _interestRate != null;

  // "interest_account_id" field.
  String? _interestAccountId;
  String get interestAccountId => _interestAccountId ?? '';
  set interestAccountId(String? val) => _interestAccountId = val;

  bool hasInterestAccountId() => _interestAccountId != null;

  // "interest_due_day" field.
  String? _interestDueDay;
  String get interestDueDay => _interestDueDay ?? '';
  set interestDueDay(String? val) => _interestDueDay = val;

  bool hasInterestDueDay() => _interestDueDay != null;

  // "issue_date" field.
  String? _issueDate;
  String get issueDate => _issueDate ?? '';
  set issueDate(String? val) => _issueDate = val;

  bool hasIssueDate() => _issueDate != null;

  // "due_date" field.
  String? _dueDate;
  String get dueDate => _dueDate ?? '';
  set dueDate(String? val) => _dueDate = val;

  bool hasDueDate() => _dueDate != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "counterparty_store_id" field.
  String? _counterpartyStoreId;
  String get counterpartyStoreId => _counterpartyStoreId ?? '';
  set counterpartyStoreId(String? val) => _counterpartyStoreId = val;

  bool hasCounterpartyStoreId() => _counterpartyStoreId != null;

  static DebtStruct fromMap(Map<String, dynamic> data) => DebtStruct(
        counterpartyId: data['counterparty_id'] as String?,
        direction: data['direction'] as String?,
        category: data['category'] as String?,
        accountId: data['account_id'] as String?,
        originalAmount: castToType<int>(data['original_amount']),
        interestRate: castToType<double>(data['interest_rate']),
        interestAccountId: data['interest_account_id'] as String?,
        interestDueDay: data['interest_due_day'] as String?,
        issueDate: data['issue_date'] as String?,
        dueDate: data['due_date'] as String?,
        status: data['status'] as String?,
        description: data['description'] as String?,
        counterpartyStoreId: data['counterparty_store_id'] as String?,
      );

  static DebtStruct? maybeFromMap(dynamic data) =>
      data is Map ? DebtStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'counterparty_id': _counterpartyId,
        'direction': _direction,
        'category': _category,
        'account_id': _accountId,
        'original_amount': _originalAmount,
        'interest_rate': _interestRate,
        'interest_account_id': _interestAccountId,
        'interest_due_day': _interestDueDay,
        'issue_date': _issueDate,
        'due_date': _dueDate,
        'status': _status,
        'description': _description,
        'counterparty_store_id': _counterpartyStoreId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'counterparty_id': serializeParam(
          _counterpartyId,
          ParamType.String,
        ),
        'direction': serializeParam(
          _direction,
          ParamType.String,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'account_id': serializeParam(
          _accountId,
          ParamType.String,
        ),
        'original_amount': serializeParam(
          _originalAmount,
          ParamType.int,
        ),
        'interest_rate': serializeParam(
          _interestRate,
          ParamType.double,
        ),
        'interest_account_id': serializeParam(
          _interestAccountId,
          ParamType.String,
        ),
        'interest_due_day': serializeParam(
          _interestDueDay,
          ParamType.String,
        ),
        'issue_date': serializeParam(
          _issueDate,
          ParamType.String,
        ),
        'due_date': serializeParam(
          _dueDate,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'counterparty_store_id': serializeParam(
          _counterpartyStoreId,
          ParamType.String,
        ),
      }.withoutNulls;

  static DebtStruct fromSerializableMap(Map<String, dynamic> data) =>
      DebtStruct(
        counterpartyId: deserializeParam(
          data['counterparty_id'],
          ParamType.String,
          false,
        ),
        direction: deserializeParam(
          data['direction'],
          ParamType.String,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        accountId: deserializeParam(
          data['account_id'],
          ParamType.String,
          false,
        ),
        originalAmount: deserializeParam(
          data['original_amount'],
          ParamType.int,
          false,
        ),
        interestRate: deserializeParam(
          data['interest_rate'],
          ParamType.double,
          false,
        ),
        interestAccountId: deserializeParam(
          data['interest_account_id'],
          ParamType.String,
          false,
        ),
        interestDueDay: deserializeParam(
          data['interest_due_day'],
          ParamType.String,
          false,
        ),
        issueDate: deserializeParam(
          data['issue_date'],
          ParamType.String,
          false,
        ),
        dueDate: deserializeParam(
          data['due_date'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        counterpartyStoreId: deserializeParam(
          data['counterparty_store_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DebtStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DebtStruct &&
        counterpartyId == other.counterpartyId &&
        direction == other.direction &&
        category == other.category &&
        accountId == other.accountId &&
        originalAmount == other.originalAmount &&
        interestRate == other.interestRate &&
        interestAccountId == other.interestAccountId &&
        interestDueDay == other.interestDueDay &&
        issueDate == other.issueDate &&
        dueDate == other.dueDate &&
        status == other.status &&
        description == other.description &&
        counterpartyStoreId == other.counterpartyStoreId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        counterpartyId,
        direction,
        category,
        accountId,
        originalAmount,
        interestRate,
        interestAccountId,
        interestDueDay,
        issueDate,
        dueDate,
        status,
        description,
        counterpartyStoreId
      ]);
}

DebtStruct createDebtStruct({
  String? counterpartyId,
  String? direction,
  String? category,
  String? accountId,
  int? originalAmount,
  double? interestRate,
  String? interestAccountId,
  String? interestDueDay,
  String? issueDate,
  String? dueDate,
  String? status,
  String? description,
  String? counterpartyStoreId,
}) =>
    DebtStruct(
      counterpartyId: counterpartyId,
      direction: direction,
      category: category,
      accountId: accountId,
      originalAmount: originalAmount,
      interestRate: interestRate,
      interestAccountId: interestAccountId,
      interestDueDay: interestDueDay,
      issueDate: issueDate,
      dueDate: dueDate,
      status: status,
      description: description,
      counterpartyStoreId: counterpartyStoreId,
    );
