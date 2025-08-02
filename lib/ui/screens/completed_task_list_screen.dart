import 'package:flutter/material.dart';
import 'package:ostad_task_manager/ui/widgets/taskcard.dart';

import '../../data/models/task_model.dart';
import '../../data/service/network_caller.dart';
import '../../data/service/urls.dart';
import '../widgets/snack_bar_message.dart';

class CompletedTaskListScreen extends StatefulWidget {
  const CompletedTaskListScreen({super.key});

  @override
  State<CompletedTaskListScreen> createState() =>
      _CompletedTaskListScreenState();
}

class _CompletedTaskListScreenState extends State<CompletedTaskListScreen> {

  bool _getCompletedTasks = false;
  List<TaskModel> _completedTaskList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getCompletedTaskList();
      // _getTaskStatusCountList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Visibility(
        replacement: CircularProgressIndicator(),
        visible: _getCompletedTasks == false,
        child: ListView.builder(
          itemCount: _completedTaskList.length,
          itemBuilder: (context, index){
           return TaskCard(
               taskType: TaskType.completed,
             taskModel: _completedTaskList[index],
             onStatusUpdate: () {
               _getCompletedTaskList();
             },
          );
          },
        ),
      ),
    );
  }

  Future<void> _getCompletedTaskList() async {
    _getCompletedTasks = true;
    setState(() {});

    NetworkResponse response =await NetworkCaller.getRequest(
      url:  Urls.getCompletedTasksUrl,
    );

    //Models
    if (response.isSuccess){
      // List<TaskStatusCountModel> list = [];
      List<TaskModel> list = [];
      for (Map<String, dynamic> jsonData in response.body!['data']) {
        list.add(TaskModel.fromJson(jsonData));
      }
      _completedTaskList  = list;

    }else{
      showSnackBarMessage(context, response.errorMessage!);
    }
    _getCompletedTasks = false;
    setState(() {});
  }

}