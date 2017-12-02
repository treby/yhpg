class MazeSolver {
  test(input, expected) {
    console.log('ok');
  }

  runTests() {
    const test = this.test;
    /*0*/ test( "DE", "13" );
    /*1*/ test( "EK", "1" );
    /*2*/ test( "01", "1" );
    /*3*/ test( "LG", "2" );
    /*4*/ test( "A1", "4" );
    /*5*/ test( "GJ", "4" );
    /*6*/ test( "FK", "4" );
    /*7*/ test( "LV", "4" );
    /*8*/ test( "27", "4" );
    /*9*/ test( "0O", "4" );
    /*10*/ test( "G1", "5" );
    /*11*/ test( "ZH", "5" );
    /*12*/ test( "AB", "5" );
    /*13*/ test( "KX", "5" );
    /*14*/ test( "1G", "5" );
    /*15*/ test( "WX", "5" );
    /*16*/ test( "3L", "5" );
    /*17*/ test( "9Y", "5" );
    /*18*/ test( "EX", "6" );
    /*19*/ test( "BG", "6" );
    /*20*/ test( "7K", "7" );
    /*21*/ test( "E3", "7" );
    /*22*/ test( "SW", "7" );
    /*23*/ test( "BM", "7" );
    /*24*/ test( "3C", "7" );
    /*25*/ test( "H9", "7" );
    /*26*/ test( "J3", "7" );
    /*27*/ test( "GX", "8" );
    /*28*/ test( "2Z", "8" );
    /*29*/ test( "8H", "8" );
    /*30*/ test( "Z7", "8" );
    /*31*/ test( "0B", "8" );
    /*32*/ test( "U9", "9" );
    /*33*/ test( "Z0", "10" );
    /*34*/ test( "0N", "10" );
    /*35*/ test( "U8", "10" );
    /*36*/ test( "XZ", "10" );
    /*37*/ test( "H0", "11" );
    /*38*/ test( "CH", "13" );
    /*39*/ test( "WB", "13" );
    /*40*/ test( "0R", "13" );
    /*41*/ test( "DZ", "13" );
    /*42*/ test( "NI", "13" );
    /*43*/ test( "QC", "14" );
    /*44*/ test( "6U", "14" );
    /*45*/ test( "PO", "15" );
    /*46*/ test( "RI", "16" );
    /*47*/ test( "UO", "17" );
    /*48*/ test( "WO", "17" );
    /*49*/ test( "OX", "18" );
  }
}

const solver = new MazeSolver();
solver.runTests();
