class TaskModel {
  final int? id;
  final String title;
  final String note;
  final String startTime;
  final String endTime;
  final String date;
  final int isComelate;
  final int color;

  TaskModel({
    this.id,
    required this.title,
    required this.note,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.isComelate,
    required this.color,
  });
  factory TaskModel.fromjson(Map<String, dynamic> jsonData) {
    return TaskModel(
      id: jsonData['id'],
      title: jsonData['title'],
      note: jsonData['note'],
      startTime: jsonData['startTime'],
      endTime: jsonData['endTime'],
      date: jsonData['date'],
      isComelate: jsonData['isComelate'],
      color: jsonData['color'],
    );
  }
}
