package chapter03.utill;

public class UtilExample01 {
	
	static final int NUMBER = 10;
	
	int add(int a, int b) {
		return a + b;
		
	}
	int pow(int a, int b) {
		for( int i = 0; i < b; i++) a *= a;
		return a;
	}

}
