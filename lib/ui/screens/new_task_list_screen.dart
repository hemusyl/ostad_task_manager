import 'package:flutter/material.dart';
import 'package:ostad_task_manager/ui/screens/add_new_task_screen.dart';
import '../widgets/task_count_summary_card.dart';
import '../widgets/taskcard.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {
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
                child: ListView.builder(
              itemCount: 9,
              itemBuilder: (context, index){
                return TaskCard(
                    taskType: TaskType.tNew,
                );
              },
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
  void _onTapAddNewTaskButton(){
    Navigator.pushNamed(context, AddNewTaskScreen.name);
  }
}
