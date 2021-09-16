class EventDetailModel {
  EventDetailModel(
      {required this.id,
      required this.summary,
      required this.location,
      required this.numAttendees});

  String id;
  String summary;
  String location;
  int numAttendees;
}
