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

            return ListView.separated(
                itemCount: events.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final event = events[index];

                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(event.name),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(event.startTime.toIso8601String()),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            event.isAttending ? 'Attending' : 'Not Attending',
                            style: TextStyle(
                                color: event.isAttending
                                    ? Colors.green
                                    : Colors.red),
                          )
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
