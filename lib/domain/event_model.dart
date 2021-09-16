class EventModel {
  const EventModel(
      {required this.id,
      required this.name,
      required this.startTime,
      required this.isAttending});

  final String id;

  final String name;

  final DateTime startTime;

  final bool isAttending;
}
