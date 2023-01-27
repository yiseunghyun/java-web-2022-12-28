package chapter_01;

public class Example01 {

	public static void main(String[] args) {
		//한줄주석
		/*부분주석*/
		//변수
		//데이터를 저장하는 메모리 공간  (변경가능)
		//데이터타입 변수명; (변수 선언)
		int number;
		number = 10;
		System.out.println(number);
		
		char character = 'a';
		System.out.println(character);
//		char void;
		
		//상수
		//데이터를 저장하는 메모리 공간 (변경불가능)
		//final 데이터타입 상수명 = 데이터; (상수선언)
		final double PI = 3.14; /*리터널 상수값*/
		System.out.println(PI);
//		PI = 12;
	}

}
