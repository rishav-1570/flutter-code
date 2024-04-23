
class TypeCard {
  
  final int id;
  final String task;
  final DateTime? dateTime;
  final bool isEdited ;
  final bool isCompleted;

  TypeCard({required this.id, required this.task, this.isCompleted = false, this.isEdited = false}): dateTime = DateTime.now();
  


  TypeCard copyWith({
    String? task,
    bool? isCompleted,
    bool? isEdited,
  }) {
    return TypeCard(
      id: id,
      task: task ?? this.task,
      isCompleted: isCompleted ?? this.isCompleted,
      isEdited: isEdited ?? this.isEdited,
    );
  }
  

}

// {
//     this.task = task;
//     this.isEdited = false;
//     this.isCompleted = false;
//     this.dateTime = DateTime.now();
//   }