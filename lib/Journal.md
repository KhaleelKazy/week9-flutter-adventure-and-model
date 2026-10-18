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