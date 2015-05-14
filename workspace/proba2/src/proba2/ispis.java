package proba2;

public class ispis {
	int x,y;
	
	public ispis(int x,int y) {
		
		this.x = x;
		this.y = y;
		
	}
	
	public String toString() {
		
		return "prvi: "+ x + " drugi :" + y;
	}
	
public static void main(String[] args){
	
		System.out.println("sup");
		ispis ispis1 = new ispis(2,3);
		System.out.println(ispis1.toString());
		
		
		
	}

	

}
