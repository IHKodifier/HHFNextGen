import 'dart:html';

import 'package:hhf_next_gen/app/models/document_time_stamp.dart';
import 'package:hhf_next_gen/app/models/patient.dart';

class FinancingCase {
  final String caseId;
  final Patient patient;
  late final patientId,
      guesstimatedCost,
      estimatedCost,
      totalCost,
      purchaseOders,
      invoices,
      payments,
      documentTimeStamp,
      caseEvaluation;

  FinancingCase(this.caseId, this.patient);
}
