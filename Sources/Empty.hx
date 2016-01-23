package;
import haxe.Timer;
import kha.Assets;
import kha.audio1.Audio;
import kha.Color;
import kha.Framebuffer;
import kha.Image;
import kha.input.Gamepad;
import kha.input.Keyboard;
import kha.input.Mouse;
import kha.Key;
import kha.math.Random;
import kha.Scaler;
import kha.Scheduler;
import kha.ScreenCanvas;
import kha.Sound;
import kha.System;
import libdrp.Drp;
import TestScene;

class Empty {
	private var initialized: Bool = false;
	private var backbuffer: Image;

	public var drp:Drp;

	public function new() {
		untyped document.addEventListener('mousewheel', function(e) { if(e.ctrlKey) {e.preventDefault();}});
		Assets.loadEverything(loadingFinished);
	}
	
	private function loadingFinished(): Void {
		drp = new Drp();
		//drp.mouse();
		drp.touch();
		drp.addScene("testScene",new TestScene(drp));
		drp.setScene("testScene");
		backbuffer = Image.createRenderTarget(160, 120);
		initialized = true;
	}

	public function render(framebuffer: Framebuffer): Void {
		if (!initialized) return;
		drp.setInputScale(framebuffer,backbuffer);
		var g = backbuffer.g2;
		g.begin(Color.White);
		g.color = Color.White;
		
		drp.currentScene.render(g);

		g.end();
		framebuffer.g2.begin();
		Scaler.scale(backbuffer, framebuffer, System.screenRotation);
		framebuffer.g2.end();
	}
	
	public function update(): Void {
		if (!initialized) return;
		drp.currentScene.update(1/60);
	}
}
