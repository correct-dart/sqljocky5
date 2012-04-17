class MathsTest {
  void canWriteZeroFloat() {
    double n = 0.0;
    List<int> bytes = floatToList(n);
    Expect.equals("00000000", listToHexString(bytes, true));
  }
  
  void canWriteZeroDouble() {
    double n = 0.0;
    List<int> bytes = doubleToList(n);
    Expect.equals("0000000000000000", listToHexString(bytes, true));
  }
  
  void canWriteOneOrGreaterFloat() {
    double n = 1.0;
    List<int> bytes = floatToList(n);
    Expect.equals("3F800000", listToHexString(bytes, true));
    
    n = 100.0;
    bytes = floatToList(n);
    Expect.equals("42C80000", listToHexString(bytes, true));
    
    n = 123487.982374;
    bytes = floatToList(n);
    Expect.equals("47F12FFD", listToHexString(bytes, true));

    n = 10000000000000000000000000000.0;
    bytes = floatToList(n);
    Expect.equals("6E013F39", listToHexString(bytes, true));
    
    // TODO: test very large numbers
  }
  
  void canWriteOneOrGreaterDouble() {
    double n = 1.0;
    List<int> bytes = doubleToList(n);
    Expect.equals("3FF0000000000000", listToHexString(bytes, true));
    
    n = 100.0;
    bytes = doubleToList(n);
    Expect.equals("4059000000000000", listToHexString(bytes, true));
    
    n = 123487.982374;
    bytes = doubleToList(n);
    Expect.equals("40FE25FFB7CDCCA7", listToHexString(bytes, true));

    n = 10000000000000000000000000000.0;
    bytes = doubleToList(n);
    Expect.equals("45C027E72F1F1281", listToHexString(bytes, true));
    
    // TODO: test very large numbers
  }
  
  void canWriteLessThanOneFloat() {
    double n = 0.1;
    List<int> bytes = floatToList(n);
    Expect.equals("3DCCCCCC", listToHexString(bytes, true));
    
    // TODO: test very small numbers
    n = 3.4028234663852886E+38;
    print(n);
    bytes = floatToList(n);
    Expect.equals("7F7FFFFF", listToHexString(bytes, true));
    
    n = 1.1754943508222875E-38;
    print(n);
    bytes = floatToList(n);
    Expect.equals("00800000", listToHexString(bytes, true));
  }
  
  
  void canWriteLessThanOneDouble() {
    double n = 0.1;
    List<int> bytes = doubleToList(n);
    Expect.equals("3FB999999999999A", listToHexString(bytes, true));
    
    // TODO: test very small numbers
    n = 1.7976931348623157E+308;
    print(n);
    bytes = doubleToList(n);
    Expect.equals("7FEFFFFFFFFFFFFF", listToHexString(bytes, true));
    
    n = -1.7976931348623157E+308;
    print(n);
    bytes = doubleToList(n);
    Expect.equals("FFEFFFFFFFFFFFFF", listToHexString(bytes, true));
  }
  
  
  void canWriteNonNumbersFloat() {
    double n = 1.0/0.0;
    List<int> bytes = floatToList(n);
    Expect.equals("7F800000", listToHexString(bytes, true));

    n = -1.0/0.0;
    bytes = floatToList(n);
    Expect.equals("F8000000", listToHexString(bytes, true));

    n = 0.0/0.0;
    bytes = floatToList(n);
    Expect.equals("7F800001", listToHexString(bytes, true));
  }
  
  void canWriteNonNumbersDouble() {
    double n = 1.0/0.0;
    List<int> bytes = doubleToList(n);
    Expect.equals("7FF0000000000000", listToHexString(bytes, true));

    n = -1.0/0.0;
    bytes = doubleToList(n);
    Expect.equals("FFF0000000000000", listToHexString(bytes, true));

    n = 0.0/0.0;
    bytes = doubleToList(n);
    Expect.equals("FFF0000000000001", listToHexString(bytes, true));
  }
  
  void runAll() {
    canWriteZeroFloat();
    canWriteZeroDouble();
    canWriteOneOrGreaterFloat();
    canWriteOneOrGreaterDouble();
    canWriteLessThanOneFloat();
    canWriteLessThanOneDouble();
    canWriteNonNumbersFloat();
    canWriteNonNumbersDouble();
  }
}
