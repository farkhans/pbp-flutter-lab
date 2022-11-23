class Budget {
  String judul, jenis;
  int nominal;
  DateTime tanggal;
  static List<Budget> listBudget = [];
  Budget(this.judul, this.nominal, this.jenis, this.tanggal);
}