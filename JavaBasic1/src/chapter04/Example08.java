package chapter04;

// Thread 클래스를 상속받아서 Thread를 만드는 방법
class Thread1 extends Thread{
	// run을 override해서 작업할 내용을 구현
	public void run() {
		for (int i = 0; i < 20; i++) {
			System.out.println("*");
//			for( int j = 0; j < 100000; j++) {}		
		}
	}
}
// Runnable 인터페이스를 구현해서 Thread를 만드는 방법

class Thread2 implements Runnable{
// 	Runnable 인터페이스의 추상메서드 run을 구현
	@Override
	public void run() {
		for (int i = 0; i < 20; i++) {
			System.out.println("#");
			// Thread.yidld()는 자신의 시간을
			// 다음순번의 Thread에 양보
			Thread.yield();
//			for( int j = 0; j < 100000; j++) {}
		}
	}
	
}

class CountDown  extends Thread {
	public void run() {
		//  Thread.sleep() : 지정한 시간동안 해당스레드르 blocked상태로 만듬
		for(int i = 10; i > 0; i--) {
			System.out.println(i + "초 ...");
			try {
				// 해당 슬레드를 1초동안 Blocked 상태로만듬
				// Blocked 상태 : 실행중 이지만 CPU 스케줄러에 선택은 받지 못하는상태
				Thread.sleep(1000);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("X");
		
 	}
}
public class Example08 {
	public static void main(String[] args){
		Thread1 thread1 = new Thread1();
		// runnable 인터페이스를 구현한 클래스의 경ㅇ우
		// Thread 클래스의 생성자의 인자로 담아서 Thread 인스턴스를 생성한 후 사용가능
		Thread2 thread2 = new Thread2();
		Thread thread = new Thread(thread2);
		
		// Thread 클래스이 setPriority 메서드로 우선순위 지정
		// 우선순위를 지정하지않으면 기본값으로 5
//		thread1.setPriority(1);
//		thread.setPriority(9);
//		// 상속받은 Thread 클래스의 start() 메서드로 해당 Thread를 실행
		thread1.start();
		
		try {
			thread1.join();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		thread.start();
		
		try {
			thread.join();
		} catch(Exception e) {
			e.printStackTrace();
		}
//		for (int i = 0; i < 20; i++) {
//			System.out.println("@");
//		for( int j = 0; j < 100000; j++) {}
//		}

//	CountDown countDown = new CountDown();
//	countDown.start();
	}
}
