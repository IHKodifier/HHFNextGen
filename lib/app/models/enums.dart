import 'package:flutter/foundation.dart';

enum CaseStatus {
  Exploratory,
  ReferredToDoctor,
  started,
  EvaluationAssigned,
  Evaluated,
  Decided,
  ServiceDispatched,
  ServiceConsumed,
  ServiceBilled,
  ServicePaid,
  CaseFollowup,
  ServiceReconciled,
  CaseCompleted,
  CompletionVerified,
  Archived
  
}

enum CaseLogType{
  View,
  Update,
}