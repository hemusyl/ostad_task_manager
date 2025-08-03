import 'package:flutter/material.dart';
import 'package:ostad_task_manager/ui/widgets/taskcard.dart';

import '../../data/models/task_model.dart';
import '../../data/service/network_caller.dart';
import '../../data/service/urls.dart';
import '../widgets/snack_bar_message.dart';

class CancelledTaskListScreen extends StatefulWidget {
  const CancelledTaskListScreen({super.key});

  @override
  State<CancelledTaskListScreen> createState() =>
      _CancelledTaskListScreenState();
}

class _CancelledTaskListScreenState extends State<CancelledTaskListScreen> {

  bool _getCancelledTasks = false;
  List<TaskModel> _cancelledTaskList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getCancelledTaskList();

    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Visibility(
        visible: _getCancelledTasks == false,
        replacement: CircularProgressIndicator(),
        child: ListView.builder(
          itemCount: _cancelledTaskList.length,
          itemBuilder: (context, index){
            return TaskCard(
              taskType: TaskType.cancelled,
              taskModel: _cancelledTaskList[index],
              onStatusUpdate: () {
                _getCancelledTaskList();
              },
            );
          },
        ),
      ),
    );
  }

  Future<void> _getCancelledTaskList() async {
    _getCancelledTasks = true;
    setState(() {});

    NetworkResponse response =await NetworkCaller.getRequest(
      url:  Urls.getCancelledTasksUrl,
    );

    //Models
    if (response.isSuccess){
      // List<TaskStatusCountModel> list = [];
      List<TaskModel> list = [];
      for (Map<String, dynamic> jsonData in response.body!['data']) {
        list.add(TaskModel.fromJson(jsonData));
      }
      _cancelledTaskList  = list;

    }else{
      showSnackBarMessage(context, response.errorMessage!);
    }
    _getCancelledTasks = false;
    setState(() {});
  }

}