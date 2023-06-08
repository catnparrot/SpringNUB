package polymorphism_4;

public class SamsungTV implements TV {
	private SonySpeaker speaker;
	
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
		speaker=new SonySpeaker();
		speaker.volumeup();
	}
	
	public void volumeDown() {
		speaker=new SonySpeaker();
		speaker.volumeDown();
	}
}
