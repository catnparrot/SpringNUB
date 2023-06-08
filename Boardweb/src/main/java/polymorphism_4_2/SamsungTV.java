package polymorphism_4_2;

public class SamsungTV implements TV {
	private Speaker speaker;
	private int price;
	
	public SamsungTV() {
		System.out.println("===> SamsungTV(1) object created");
	}
	
	public SamsungTV(Speaker speaker) {
		System.out.println("===> SamsungTV(2) object created");
		this.speaker = speaker;
	}
	
	public SamsungTV(Speaker speaker, int price) {
		System.out.println("===> SamsungTV(3) object created");
		this.speaker = speaker;
		this.price = price;
	}

	public void powerOn() {
		System.out.println("SamsungTV---전원 켠다. (가격: " + price +")");
	}
	
	public void powerOff() {
		System.out.println("SamsungTV---전원 끈다.");
	}
	
	public void volumeUp() {
		speaker.volumeup();
	}
	
	public void volumeDown() {
		speaker.volumeDown();
	}
}
