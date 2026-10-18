import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'adventurer.dart';
import 'party_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PartyModel(),
      child: const MyApp(),
    ),
  );
}

final availableAdventurers = [
  Adventurer('Lyra', 'Archer', 150),
  Adventurer('Brom', 'Warrior', 200),
  Adventurer('Sable', 'Rogue', 120),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final party = context.watch<PartyModel>();

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Text('Party: ${party.partyCount} | Gold: ${party.totalCost}'),
              for (final a in availableAdventurers)
                ElevatedButton(
                  onPressed: () {
                    context.read<PartyModel>().addAdventurer(
                      Adventurer(a.name, a.role, a.goldCost),
                    );
                  },
                  child: Text('Hire ${a.name} (${a.goldCost} gold)'),
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: party.party.length,
                  itemBuilder: (context, index) {
                    final adventurer = party.party[index];
                    return ListTile(
                      title: Text(adventurer.name),
                      subtitle: Text(
                        '${adventurer.role} | ${adventurer.goldCost} gold',
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context
                              .read<PartyModel>()
                              .removeAdventurer(adventurer);
                        },
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