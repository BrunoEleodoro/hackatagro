class Texto {
  Texto(
      {required this.id,
      required this.titulo,
      required this.autor,
      required this.descricao,
      required this.tema,
      required this.img,
      required this.timestamp,
      required this.nota,
      required this.views});

  factory Texto.fromJson(Map<String, dynamic> json) => Texto(
        id: json['_id'] as String,
        autor: json['autor'] as String,
        descricao: json['descricao'] as String,
        titulo: json['titulo'] as String,
        tema: json['tema'] as String,
        img: json['img'] as String,
        timestamp: json['timestamp'] as int,
        nota: json['nota'] as int,
        views: json['views'] as int,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'autor': autor,
        'descricao': descricao,
        'titulo': titulo,
        'tema': tema,
        'img': img,
        'timestamp': timestamp,
        'nota': nota,
        'views': views
      };

  final String id;
  final String titulo;
  final String autor;
  final String descricao;
  final String tema;
  final String img;
  final int timestamp;
  final int nota;
  final int views;
}
