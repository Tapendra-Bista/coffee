// To parse this JSON data, do
//
//     final server = serverFromJson(jsonString);

import 'dart:convert';

List<Server> serverFromJson(String str) => List<Server>.from(json.decode(str).map((x) => Server.fromJson(x)));

String serverToJson(List<Server> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Server {
    String id;
    String link1;
    String link2;
    String link3;
    String link4;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Server({
        required this.id,
        required this.link1,
        required this.link2,
        required this.link3,
        required this.link4,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Server.fromJson(Map<String, dynamic> json) => Server(
        id: json["_id"],
        link1: json["link1"],
        link2: json["link2"],
        link3: json["link3"],
        link4: json["link4"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "link1": link1,
        "link2": link2,
        "link3": link3,
        "link4": link4,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
