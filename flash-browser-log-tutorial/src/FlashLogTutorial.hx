package ;

import nme.Lib;
import nme.display.Sprite;
import nme.display.Stage;
import nme.events.MouseEvent;
import nme.text.TextField;
#if (flash)
import nme.external.ExternalInterface;
#end

class FlashLogTutorial extends Sprite {
  public var count = 0;
  public var labelText:TextField;
  public var countText:TextField;

  public function new() {
    super();

    var sp:Sprite = new Sprite();
    sp.graphics.beginFill(0x0000FF);
    sp.graphics.drawRect(0,0,300,200);
    addChild(sp);

    labelText = new TextField();
    labelText.width = 300;
    labelText.text = "Click anywhere in the box";
    sp.addChild(labelText);

    countText = new TextField();
    countText.text = Std.string(count);
    countText.x = 30;
    countText.y = 30;
    sp.addChild(countText);

    add_site_link(sp, 500, 380);

    sp.addEventListener(MouseEvent.CLICK, onClick);
  }

  public function onClick(inEvent:MouseEvent) {
    count++;
    countText.text = Std.string(count);
    trace("Log:Clicked " + count);
  }

  public static function main () {
    var flashLogTutorial:FlashLogTutorial = new FlashLogTutorial();
    Lib.current.addChild(flashLogTutorial);
    Lib.current.stage.scaleMode = nme.display.StageScaleMode.SHOW_ALL;
  }

  public static function add_site_link(parent:Sprite, x:Int, y:Int) {
    var sp:Sprite = new Sprite();
    var siteText:TextField = new TextField();
    siteText.text = "infoheap.com";
    sp.addChild(siteText);
    sp.x = x;
    sp.y = y;
    #if (flash)
      var url = "http://infoheap.com/";
      var fn:Dynamic = function() {
        if (ExternalInterface.available) {
          flash.Lib.getURL(new flash.net.URLRequest(url), "_blank");
        }
      }
      sp.addEventListener(MouseEvent.CLICK, fn);
      sp.buttonMode = true;
    #end
    parent.addChild(sp);
  }
}
