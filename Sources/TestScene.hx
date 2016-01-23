package;
import kha.graphics2.Graphics;
import libdrp.Scene;
import libdrp.Drp;
import Spider;

class TestScene extends Scene{
	private var drp:Drp;
	var spiders:Array<Spider>;
	public function new(drp:Drp)
	{
		super();
		this.drp = drp;
		spiders = new Array<Spider>();
		
		for(i in 0...10)
		{
			spiders[i] = new Spider(drp,i);
		}
		
	}

	override public function render(g:Graphics)
	{
		for(i in 0...spiders.length)
		{
			spiders[i].render(g);
		}
	}
	
	override public function update(delta:Float)
	{
		for(i in 0...spiders.length)
		{
			spiders[i].update(delta);
		}
	}
	
	override public function destroy()
	{
		
	}
}