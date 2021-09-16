import 'package:flutter/material.dart';
import 'package:flutter_interview/api/event_service.dart';
import 'package:flutter_interview/domain/event_model.dart';

class EventListPage extends StatelessWidget {
  const EventListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = EventService();

    return Scaffold(
      appBar: AppBar(title: const Text('Haystack Flutter Interview')),
      body: FutureBuilder<List<EventModel>>(
          future: service.fetchEvents(),
          builder: (context, snapshot) {
            final events = snapshot.data;

            if (events == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView(
                children: events
                    .map((e) => ListTile(
                          title: Text(e.name),
                          subtitle: Text(
                            e.isAttending ? 'Attending' : 'Not Attending',
                            style: TextStyle(
                                color:
                                    e.isAttending ? Colors.green : Colors.red),
                          ),
                        ))
                    .toList());
          }),
    );
  }
}
