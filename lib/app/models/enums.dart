import 'package:flutter/foundation.dart';
import 'package:hhf_next_gen/app/services/role_based_access/user_role.dart';

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

enum CaseLogType {
  View,
  Update,
}


// enum userRole {
//   CaseRegistrar,
//   CaseEvaluator,
//   CaseAuthorizer,
//   CaseDispatcher,
//   CaseManager,
//   CaseBilling,
//   CasePayments,
//   CaseAuditor,
//   CaseDisposer
// }

enum ResourceType{
  Entity,
  Report,
  Button,
  Menu
}
