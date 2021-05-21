import 'package:hhf_next_gen/models/enums.dart';
import '../models/enums.dart';

class Job {
  final String id;
  final String title;
  final String description;
  final String assignee;
  final String assignedBy;
  final String hfCase;
  final int dueIn;
  final JobStatus jobStatus;

  Job(
    this.id,
    this.title,
    this.description,
    this.assignee,
    this.assignedBy,
    this.hfCase,
    this.dueIn,
    this.jobStatus,
  );

  Job.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        title = data['title'],
        description = data['description'],
        assignee = data['assignee'],
        jobStatus = data['jobStatus'],
        assignedBy = data['assignedBy'],
        hfCase = data['hfCase'],
        dueIn = data['dueIn'];

  @override
  String toString() {
    // TODO: implement toString
    String str =
        'printing Instance of Job. Job id =$id , title = $title , desccription= $description , assignee = $assignee, assigned By = $assignedBy , HF Case= $hfCase, Due in = $dueIn JobStatus =${JobStatus.values[jobStatus.index]} ';
    return str;
  }



}
