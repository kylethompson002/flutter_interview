import 'dart:math';

import 'package:flutter_interview/domain/event_details.dart';
import 'package:flutter_interview/domain/event_model.dart';

final random = Random(DateTime.now().millisecondsSinceEpoch);
final Map<String, bool> _attendingMap = {};

class EventService {
  ///Fetches all events
  Future<List<EventModel>> fetchEvents() async {
    final response = await _generateEvents(count: 100);
    return response;
  }

  ///Fetches event details by id
  Future<EventDetailModel> fetchEventDetails({required String eventId}) async {
    return _generateEventDetails(id: eventId);
  }

  Future<void> attendEvent({required String eventId}) async {
    await Future.delayed(const Duration(seconds: 1));
    _attendingMap[eventId] = true;
  }

  ///private methods
  Future<List<EventModel>> _generateEvents({required int count}) async {
    await Future.delayed(const Duration(seconds: 1));
    final List<EventModel> result = [];

    for (int i = 0; i < count; i++) {
      final event = _generateEvent(index: i);
      result.add(event);
    }

    return result;
  }

  EventModel _generateEvent({required int index}) {
    final randomDays = random.nextInt(100);
    final randomHours = random.nextInt(23);
    final randomMinutes = random.nextInt(59);
    final eventId = _getEventId(index: index);

    return EventModel(
      id: eventId,
      name: 'Interview Event #$index',
      isAttending: _attendingMap[eventId] ?? false,
      startTime: DateTime.now().add(Duration(
          days: randomDays, hours: randomHours, minutes: randomMinutes)),
    );
  }

  EventDetailModel _generateEventDetails({required String id}) {
    return EventDetailModel(
        id: id,
        summary:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam nec quam at nisi aliquam feugiat a quis libero. Nam bibendum felis quis ligula hendrerit, vel laoreet nisl venenatis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Cras a purus turpis. Nulla scelerisque commodo lorem, quis facilisis turpis volutpat ut. Nam aliquet, nunc vel lobortis condimentum, velit lectus fermentum ante, ut finibus quam nisl sit amet metus. Quisque ipsum dolor, tristique sit amet elit non, dignissim ultricies tellus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Ut a leo vel ipsum scelerisque pharetra et vitae massa. Cras sed ornare enim, ut posuere risus. Sed vel risus vel lacus convallis porttitor vitae non risus. Etiam consectetur, dui non semper efficitur, velit orci eleifend sem, quis venenatis ex metus in arcu. Donec sed purus volutpat orci facilisis feugiat. Nunc rhoncus lectus a cursus elementum. Donec sodales malesuada scelerisque. ',
        location: 'location',
        numAttendees: random.nextInt(200));
  }

  String _getEventId({required int index}) => 'event_$index';
}
