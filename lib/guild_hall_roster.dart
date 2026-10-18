import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'adventurer.dart';
import 'party_model.dart';

final _guildRoster = [
  Adventurer('Aria', 'Mage', 150),
  Adventurer('Brom', 'Knight', 200),
  Adventurer('Sable', 'Rogue', 120),
];

class GuildHallRoster extends StatelessWidget {
  const GuildHallRoster({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _guildRoster.length,
      itemBuilder: (context, index) {
        final a = _guildRoster[index];
        return Card(
          child: ListTile(
            title: Text('${a.name} the ${a.role}'),
            subtitle: Text('${a.goldCost} Gold'),
            trailing: ElevatedButton(
              onPressed: () {
                final party = context.read<PartyModel>();
                if (party.canAfford(a)) {
                  party.addAdventurer(Adventurer(a.name, a.role, a.goldCost));
                  debugPrint('Recruited ${a.name} the ${a.role}');
                } else {
                  debugPrint('Cannot afford ${a.name}');
                }
              },
              child: const Text('Recruit'),
            ),
          ),
        );
      },
    );
  }
}