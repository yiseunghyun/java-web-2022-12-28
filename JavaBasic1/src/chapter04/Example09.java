package chapter04;

class Ticketing {
	static int ticketVolume = 1;
	// synchronized 키워드로 해당 메서드를 동기 메서드로 지정
	// 한 스레드가 해당 메서드를 작업 중일 땐 접근을 막음
	public static synchronized void ticketing() {
		if  (ticketVolume > 0) {
			System.out.println(Thread.currentThread().getName()+ " - 티케팅!");
			ticketVolume--;
		}else {
			System.out.println(Thread.currentThread().getName()+ " - 티케팅실패!");
		}
		System.out.println(Thread.currentThread().getName()+ " - 티케팅 시도 후 티켓 수 :" + ticketVolume);
		
	}
}

class TicketingThread implements Runnable{
	
	Ticketing ticketing = new Ticketing();
	
	@Override
	public void run() {
		Ticketing.ticketing();
	}
	
}
public class Example09 {

	public static void main(String[] args) {
		
		TicketingThread runnable = new TicketingThread();
		Thread thread1 = new Thread(runnable, "a");
		Thread thread2 = new Thread(runnable, "b");
		Thread thread3 = new Thread(runnable, "c");
		
		thread1.start();
		thread2.start();
		thread3.start();
	}

}
