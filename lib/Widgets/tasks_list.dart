import 'package:flutter/material.dart';
import 'package:tasker/Widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:tasker/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallBack: (bool checkBoxState) {
                taskData.updateTask(task);
              },
              longPressCallBack: () {
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
