class TaskModel {
  final String id;
  final String title;
  final String note;
  final String startTime;
  final String endTime;
  final bool isComelate;
  final int color;

  TaskModel({
    required this.id,
    required this.title,
    required this.note,
    required this.startTime,
    required this.endTime,
    required this.isComelate,
    required this.color,
  });
  static List<TaskModel> tasksList = [
    TaskModel(
      id: '1',
      title: 'flutter',
      note: 'Learn Dart',
      startTime: '9:33 PM',
      endTime: '10:35 PM',
      isComelate: false,
      color: 1,
    ),
    TaskModel(
      id: '1',
      title: 'NodeJs',
      note: 'Learn Java',
      startTime: '9:33 PM',
      endTime: '10:35 PM',
      isComelate: true,
      color: 3,
    ),
  ];
}
