package polymorphism_3;

public class SamsungTV implements TV {
	public void initMethod() {
		System.out.println("object initiated");
	}
	
	public void destroyMethod() {
		System.out.println("object deleted after processing the logic");
	}
	
	public SamsungTV() {
		System.out.println("===> Samsung object created");
	}
	
	public void powerOn() {
		System.out.println("SamsungTV---전원 켠다.");
	}
	
	public void powerOff() {
		System.out.println("SamsungTV---전원 끈다.");
	}
	
	public void volumeUp() {
		System.out.println("SamsungTV---소리 올린다.");
	}
	
	public void volumeDown() {
		System.out.println("SamsungTV---소리 내린다.");
	}
}
