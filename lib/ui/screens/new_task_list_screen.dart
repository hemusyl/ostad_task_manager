import 'package:flutter/material.dart';
import 'package:ostad_task_manager/data/service/network_caller.dart';
import 'package:ostad_task_manager/ui/screens/add_new_task_screen.dart';
import 'package:ostad_task_manager/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ostad_task_manager/ui/widgets/snack_bar_message.dart';
import '../../data/models/task_model.dart';
import '../../data/service/urls.dart';
import '../widgets/task_count_summary_card.dart';
import '../widgets/taskcard.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {
  bool _getNewTasksInProgress = false;
  List<TaskModel> _newTaskList = [];
  // List<TaskStatusCountModel> _taskStatusCountList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
     _getNewTaskList();
     // _getTaskStatusCountList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const SizedBox(height: 15,),
            SizedBox(
              height: 100,
                child: ListView.separated(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index ){
                    return TaskCountSummaryCard(title: 'Progress', count: 13);
                  },
                  separatorBuilder:(context, index) => const SizedBox(width: 4,),
            ),
            ),
            Expanded(
                child: Visibility(
                  visible: _getNewTasksInProgress == false,
                  replacement: CenteredCircularProgressIndicator(),
                  child: ListView.builder(
                                itemCount: _newTaskList.length,
                                itemBuilder: (context, index){
                  return TaskCard(
                      taskType: TaskType.tNew, //
                      taskModel: _newTaskList[index],
                  );
                                },
                              ),
                ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddNewTaskButton,
        child:Icon(Icons.add) ,),
    );
  }

  Future<void> _getNewTaskList() async {
    _getNewTasksInProgress = true;
    setState(() {});

    NetworkResponse response =await NetworkCaller.getRequest(
        url: Urls.getNewTasksUrl
    );


    setState(() {});
    //Models
    if (response.isSuccess){
     // List<TaskStatusCountModel> list = [];
      List<TaskModel> list = [];
      for (Map<String, dynamic> jsonData in response.body!['data']) {
        list.add(TaskModel.fromJson(jsonData));
      }
      _newTaskList = list;

    }else{
        showSnackBarMessage(context, response.errorMessage!);
    }
    _getNewTasksInProgress = false;
    setState(() {});
  }


  void _onTapAddNewTaskButton(){
    Navigator.pushNamed(context, AddNewTaskScreen.name);
  }
}
