import kha.graphics2.Graphics;
import kha.Assets;
import libdrp.Drp;

class Spider {
	private var drp:Drp;
	var x:Int;
	var y:Int;
	var testFinger:Int;
	public function new(drp:Drp,testFinger){
		this.drp = drp;
		this.testFinger = testFinger;
		x = Std.int(Math.random() * 160);
		y = Std.int(Math.random() * 120);
	}

	public function render(g:Graphics)
	{
		if(drp.touchFinger[testFinger] == true)g.drawImage(Assets.images.spider,drp.touchX[testFinger],drp.touchY[testFinger]);
	}
	
	public function update(delta:Float)
	{
		//x += Std.int(Math.random() * 2)-1;
		//y += Std.int(Math.random() * 2)-1;
	}
}