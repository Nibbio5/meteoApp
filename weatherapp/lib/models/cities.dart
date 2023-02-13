import 'dart:convert';

List<Cityes> cityesFromJson(String str) => List<Cityes>.from(json.decode(str).map((x) => Cityes.fromJson(x)));

String cityesToJson(List<Cityes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cityes {
    Cityes({
        required this.placeId,
        required this.licence,
        required this.osmType,
        required this.osmId,
        required this.boundingbox,
        required this.lat,
        required this.lon,
        required this.displayName,
        required this.placeRank,
        required this.category,
        required this.type,
        required this.importance,
        required this.icon,
    });

    int placeId;
    String licence;
    String osmType;
    int osmId;
    List<String> boundingbox;
    String lat;
    String lon;
    String displayName;
    int placeRank;
    String category;
    String type;
    double importance;
    String icon;

    factory Cityes.fromJson(Map<String, dynamic> json) => Cityes(
        placeId: json["place_id"],
        licence: json["licence"],
        osmType: json["osm_type"],
        osmId: json["osm_id"],
        boundingbox: List<String>.from(json["boundingbox"].map((x) => x)),
        lat: json["lat"],
        lon: json["lon"],
        displayName: json["display_name"],
        placeRank: json["place_rank"],
        category: json["category"],
        type: json["type"],
        importance: json["importance"]?.toDouble(),
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "place_id": placeId,
        "licence": licence,
        "osm_type": osmType,
        "osm_id": osmId,
        "boundingbox": List<dynamic>.from(boundingbox.map((x) => x)),
        "lat": lat,
        "lon": lon,
        "display_name": displayName,
        "place_rank": placeRank,
        "category": category,
        "type": type,
        "importance": importance,
        "icon": icon,
    };
}