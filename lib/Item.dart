class Item {
  final int id;
  final String name;
  final String noControl;
  bool isChecked;

  Item({required this.id, required this.name, required this.noControl, required this.isChecked});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      noControl : json['noControl'],
      isChecked : json['isChecked']
    );
  }
}
