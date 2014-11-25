library numerical_collection;

import 'dart:math';

class NumericalList implements List<num> {

  List<num> _elems ;
  
  NumericalList([int initialSize]) {
    _elems = initialSize == null ? null : new List(initialSize) ;
  }
  
  NumericalList.fromList( List<num> l ) {
    _elems = new List.from(l) ;
  }
  
  NumericalList.fromStrings( List<String> listStrings ) {
    _elems = new List<num>( listStrings.length ) ;
    
    int sz = listStrings.length ;
    
    for (int i = 0 ; i < sz ; i++) {
      _elems[i] = num.parse(listStrings[i]) ;
    }
  }

  @override
  num operator [](int index) => _elems[index] ;

  @override
  void operator []=(int index, num value) {
    _elems[index] = value ;
  }

  @override
  void add(num value) => _elems.add(value) ;

  @override
  void addAll(Iterable<num> iterable) => _elems.addAll(iterable) ;

  @override
  bool any(bool test(num element)) => _elems.any(test) ;

  @override
  Map<int, num> asMap() => _elems.asMap() ;
  
  @override
  void clear() {
    _elems.clear() ;
  }

  @override
  bool contains(Object element) => _elems.contains(element) ;

  @override
  num elementAt(int index) => _elems.elementAt(index) ;

  @override
  bool every(bool test(num element)) => _elems.every(test) ; 

  @override
  Iterable expand(Iterable f(num element)) => _elems.expand(f) ;

  @override
  void fillRange(int start, int end, [num fillValue]) {
    _elems.fillRange(start, end) ;
  }

  @override
  num get first => _elems.first ;

  @override
  num firstWhere(bool test(num element), {num orElse()}) => _elems.firstWhere(test) ;

  @override
  fold(initialValue, combine(previousValue, num element)) => _elems.fold(initialValue, combine) ;

  @override
  void forEach(void f(num element)) => _elems.forEach(f) ;

  @override
  Iterable<num> getRange(int start, int end) => _elems.getRange(start, end) ;
  
  @override
  int indexOf(num element, [int start = 0]) => _elems.indexOf(element) ;

  @override
  void insert(int index, num element) => _elems.insert(index, element) ;

  @override
  void insertAll(int index, Iterable<num> iterable) {
    _elems.insertAll(index, iterable) ;
  }

  @override
  bool get isEmpty => _elems.isEmpty ;

  @override
  bool get isNotEmpty => _elems.isNotEmpty ;

  @override
  Iterator<num> get iterator => _elems.iterator ;

  @override
  String join([String separator = ""]) => _elems.join(separator) ;

  @override
  num get last => _elems.last ;

  @override
  int lastIndexOf(num element, [int start]) => _elems.lastIndexOf(element) ;

  @override
  num lastWhere(bool test(num element), {num orElse()}) => _elems.lastWhere(test) ;

  @override
  void set length(int newLength) {
    _elems.length = newLength ;
  }

  @override
  int get length => _elems.length ;

  @override
  Iterable map(f(num element)) => _elems.map(f) ;

  @override
  num reduce(num combine(num value, num element)) => _elems.reduce(combine) ;

  @override
  bool remove(Object value) => _elems.remove(value) ;

  @override
  num removeAt(int index) => _elems.removeAt(index) ;

  @override
  num removeLast() => _elems.removeLast() ;

  @override
  void removeRange(int start, int end) {
    _elems.removeRange(start, end) ;
  }

  @override
  void removeWhere(bool test(num element)) {
    _elems.removeWhere(test) ;
  }

  @override
  void replaceRange(int start, int end, Iterable<num> replacement) {
    _elems.replaceRange(start, end, replacement) ;
  }

  @override
  void retainWhere(bool test(num element)) {
    _elems.retainWhere(test) ;
  }

  @override
  Iterable<num> get reversed => _elems.reversed ;

  @override
  void setAll(int index, Iterable<num> iterable) {
    _elems.setAll(index, iterable) ;
  }

  @override
  void setRange(int start, int end, Iterable<num> iterable, [int skipCount = 0]) {
    _elems.setRange(start, end, iterable) ;
  }

  @override
  void shuffle([Random random]) {
    _elems.shuffle(random) ;
  }

