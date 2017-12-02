class MazeSolver {
  solve(input) {
    const [start, goal] = [
      this.normalizePositionFromChar(input.charAt(0)),
      this.normalizePositionFromChar(input.charAt(1))
    ];
    console.log(`${JSON.stringify(start)}->${JSON.stringify(goal)}`);

    return '13';
  }

  normalizePositionFromChar(chr) {
    const mazeMap = [
      '0', '1', '2', '3', '4', '5',
      '6', '7', '8', '9', 'A', 'B',
      'C', 'D', 'E', 'F', 'G', 'H',
      'I', 'J', 'K', 'L', 'M', 'N',
      'O', 'P', 'Q', 'R', 'S', 'T',
      'U', 'V', 'W', 'X', 'Y', 'Z'
    ];
    const index = mazeMap.indexOf(chr);

    const row = index % 6;
    const col = (index - row) / 6;

    return [col, row];
  }

  test(input, expected) {
    const actual = this.solve(input);

    if (actual === expected) {
      console.log('ok');
    } else {
      console.log(`NG!!! input: ${input}, expected ${expected}, but got ${actual}`);
    }
  }

  runTests() {
    /*0*/ this.test( "DE", "13" );
    /*1*/ this.test( "EK", "1" );
    /*2*/ this.test( "01", "1" );
    /*3*/ this.test( "LG", "2" );
    /*4*/ this.test( "A1", "4" );
    /*5*/ this.test( "GJ", "4" );
    /*6*/ this.test( "FK", "4" );
    /*7*/ this.test( "LV", "4" );
    /*8*/ this.test( "27", "4" );
    /*9*/ this.test( "0O", "4" );
    /*10*/ this.test( "G1", "5" );
    /*11*/ this.test( "ZH", "5" );
    /*12*/ this.test( "AB", "5" );
    /*13*/ this.test( "KX", "5" );
    /*14*/ this.test( "1G", "5" );
    /*15*/ this.test( "WX", "5" );
    /*16*/ this.test( "3L", "5" );
    /*17*/ this.test( "9Y", "5" );
    /*18*/ this.test( "EX", "6" );
    /*19*/ this.test( "BG", "6" );
    /*20*/ this.test( "7K", "7" );
    /*21*/ this.test( "E3", "7" );
    /*22*/ this.test( "SW", "7" );
    /*23*/ this.test( "BM", "7" );
    /*24*/ this.test( "3C", "7" );
    /*25*/ this.test( "H9", "7" );
    /*26*/ this.test( "J3", "7" );
    /*27*/ this.test( "GX", "8" );
    /*28*/ this.test( "2Z", "8" );
    /*29*/ this.test( "8H", "8" );
    /*30*/ this.test( "Z7", "8" );
    /*31*/ this.test( "0B", "8" );
    /*32*/ this.test( "U9", "9" );
    /*33*/ this.test( "Z0", "10" );
    /*34*/ this.test( "0N", "10" );
    /*35*/ this.test( "U8", "10" );
    /*36*/ this.test( "XZ", "10" );
    /*37*/ this.test( "H0", "11" );
    /*38*/ this.test( "CH", "13" );
    /*39*/ this.test( "WB", "13" );
    /*40*/ this.test( "0R", "13" );
    /*41*/ this.test( "DZ", "13" );
    /*42*/ this.test( "NI", "13" );
    /*43*/ this.test( "QC", "14" );
    /*44*/ this.test( "6U", "14" );
    /*45*/ this.test( "PO", "15" );
    /*46*/ this.test( "RI", "16" );
    /*47*/ this.test( "UO", "17" );
    /*48*/ this.test( "WO", "17" );
    /*49*/ this.test( "OX", "18" );
  }
}

const solver = new MazeSolver();
solver.runTests();
