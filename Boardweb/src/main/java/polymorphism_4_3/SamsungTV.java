package polymorphism_4_3;

public class SamsungTV implements TV {
	private Speaker speaker;
	private int price;
	
	public SamsungTV() {
		System.out.println("===> SamsungTV(1) object created");
	}
	
	public void setSpeaker(Speaker speaker) {
		System.out.println("===> setSpeaker() called");
		this.speaker = speaker;
	}
	
	public void setPrice(int price) {
		System.out.println("===> setPrice() called");
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
