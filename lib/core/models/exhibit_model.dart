class ExhibitItem {
  // the exhibit class..
  ExhibitItem({
    required this.images,
    required this.title,
  });

  factory ExhibitItem.fromJson(Map<String, dynamic> json) {
    return ExhibitItem(
      images: json['images'],
      title: json['title'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['images'] = images;
    return data;
  }

  String title;
  List<dynamic> images;
}

class ExhibitList {
  // the exhibit list
  List<ExhibitItem>? exhibitItems = [];

  ExhibitList({
    this.exhibitItems,
  });

  factory ExhibitList.fromJson(List<dynamic>? exhibit) => ExhibitList(
        exhibitItems: exhibit == null
            ? []
            : List<ExhibitItem>.from(
                exhibit.map(
                  (x) => ExhibitItem.fromJson(x),
                ),
              ),
      );
}
