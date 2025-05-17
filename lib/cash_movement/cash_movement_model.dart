import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cash_movement_widget.dart' show CashMovementWidget;
import 'package:flutter/material.dart';

class CashMovementModel extends FlutterFlowModel<CashMovementWidget> {
  ///  Local state fields for this page.

  List<TransactionDetailStruct> transactionDetail = [];
  void addToTransactionDetail(TransactionDetailStruct item) =>
      transactionDetail.add(item);
  void removeFromTransactionDetail(TransactionDetailStruct item) =>
      transactionDetail.remove(item);
  void removeAtIndexFromTransactionDetail(int index) =>
      transactionDetail.removeAt(index);
  void insertAtIndexInTransactionDetail(
          int index, TransactionDetailStruct item) =>
      transactionDetail.insert(index, item);
  void updateTransactionDetailAtIndex(
          int index, Function(TransactionDetailStruct) updateFn) =>
      transactionDetail[index] = updateFn(transactionDetail[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
