// read table from a csv file
Table stats;

void setup() {
  stats = loadTable("ortiz.csv");
  
  for (int i = 0; i < stats.getRowCount(); i++) {
    int year = stats.getInt(i, 0);
    int homeRuns = stats.getInt(i, 1);
    int rbi = stats.getInt(i, 2);
    float average = stats.getFloat(i, 3);
    println(year, homeRuns, rbi, average);
  }
}
