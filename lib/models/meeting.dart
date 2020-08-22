class Meeting {
  final String title;
  final List<Agenda> agendas;

  Meeting(this.title, this.agendas);

  String get agendasInline => agendas.map((e) => e.title).join("\n");
}

class Agenda {
  final String title;

  Agenda(this.title);
}
