package chapter02;

class MyMath {
	// 정삼각형의 면적을 구하는 메서드
	static double getEquilaterlTriangleArea (double side) {
		// 매개변수 검증
		if(side <= 0) return 0;
		
		double result = (Math.sqrt(3) / 4) * Math.pow(side, 2);
		return result;
	}
	
	// 정삼각형의 높이를 구하는 메서드
	static double getEquilaterlTriangleHeight(double side) {
		// 매개변수 검증
		if (side <=0) return 0;
		
		double getEquilaterlTriangleHeight = (Math.sqrt(3) / 2) * side;
		return getEquilaterlTriangleHeight;
	}
	
	// 
	static int increase(int Number) {
		Number++;
		System.out.println("In of Mathod");
		System.out.println(Number);
		return Number;
	}
	static void increaseTriangle(Triangle triangle) {
		triangle.base++;
		triangle.height++;
		triangle.diagonal++;
	}
}

public class Example03 {

	public static void main(String[] args) {
		double side = 10.0;
		double getEquilaterlTriangleArea = MyMath.getEquilaterlTriangleArea(side);
		System.out.println(getEquilaterlTriangleArea);
		
		double getEquilaterlTriangleHeight = MyMath.getEquilaterlTriangleHeight(-10);
		System.out.println(getEquilaterlTriangleHeight);
	
		int Number = 10;
		int afterNumber = MyMath.increase(Number);
		System.out.println("Out of Method");
		System.out.println(Number);
		Number = MyMath.increase(Number);
		
		Triangle triangle = new Triangle();
		triangle.createAndPrint();
		
		MyMath.increaseTriangle(triangle);
		System.out.println(triangle.base);
	} 
}


