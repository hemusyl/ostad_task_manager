import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

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
                Chip(label: Text('New', style: TextStyle(color: Colors.white),),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
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
}