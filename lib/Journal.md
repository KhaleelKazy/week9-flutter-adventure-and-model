Journal1
I accomplished making classes to extend Change
Notifier to keep a private roaster for _party. 
I also added addDventurer and removeAdventer.notifyLister 
works by keeping a list of listeners. if the data was added
without calling the UI would stay frozen on the old values

Journal2
It is important to place the Provider high in the widget 
tree because calling the widget searches upward. The widget can only
reach a provider that is above it in the tree.

Journal3
The difference between the two is context.watch subscribes widgets
to the model so it rebuilds. context.read fetches the model once with no
subscription. Inside an event handler like onPress context.read is preferred
because you don't want the button to rebuild every time the party changes