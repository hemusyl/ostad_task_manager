import 'package:flutter/material.dart';
import 'package:ostad_task_manager/ui/widgets/taskcard.dart';

class CompletedTaskListScreen extends StatefulWidget {
  const CompletedTaskListScreen({super.key});

  @override
  State<CompletedTaskListScreen> createState() => _CompletedTaskListScreenState();
}

class _CompletedTaskListScreenState extends State<CompletedTaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index){
         // return TaskCard(
          //    taskType: TaskType.completed,
        //  );
        },
      ),
    );
  }
}
