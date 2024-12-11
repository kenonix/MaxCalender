class Event {
  final DateTime date ;
  Event({required this.date});
}
final _events = LinkedHashMap(
    equals: isSameDay,
  )..addAll({
    DateTime(2022, 8, 4) : Event(date: DateTime(2022, 8, 4)),
    DateTime(2022, 8, 6) : Event(date: DateTime(2022, 8, 6)),
    DateTime(2022, 8, 7) : Event(date: DateTime(2022, 8, 7)),
    DateTime(2022, 8, 9) : Event(date: DateTime(2022, 8, 9)),
    DateTime(2022, 8, 11) : Event(date: DateTime(2022, 8, 11)),
    DateTime(2022, 8, 14) : Event(date: DateTime(2022, 8, 14)),
  }) ;