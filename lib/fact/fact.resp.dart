import 'package:json_annotation/json_annotation.dart';

part 'fact.resp.g.dart';

@JsonSerializable()
class Fact {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'text')
  String? text;

  @JsonKey(name: 'source')
  String? source;

  @JsonKey(name: 'source_url')
  String? sourceUrl;

  @JsonKey(name: 'language')
  String? language;

  @JsonKey(name: 'permalink')
  String? permalink;

  Fact({
    this.id,
    this.text,
    this.source,
    this.sourceUrl,
    this.language,
    this.permalink,
  });

  factory Fact.fromJson(Map<String, dynamic> json) => _$FactFromJson(json);

  Map<String, dynamic> toJson() => _$FactToJson(this);
}
