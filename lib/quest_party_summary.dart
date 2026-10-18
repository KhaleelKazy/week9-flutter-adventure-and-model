import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'party_model.dart';

class QuestPartySummary extends StatelessWidget {
  const QuestPartySummary({super.key});

  @override
  Widget build(BuildContext context) {
    final party = context.watch<PartyModel>();

    return Material(
      elevation: 8,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Party Count: ${party.partyCount}'),
              Text('Total Gold Cost: ${party.totalCost} / ${party.budget}'),
              const Divider(),
              SizedBox(
                height: 140,
                child: party.party.isEmpty
                    ? const Center(child: Text('No one recruited yet'))
                    : ListView.builder(
                  itemCount: party.party.length,
                  itemBuilder: (context, index) {
                    final adventurer = party.party[index];
                    return ListTile(
                      dense: true,
                      title: Text(adventurer.name),
                      trailing: TextButton(
                        onPressed: () {
                          context
                              .read<PartyModel>()
                              .removeAdventurer(adventurer);
                        },
                        child: const Text('Dismiss'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}