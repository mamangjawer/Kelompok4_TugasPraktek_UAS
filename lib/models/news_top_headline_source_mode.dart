import 'source_mode.dart';

class NewsTopHeadlineSourceMode {
  String? status;
  List<Source>? sources;

  NewsTopHeadlineSourceMode({this.status, this.sources});

  factory NewsTopHeadlineSourceMode.fromJson(Map<String, dynamic> json) {
    return NewsTopHeadlineSourceMode(
      status: json['status'],
      sources:
          json['sources'] != null
              ? List<Source>.from(
                json['sources'].map((x) => Source.fromJson(x)),
              )
              : null,
    );
  }
}
