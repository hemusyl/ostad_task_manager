import 'package:flutter/material.dart';

enum TaskType {
  tNew,
  progress,
  completed,
  cancelled,
}

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.taskType});
  final TaskType  taskType;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('What is Lorem Ipsum?', style: Theme.of(context).textTheme.titleMedium,),
            Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry',style: TextStyle(
              color: Colors.black54,
            ),),
            const SizedBox(height: 4,),
            Text('Date: 12/7/25'),
            const SizedBox(height: 5,),
            Row(
              children: [
                Chip(label: Text(_getTaskTypeName(), style: TextStyle(color: Colors.white),),
                  backgroundColor: _getTaskChipColor(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide.none,
                  ),),
                Spacer(),
                IconButton(onPressed: (){}, icon:Icon(Icons.delete)),
                IconButton(onPressed: (){}, icon:Icon(Icons.edit)),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Color _getTaskChipColor() {
    switch (taskType) {
      case TaskType.tNew:
        return Colors.blue;
      case TaskType.progress:
        return Colors.purple;
      case TaskType.completed:
        return Colors.green;
      case TaskType.cancelled:
        return Colors.red;
    }
  }
  String _getTaskTypeName() {
    switch (taskType) {
      case TaskType.tNew:
        return 'New';
      case TaskType.progress:
        return 'Progress';
      case TaskType.completed:
        return 'Completed';
      case TaskType.cancelled:
        return 'Cancelled';
    }
  }
}

