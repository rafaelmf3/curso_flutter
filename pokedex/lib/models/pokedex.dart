class Pokedex {
  final int count;
  final String next;
  final String previous;

  Pokedex({
    this.count,
    this.next,
    this.previous,
  });

  factory Pokedex.fromMap(Map<String, dynamic> json) {
    return Pokedex(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
    );
  }
}
