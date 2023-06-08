package polymorphism_4_3;

public class SonySpeaker implements Speaker {
	public SonySpeaker() {
		System.out.println("===>SonySpeaker object created");
	}
	
	public void volumeup() {
		System.out.println("SonySpeaker---소리 올린다.");
	}
	
	public void volumeDown() {
		System.out.println("SonySpeaker---소리 내린다.");
	}
}
