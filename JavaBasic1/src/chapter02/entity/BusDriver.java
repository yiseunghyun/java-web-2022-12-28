package chapter02.entity;

public class BusDriver extends People{
	// 버스 차종
		public String vehicleModel;
		// 지역
		public String busNumber;
		
		public BusDriver() {
			super("John doe", "man");
		}

}
