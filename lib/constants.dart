
// UI Constants
const double LABEL_FONT_SIZE = 18.0;
const double DESCRIPTION_FONT_SIZE = 14.0;
const double TITLE_FONT_SIZE = 24.0;

const double LARGE_PADDING = 32.0;
const double MID_PADDING = 16.0;
const double SMALL_PADDING = 4.0;

const String REPORT = "Report";
const String TIME = "Time:";
const String TITLE = "Android concurrency models comparission - Flutter version";

// Problem Constants

const String LABEL_CHOOSE_PROBLEM = "Choose one of the problems";
const String MAT_MULT = "Matrix multiplication";
const String CONC_SUM = "Concurrent sum";
const String PHILOSOPHERS = "Philosophers";
const String IMG_DOWN = "Image download";
const String PROD_CONS = "Producers and consumers";
const List PROBLEMS = [
  MAT_MULT, CONC_SUM, PHILOSOPHERS, IMG_DOWN, PROD_CONS
];
const PROBL_DESCRIPTION = {
  MAT_MULT: "Matrix multiplication of two square matrix randmoly initialized " +
      "with size defined by the following parameter.",
  CONC_SUM: "Concurrent sum of numbers that is done by assigning subsums to " +
      "different tasks and aggregating the results at the end.",
  PHILOSOPHERS: "Philosophers problem used to explore justice on task " +
      "scheduling.",
  IMG_DOWN: "Test downloading images",
  PROD_CONS: "Uses Producers-Consumers problem to explore synchronization " +
      "methods"
};

