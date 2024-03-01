import 'dart:convert';

BinanceResponse binanceResponseFromJson(String str) => BinanceResponse.fromJson(json.decode(str));

String binanceResponseToJson(BinanceResponse data) => json.encode(data.toJson());

class BinanceResponse {
  String? binanceResponseE;
  int? e;
  int? a;
  String? s;
  String? p;
  String? q;
  int? f;
  int? l;
  int? t;
  bool? m;

  BinanceResponse({
    this.binanceResponseE,
    this.e,
    this.a,
    this.s,
    this.p,
    this.q,
    this.f,
    this.l,
    this.t,
    this.m,
  });

  factory BinanceResponse.fromJson(Map<String, dynamic> json) => BinanceResponse(
    binanceResponseE: json["e"],
    e: json["E"],
    a: json["a"],
    s: json["s"],
    p: json["p"],
    q: json["q"],
    f: json["f"],
    l: json["l"],
    t: json["T"],
    m: json["m"],
  );

  Map<String, dynamic> toJson() => {
    "e": binanceResponseE,
    "E": e,
    "a": a,
    "s": s,
    "p": p,
    "q": q,
    "f": f,
    "l": l,
    "T": t,
    "m": m,
  };
}