  @override
  num get single => _elems.single ;

  @override
  num singleWhere(bool test(num element)) => _elems.singleWhere(test) ;

  @override
  Iterable<num> skip(int n) => _elems.skip(n) ;

  @override
  Iterable<num> skipWhile(bool test(num value)) => _elems.skipWhile(test) ;

  @override
  void sort([int compare(num a, num b)]) => _elems.sort(compare) ;

  @override
  List<num> sublist(int start, [int end]) => _elems.sublist(start, end) ;

  @override
  Iterable<num> take(int n) => _elems.take(n) ;

  @override
  Iterable<num> takeWhile(bool test(num value)) => _elems.takeWhile(test) ;

  @override
  List<num> toList({bool growable: true}) => _elems.toList(growable: growable) ;

  @override
  Set<num> toSet() => _elems.toSet() ;

  @override
  Iterable<num> where(bool test(num element)) => _elems.where(test) ;
  
  ///////////////////////////////////////////
  
  int binarySearch(num key) => NumericalTools.binarySearch(_elems, key) ;
  
  void insertSorted(num val) {
    
    int idx = binarySearch(val) ;
    
    if (idx >= 0) {
      _elems.insert(idx , val) ;
    }
    else {
      _elems.insert( (-idx)-1 , val) ;
    }
    
  }
  
  void insertSortedCheckEnd(num val) {
    
    if ( _elems.isEmpty || Comparable.compare( _elems.last , val ) <= 0 ) {
      _elems.add(val) ;
    }
    else {
      insertSorted(val) ;
    }
    
  }
  
  bool insertSortedUnique(num val) {
    
    int idx = binarySearch(val) ;
    
    if (idx >= 0) {
      return false ;
    }
    else {
      _elems.insert( (-idx)-1 , val) ;
      return true ;
    }
      
  }
  
  ///////////////////////////////////////////
  
  num calcMin() => NumericalTools.calcMin(this) ;
  num calcMax() => NumericalTools.calcMax(this) ;
  List<num> calcMinMax() => NumericalTools.calcMinMax(this) ;
  
  num calcSum() => NumericalTools.calcSum(this) ;
  num calcMean() => NumericalTools.calcMean(this) ;
  
}


class NumericalTools {
  
  static List<num> calcMinMax( List<num> l ) {
    int sz = l.length ;
    
    if (sz == 0) return null ;
    
    num min , max ;
    
    min = max = l[0] ;
    
    for (int i = 0 ; i < sz ; i++) {
      num v = l[i] ;
      
      if (v < min) min = v ;
      if (v > max) max = v ;
    }
    
    return [ min , max ] ;
  }
  
  static num calcMin( List<num> l ) {
    int sz = l.length ;
    
    if (sz == 0) return null ;
    
    num min = l[0] ;
    
    for (int i = 0 ; i < sz ; i++) {
      num v = l[i] ;
      
      if (v < min) min = v ;
    }
    
    return min ;
  }
  
  static num calcMax( List<num> l ) {
    int sz = l.length ;
    
    if (sz == 0) return null ;
    
    num max = l[0] ;
    
    for (int i = 0 ; i < sz ; i++) {
      num v = l[i] ;
      
      if (v > max) max = v ;
    }
    
    return max ;
  }
  
  static num calcMean( List<num> l ) {
    return calcSum(l) / l.length ;
  }
  
  static num calcSum( List<num> l ) {
    int sz = l.length ;
    
    if (sz == 0) return null ;
    
    num sum = 0 ;
    
    for (int i = 0 ; i < sz ; i++) {
      sum += l[i] ;
    }
    
    return sum ;
  }
  
  static int binarySearch(List<num> a, int key) {
    return binarySearchRange(a,0,a.length, key) ;
  }
  
  static int binarySearchRange(List<num> a, int fromIndex, int toIndex, int key) {
    int low = fromIndex;
    int high = toIndex - 1;

    while (low <= high) {
        int mid = (low + high) ~/ 2 ;
        int midVal = a[mid];

        if (midVal < key)
            low = mid + 1;
        else if (midVal > key)
            high = mid - 1;
        else
            return mid; // key found
    }
    
    return -(low + 1);  // key not found.
  }
  
}
