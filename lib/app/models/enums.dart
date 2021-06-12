import 'package:flutter/foundation.dart';

enum CaseStatus {
  Exploratory,
  referredForCheckup,
  Initiated,
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
