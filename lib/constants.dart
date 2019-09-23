
// UI Constants
const double LABEL_FONT_SIZE = 18.0;
const double DESCRIPTION_FONT_SIZE = 14.0;
const double TITLE_FONT_SIZE = 24.0;

const double LARGE_PADDING = 32.0;
const double MID_PADDING = 16.0;
const double SMALL_PADDING = 4.0;

const String REPORT = "Report";
const String TIME = "Time:";
const String AVERAGE = "Average:";
const String DEVIATION = "Deviation:";
const String PROD_ITEMS = "Produced items:";
const String CONS_ITEMS = "Consumed items:";
const String TITLE = "Android concurrency models comparission - Flutter version";

// Problem Constants

const String LABEL_CHOOSE_PROBLEM = "Choose one of the problems";
const String MAT_MULT = "Matrix multiplication";
const String CONC_SUM = "Concurrent sum";
const String IMG_DOWN = "Image download";
const List PROBLEMS = [
  MAT_MULT, CONC_SUM, IMG_DOWN
];
const PROBL_DESCRIPTION = {
  MAT_MULT: "Matrix multiplication of two square matrix randmoly initialized " +
      "with size defined by the following parameter.",
  CONC_SUM: "Concurrent sum of numbers that is done by assigning subsums to " +
      "different tasks and aggregating the results at the end.",
  IMG_DOWN: "Test downloading images",
};

//Matrix multiplication
const M1 = "m1";
const M2 = "m2";
const MM_ID = "id";
const MM_TASKS = "tasks";
const MM_MAX_VAL = 20;

//Image download
const String CAT = "Cat";
const String DOG = "Dog";
const String LION = "Lion";
const String PLATYPUS = "Platypus";
const String PIGEON = "Pigeon";
const String LABEL_CHOOSE_IMG = "Choose an image to download";
const List IMAGES = [CAT, DOG, LION, PLATYPUS, PIGEON];
const String BASE_IMG_URL = 'https://gitlab.com/wwvargas/androidconcurrency/raw/master/imgs/';
const IMG_URL = {
  CAT: BASE_IMG_URL + "cat.jpg",
  DOG: BASE_IMG_URL + "dog.jpg",
  LION: BASE_IMG_URL + "lion.jpg",
  PLATYPUS: BASE_IMG_URL + "platypus.jpg",
  PIGEON: BASE_IMG_URL + "pigeon.jpg"
};

// Concurrent sum
const ARR = "arr";
const S_TASKS = "tasks";
const S_ID = "id";
const LEVEL = "level";
const S_MAX_VAL = 20;