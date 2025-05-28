import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Roles Group Code

class RolesGroup {
  static String getBaseUrl() =>
      'https://atkekzwgukdvucqntryo.supabase.co/rest/v1/rpc';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
  };
  static CreateRoleCall createRoleCall = CreateRoleCall();
  static UpdateRoleCall updateRoleCall = UpdateRoleCall();
  static DeleteRoleCall deleteRoleCall = DeleteRoleCall();
}

class CreateRoleCall {
  Future<ApiCallResponse> call({
    String? pCompanyId = '',
    String? pRoleName = '',
    String? pRoleType = '',
    dynamic pPermissionsJson,
  }) async {
    final baseUrl = RolesGroup.getBaseUrl();

    final pPermissions = _serializeJson(pPermissionsJson);
    final ffApiRequestBody = '''
{"p_company_id" : "${escapeStringForJson(pCompanyId)}",
 "p_permissions" :  ${pPermissions},
 "p_role_name" : "${escapeStringForJson(pRoleName)}",
 "p_role_type" : "${escapeStringForJson(pRoleType)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Role',
      apiUrl: '${baseUrl}/create_role',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateRoleCall {
  Future<ApiCallResponse> call({
    String? pRoleId = '',
    String? pRoleName = '',
    String? pRoleType = '',
    dynamic pPermissionsJson,
    String? pCompanyId = '',
  }) async {
    final baseUrl = RolesGroup.getBaseUrl();

    final pPermissions = _serializeJson(pPermissionsJson);
    final ffApiRequestBody = '''
{
  "p_company_id" : "${escapeStringForJson(pCompanyId)}",
  "p_permissions" : ${pPermissions},
  "p_role_id": "${escapeStringForJson(pRoleId)}",
  "p_role_name": "${escapeStringForJson(pRoleName)}",
  "p_role_type" : "${escapeStringForJson(pRoleType)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Role',
      apiUrl: '${baseUrl}/update_role',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteRoleCall {
  Future<ApiCallResponse> call({
    String? pRoleId = '',
  }) async {
    final baseUrl = RolesGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "p_role_id": "${escapeStringForJson(pRoleId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Role',
      apiUrl: '${baseUrl}/delete_role',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Roles Group Code

/// Start deleteData Group Code

class DeleteDataGroup {
  static String getBaseUrl() =>
      'https://atkekzwgukdvucqntryo.supabase.co/rest/v1/rpc';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
  };
  static DeleteowneruserCall deleteowneruserCall = DeleteowneruserCall();
  static DeleteemployeeuserCall deleteemployeeuserCall =
      DeleteemployeeuserCall();
  static FireemployeeCall fireemployeeCall = FireemployeeCall();
  static DeletecompanyCall deletecompanyCall = DeletecompanyCall();
  static DeletestoreCall deletestoreCall = DeletestoreCall();
  static LeavecompanyCall leavecompanyCall = LeavecompanyCall();
}

class DeleteowneruserCall {
  Future<ApiCallResponse> call({
    String? pUserId = '',
  }) async {
    final baseUrl = DeleteDataGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "p_user_id": "${escapeStringForJson(pUserId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'deleteowneruser',
      apiUrl: '${baseUrl}/delete_owner_user',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteemployeeuserCall {
  Future<ApiCallResponse> call({
    String? pUserId = '',
  }) async {
    final baseUrl = DeleteDataGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "p_user_id": "${escapeStringForJson(pUserId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'deleteemployeeuser',
      apiUrl: '${baseUrl}/delete_employee_user',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FireemployeeCall {
  Future<ApiCallResponse> call({
    String? pUserId = '',
    String? pCompanyId = '',
  }) async {
    final baseUrl = DeleteDataGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "p_user_id": "${escapeStringForJson(pUserId)}",
  "p_company_id" :  "${escapeStringForJson(pCompanyId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'fireemployee',
      apiUrl: '${baseUrl}/fire_employee',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeletecompanyCall {
  Future<ApiCallResponse> call({
    String? pCompanyId = '',
  }) async {
    final baseUrl = DeleteDataGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "p_company_id" :  "${escapeStringForJson(pCompanyId)}"

}''';
    return ApiManager.instance.makeApiCall(
      callName: 'deletecompany',
      apiUrl: '${baseUrl}/delete_company',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeletestoreCall {
  Future<ApiCallResponse> call({
    String? pStoreId = '',
  }) async {
    final baseUrl = DeleteDataGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "p_store_id": "${escapeStringForJson(pStoreId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'deletestore',
      apiUrl: '${baseUrl}/delete_store',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LeavecompanyCall {
  Future<ApiCallResponse> call({
    String? pUserId = '',
    String? pCompanyId = '',
  }) async {
    final baseUrl = DeleteDataGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "p_user_id": "${escapeStringForJson(pUserId)}",


  "p_company_id" : "${escapeStringForJson(pCompanyId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'leavecompany',
      apiUrl: '${baseUrl}/leave_company',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End deleteData Group Code

/// Start JournalEntry Group Code

class JournalEntryGroup {
  static String getBaseUrl({
    String? pCompanyId = '',
    String? pStoreId = '',
    String? pCreatedBy = '',
    String? pEntryDate = '',
    String? pDescription = '',
    double? pBaseAmount,
    dynamic pLinesJson,
    String? pJournalType = '',
    String? pApprovedBy = '',
  }) =>
      'https://atkekzwgukdvucqntryo.supabase.co/rest/v1/rpc/';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
    'Content-Type': 'application/json',
  };
  static InsertJournalCall insertJournalCall = InsertJournalCall();
  static InsertDebtJounralCall insertDebtJounralCall = InsertDebtJounralCall();
  static InsertjournalwitheverythingCall insertjournalwitheverythingCall =
      InsertjournalwitheverythingCall();
}

class InsertJournalCall {
  Future<ApiCallResponse> call({
    String? pCompanyId = '',
    String? pStoreId = '',
    String? pCreatedBy = '',
    String? pEntryDate = '',
    String? pDescription = '',
    double? pBaseAmount,
    dynamic pLinesJson,
    String? pJournalType = '',
    String? pApprovedBy = '',
  }) async {
    final baseUrl = JournalEntryGroup.getBaseUrl(
      pCompanyId: pCompanyId,
      pStoreId: pStoreId,
      pCreatedBy: pCreatedBy,
      pEntryDate: pEntryDate,
      pDescription: pDescription,
      pBaseAmount: pBaseAmount,
      pLinesJson: pLinesJson,
      pJournalType: pJournalType,
      pApprovedBy: pApprovedBy,
    );

    final pLines = _serializeJson(pLinesJson, true);
    final ffApiRequestBody = '''
{
  "p_company_id": "${escapeStringForJson(pCompanyId)}",

  "p_store_id" : "${escapeStringForJson(pStoreId)}",

  "p_created_by" : "${escapeStringForJson(pCreatedBy)}",

  "p_entry_date" : "${escapeStringForJson(pEntryDate)}" ,

  "p_description" :  "${escapeStringForJson(pDescription)}",

 "p_base_amount" : ${pBaseAmount},

 "p_lines" : ${pLines}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'insertJournal',
      apiUrl: '${baseUrl}insert_journal_with_lines',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class InsertDebtJounralCall {
  Future<ApiCallResponse> call({
    String? pCompanyId = '',
    String? pStoreId = '',
    String? pCreatedBy = '',
    String? pEntryDate = '',
    String? pDescription = '',
    double? pBaseAmount,
    dynamic pLinesJson,
    String? pJournalType = '',
    String? pApprovedBy = '',
  }) async {
    final baseUrl = JournalEntryGroup.getBaseUrl(
      pCompanyId: pCompanyId,
      pStoreId: pStoreId,
      pCreatedBy: pCreatedBy,
      pEntryDate: pEntryDate,
      pDescription: pDescription,
      pBaseAmount: pBaseAmount,
      pLinesJson: pLinesJson,
      pJournalType: pJournalType,
      pApprovedBy: pApprovedBy,
    );

    final pLines = _serializeJson(pLinesJson, true);
    final ffApiRequestBody = '''
{
  "p_company_id": "${escapeStringForJson(pCompanyId)}",

  "p_store_id" : "${escapeStringForJson(pStoreId)}",

  "p_created_by" : "${escapeStringForJson(pCreatedBy)}",

  "p_entry_date" : "${escapeStringForJson(pEntryDate)}" ,

  "p_description" :  "${escapeStringForJson(pDescription)}",

 "p_base_amount" : ${pBaseAmount},

 "p_lines" : ${pLines}


}''';
    return ApiManager.instance.makeApiCall(
      callName: 'insertDebtJounral',
      apiUrl: '${baseUrl}insert_debt_with_journal',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class InsertjournalwitheverythingCall {
  Future<ApiCallResponse> call({
    String? pIfCashLocationId = '',
    String? pCounterpartyId = '',
    String? pCompanyId = '',
    String? pStoreId = '',
    String? pCreatedBy = '',
    String? pEntryDate = '',
    String? pDescription = '',
    double? pBaseAmount,
    dynamic pLinesJson,
    String? pJournalType = '',
    String? pApprovedBy = '',
  }) async {
    final baseUrl = JournalEntryGroup.getBaseUrl(
      pCompanyId: pCompanyId,
      pStoreId: pStoreId,
      pCreatedBy: pCreatedBy,
      pEntryDate: pEntryDate,
      pDescription: pDescription,
      pBaseAmount: pBaseAmount,
      pLinesJson: pLinesJson,
      pJournalType: pJournalType,
      pApprovedBy: pApprovedBy,
    );

    final pLines = _serializeJson(pLinesJson, true);
    final ffApiRequestBody = '''
{
  "p_base_amount": ${pBaseAmount},
  "p_company_id": "${escapeStringForJson(pCompanyId)}",
  "p_created_by": "${escapeStringForJson(pCreatedBy)}",
  "p_description": "${escapeStringForJson(pDescription)}",
  "p_entry_date": "${escapeStringForJson(pEntryDate)}",
  "p_lines": ${pLines},
  "p_counterparty_id" : "${escapeStringForJson(pCounterpartyId)}",
  "p_if_cash_location_id": "${escapeStringForJson(pIfCashLocationId)}",
  "p_store_id": "${escapeStringForJson(pStoreId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'insertjournalwitheverything',
      apiUrl: '${baseUrl}/insert_journal_with_everything',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End JournalEntry Group Code

/// Start accountMapping Group Code

class AccountMappingGroup {
  static String getBaseUrl({
    String? pMyCompanyId = '',
    String? pMyAccountId = '',
    String? pCounterpartyCompanyId = '',
    String? pLinkedAccountId = '',
    String? pDirection = '',
    String? pCreatedBy = '',
  }) =>
      'https://atkekzwgukdvucqntryo.supabase.co/rest/v1/rpc/';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
    'Content-Type': 'application/json',
  };
  static InsertAccountMappingCall insertAccountMappingCall =
      InsertAccountMappingCall();
  static CheckAccountMapCall checkAccountMapCall = CheckAccountMapCall();
}

class InsertAccountMappingCall {
  Future<ApiCallResponse> call({
    String? pMyCompanyId = '',
    String? pMyAccountId = '',
    String? pCounterpartyCompanyId = '',
    String? pLinkedAccountId = '',
    String? pDirection = '',
    String? pCreatedBy = '',
  }) async {
    final baseUrl = AccountMappingGroup.getBaseUrl(
      pMyCompanyId: pMyCompanyId,
      pMyAccountId: pMyAccountId,
      pCounterpartyCompanyId: pCounterpartyCompanyId,
      pLinkedAccountId: pLinkedAccountId,
      pDirection: pDirection,
      pCreatedBy: pCreatedBy,
    );

    final ffApiRequestBody = '''
{
  "p_my_company_id": "${escapeStringForJson(pMyCompanyId)}",
  "p_my_account_id": "${escapeStringForJson(pMyAccountId)}",
  "p_counterparty_company_id": "${escapeStringForJson(pCounterpartyCompanyId)}",
  "p_linked_account_id": "${escapeStringForJson(pLinkedAccountId)}",
  "p_direction": "${escapeStringForJson(pDirection)}",
  "p_created_by": "${escapeStringForJson(pCreatedBy)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'insertAccountMapping',
      apiUrl: '${baseUrl}insert_account_mapping_with_company',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CheckAccountMapCall {
  Future<ApiCallResponse> call({
    String? pMyCompanyId = '',
    String? pMyAccountId = '',
    String? pCounterpartyCompanyId = '',
    String? pLinkedAccountId = '',
    String? pDirection = '',
    String? pCreatedBy = '',
  }) async {
    final baseUrl = AccountMappingGroup.getBaseUrl(
      pMyCompanyId: pMyCompanyId,
      pMyAccountId: pMyAccountId,
      pCounterpartyCompanyId: pCounterpartyCompanyId,
      pLinkedAccountId: pLinkedAccountId,
      pDirection: pDirection,
      pCreatedBy: pCreatedBy,
    );

    final ffApiRequestBody = '''
{
  "p_my_account_id": "${escapeStringForJson(pMyAccountId)}",
  "p_counterparty_id": "${escapeStringForJson(pCounterpartyCompanyId)}",
  "p_my_company_id": "${escapeStringForJson(pMyCompanyId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'checkAccountMap',
      apiUrl: '${baseUrl}check_account_mapping_exists',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic ismapped(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

/// End accountMapping Group Code

class GetUserCompaniesCall {
  static Future<ApiCallResponse> call({
    String? pUserId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "p_user_id": "${escapeStringForJson(pUserId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getUserCompanies',
      apiUrl:
          'https://atkekzwgukdvucqntryo.supabase.co/rest/v1/rpc/get_user_companies_and_stores',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? userid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_id''',
      ));
  static String? username(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_name''',
      ));
  static int? compnycount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.company_count''',
      ));
  static List? companiesJson(dynamic response) => getJsonField(
        response,
        r'''$.companies''',
        true,
      ) as List?;
  static String? companiesId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.companies[:].company_id''',
      ));
  static int? companyStoreCount(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.companies[:].store_count''',
      ));
  static String? companyName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.companies[:].company_name''',
      ));
  static List<String>? storeId(dynamic response) => (getJsonField(
        response,
        r'''$.companies[:].stores[:].store_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class JoinUserByCodeCall {
  static Future<ApiCallResponse> call({
    String? pUserId = '',
    String? pCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "p_user_id": "${escapeStringForJson(pUserId)}",
  "p_code": "${escapeStringForJson(pCode)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'JoinUserByCode',
      apiUrl:
          'https://atkekzwgukdvucqntryo.supabase.co/rest/v1/rpc/join_user_by_code',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCategoriesWithFeaturesCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getCategoriesWithFeatures',
      apiUrl:
          'https://atkekzwgukdvucqntryo.supabase.co/rest/v1/rpc/get_categories_with_features',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? categoryId(dynamic response) => (getJsonField(
        response,
        r'''$[:].category_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? categoryName(dynamic response) => (getJsonField(
        response,
        r'''$[:].category_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? categoryFeatures(dynamic response) => getJsonField(
        response,
        r'''$[:].features''',
        true,
      ) as List?;
  static List<String>? featuresId(dynamic response) => (getJsonField(
        response,
        r'''$[:].features[:].feature_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? featuresName(dynamic response) => (getJsonField(
        response,
        r'''$[:].features[:].feature_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? featuresIcon(dynamic response) => (getJsonField(
        response,
        r'''$[:].features[:].icon''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? featureRoute(dynamic response) => (getJsonField(
        response,
        r'''$[:].features[:].route''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class UpdateUserSalaryCall {
  static Future<ApiCallResponse> call({
    String? pSalaryId = '',
    double? pSalaryAmount,
    String? pSalaryType = '',
    String? pCurrencyId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "p_salary_id": "${escapeStringForJson(pSalaryId)}",
  "p_salary_amount": ${pSalaryAmount},
  "p_salary_type": "${escapeStringForJson(pSalaryType)}",
  "p_currency_id": "${escapeStringForJson(pCurrencyId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateUserSalary',
      apiUrl:
          'https://atkekzwgukdvucqntryo.supabase.co/rest/v1/rpc/update_user_salary',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserShiftStatusCall {
  static Future<ApiCallResponse> call({
    String? pUserId = '',
    String? pStoreId = '',
    String? pRequestDate = '',
  }) async {
    final ffApiRequestBody = '''
{
  "p_user_id": "${escapeStringForJson(pUserId)}",

  "p_store_id" : "${escapeStringForJson(pStoreId)}",

  "p_request_date" : "${escapeStringForJson(pRequestDate)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getUserShiftStatus',
      apiUrl:
          'https://atkekzwgukdvucqntryo.supabase.co/rest/v1/rpc/get_monthly_shift_status',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? shiftId(dynamic response) => (getJsonField(
        response,
        r'''$[:].shift_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? requestDate(dynamic response) => (getJsonField(
        response,
        r'''$[:].request_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? totalRegistered(dynamic response) => (getJsonField(
        response,
        r'''$[:].total_registered''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<bool>? isRegisteredbyMe(dynamic response) => (getJsonField(
        response,
        r'''$[:].is_registered_by_me''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static List<String>? shiftRequestId(dynamic response) => (getJsonField(
        response,
        r'''$[:].shift_request_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<bool>? isApproved(dynamic response) => (getJsonField(
        response,
        r'''$[:].is_approved''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static int? totalOtherStaffs(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$[:].total_other_staffs''',
      ));
}

class GetshiftmetadataCall {
  static Future<ApiCallResponse> call({
    String? pStoreId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "p_store_id": "${escapeStringForJson(pStoreId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getshiftmetadata',
      apiUrl:
          'https://atkekzwgukdvucqntryo.supabase.co/rest/v1/rpc/get_shift_metadata',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BringFinanceAccountInfoCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'bringFinanceAccountInfo',
      apiUrl:
          'https://atkekzwgukdvucqntryo.supabase.co/rest/v1/accounts?select=account_id,account_name,account_type,expense_nature,category_tag',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? accountid(dynamic response) => (getJsonField(
        response,
        r'''$[:].account_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? accountName(dynamic response) => (getJsonField(
        response,
        r'''$[:].account_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? accountType(dynamic response) => (getJsonField(
        response,
        r'''$[:].account_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ToggleshiftapprovalCall {
  static Future<ApiCallResponse> call({
    List<String>? pShiftRequestIdsList,
    String? pUserId = '',
  }) async {
    final pShiftRequestIds = _serializeList(pShiftRequestIdsList);

    final ffApiRequestBody = '''
{
  "p_shift_request_ids": ${pShiftRequestIds},
  "p_user_id": "${escapeStringForJson(pUserId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'toggleshiftapproval',
      apiUrl:
          'https://atkekzwgukdvucqntryo.supabase.co/rest/v1/rpc/toggle_shift_approval',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetusernamesbystoreidCall {
  static Future<ApiCallResponse> call({
    String? pStoreId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "p_store_id": "${escapeStringForJson(pStoreId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getusernamesbystoreid',
      apiUrl:
          'https://atkekzwgukdvucqntryo.supabase.co/rest/v1/rpc/get_user_names_by_store_id',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? userId(dynamic response) => (getJsonField(
        response,
        r'''$[:].user_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? fullName(dynamic response) => (getJsonField(
        response,
        r'''$[:].full_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetManagerShiftCall {
  static Future<ApiCallResponse> call({
    String? pStoreId = '',
    String? pRequestDate = '',
  }) async {
    final ffApiRequestBody = '''
{
  "p_store_id": "${escapeStringForJson(pStoreId)}",
  "p_request_date": "${escapeStringForJson(pRequestDate)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetManagerShift',
      apiUrl:
          'https://atkekzwgukdvucqntryo.supabase.co/rest/v1/rpc/get_monthly_shift_status_manager',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetNotMyCounterPartyCall {
  static Future<ApiCallResponse> call({
    String? pUserId = '',
    String? pCompanyId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "p_user_id": "${escapeStringForJson(pUserId)}",


  "p_company_id" : "${escapeStringForJson(pCompanyId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetNotMyCounterParty',
      apiUrl:
          'https://atkekzwgukdvucqntryo.supabase.co/rest/v1/rpc/get_unlinked_companies',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? companyId(dynamic response) => (getJsonField(
        response,
        r'''$[:].company_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? companyName(dynamic response) => (getJsonField(
        response,
        r'''$[:].company_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class InsertCashLineCall {
  static Future<ApiCallResponse> call({
    String? pCompanyId = '',
    String? pStoreId = '',
    String? pLocationId = '',
    String? pRecordDate = '',
    dynamic pCurrenciesJson,
    String? pCreatedBy = '',
  }) async {
    final pCurrencies = _serializeJson(pCurrenciesJson);
    final ffApiRequestBody = '''
{
  "p_company_id":  "${escapeStringForJson(pCompanyId)}",

  "p_store_id" :  "${escapeStringForJson(pStoreId)}",


  "p_location_id" :  "${escapeStringForJson(pLocationId)}",




  "p_record_date" : "${escapeStringForJson(pRecordDate)}",

  "p_created_by" : "${escapeStringForJson(pCreatedBy)}",

   "p_currencies" : ${pCurrencies}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'insertCashLine',
      apiUrl:
          'https://atkekzwgukdvucqntryo.supabase.co/rest/v1/rpc/insert_cashier_amount_lines',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteCashAmountLineCall {
  static Future<ApiCallResponse> call({
    String? pCompanyId = '',
    String? pRecordDate = '',
  }) async {
    final ffApiRequestBody = '''
{
  "p_company_id": "${escapeStringForJson(pCompanyId)}",

  "p_record_date":"${escapeStringForJson(pRecordDate)}"

}''';
    return ApiManager.instance.makeApiCall(
      callName: 'deleteCashAmountLine',
      apiUrl:
          'https://atkekzwgukdvucqntryo.supabase.co/rest/v1/rpc/delete_null_store_cashier_lines',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateTamplateCall {
  static Future<ApiCallResponse> call({
    String? pCompanyId = '',
    String? pStoreId = '',
    String? pName = '',
    dynamic pDataJson,
  }) async {
    final pData = _serializeJson(pDataJson);
    final ffApiRequestBody = '''
{
  "p_company_id": "${escapeStringForJson(pCompanyId)}",


  "p_store_id" : "${escapeStringForJson(pStoreId)}",

  "p_name" :  "${escapeStringForJson(pName)}",

  "p_data" : ${pData}
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'createTamplate',
      apiUrl:
          'https://atkekzwgukdvucqntryo.supabase.co/rest/v1/rpc/insert_transaction_template',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateShiftReqeustStartCall {
  static Future<ApiCallResponse> call({
    String? pShiftRequestId = '',
    String? pActualStartTime,
    double? pStartLat,
    double? pStartLng,
  }) async {
    pActualStartTime ??= null;
    pStartLat ??= null;
    pStartLng ??= null;

    final ffApiRequestBody = '''
{
  "p_shift_request_id": "${escapeStringForJson(pShiftRequestId)}",
  "p_actual_start_time": "${escapeStringForJson(pActualStartTime)}",
  "p_start_lat": ${pStartLat},
  "p_start_lng": ${pStartLng}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateShiftReqeustStart',
      apiUrl:
          'https://atkekzwgukdvucqntryo.supabase.co/rest/v1/rpc/update_shift_request_start',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateShiftRequestsEndCall {
  static Future<ApiCallResponse> call({
    String? pShiftRequestId = '',
    String? pActualEndTime = '',
    double? pEndLat,
    double? pEndLng,
  }) async {
    final ffApiRequestBody = '''
{
  "p_shift_request_id": "${escapeStringForJson(pShiftRequestId)}",
  "p_actual_end_time": "${escapeStringForJson(pActualEndTime)}",
  "p_end_lat": ${pEndLat},
  "p_end_lng": ${pEndLng}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateShiftRequestsEnd',
      apiUrl:
          'https://atkekzwgukdvucqntryo.supabase.co/rest/v1/rpc/update_shift_request_end',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetBalanceDfiferencesCall {
  static Future<ApiCallResponse> call({
    String? storeId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getBalanceDfiferences',
      apiUrl:
          'https://atkekzwgukdvucqntryo.supabase.co/rest/v1/v_store_balance_summary?select=*&store_id=eq.${storeId}',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Range': '0-9',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? debit(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].total_debit''',
      ));
  static int? credit(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].total_credit''',
      ));
  static int? diff(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].balance_difference''',
      ));
}

class UpdateStoreLocationCall {
  static Future<ApiCallResponse> call({
    String? pStoreId = '',
    double? pStoreLat,
    double? pStoreLng,
  }) async {
    final ffApiRequestBody = '''
{
  "p_store_id": "${escapeStringForJson(pStoreId)}",
  "p_store_lat": ${pStoreLat},
  "p_store_lng": ${pStoreLng}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateStoreLocation',
      apiUrl:
          'https://atkekzwgukdvucqntryo.supabase.co/rest/v1/rpc/update_store_location',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BankAmountInsertCall {
  static Future<ApiCallResponse> call({
    String? pCompanyId = '',
    String? pStoreId,
    String? pRecordDate = '',
    String? pLocationId = '',
    String? pCurrencyId = '',
    int? pTotalAmount,
    String? pCreatedBy = '',
  }) async {
    pStoreId ??= null;

    final ffApiRequestBody = '''
{
  "p_company_id": "${escapeStringForJson(pCompanyId)}",
  "p_store_id": "${escapeStringForJson(pStoreId)}",
  "p_record_date": "${escapeStringForJson(pRecordDate)}",
  "p_location_id": "${escapeStringForJson(pLocationId)}",
  "p_currency_id": "${escapeStringForJson(pCurrencyId)}",
  "p_total_amount": ${pTotalAmount},
  "p_created_by": "${escapeStringForJson(pCreatedBy)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'bankAmountInsert',
      apiUrl:
          'https://atkekzwgukdvucqntryo.supabase.co/rest/v1/rpc/bank_amount_insert',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF0a2VrendndWtkdnVjcW50cnlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI4OTQwMjIsImV4cCI6MjA1ODQ3MDAyMn0.G4WqAmLvQSqYEfMWIpFOAZOYtnT0kxCxj8dVGhuUYO8',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
