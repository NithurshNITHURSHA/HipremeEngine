/*
Copyright: Marcelo S. N. Mancini (Hipreme|MrcSnm), 2018 - 2021
License:   [https://creativecommons.org/licenses/by/4.0/|CC BY-4.0 License].
Authors: Marcelo S. N. Mancini

	Copyright Marcelo S. N. Mancini 2018 - 2021.
Distributed under the CC BY-4.0 License.
   (See accompanying file LICENSE.txt or copy at
	https://creativecommons.org/licenses/by/4.0/
*/

module hip.view.bitmaptestscene;
version(Test):
import hip.graphics.g2d.tilemap;
import hip.event.handlers.keyboard_layout;
import hip.hiprenderer;
import hip.graphics.g2d;
import hip.graphics.mesh;
import hip.event.handlers.keyboard;
import hip.console.log;
import hip.view.scene;
import hip.font.bmfont;


class BitmapTestScene : Scene
{
    HipTextRenderer txt;
    static KeyboardLayout abnt2;
    this()
    {
        txt = new HipTextRenderer(null);
        abnt2 = new KeyboardLayoutABNT2();
        txt.setFont(HipBitmapFont.fromFile("assets/fonts/arial.fnt"));
    }

    override void render()
    {
        HipRenderer.setColor(0,0,0,255);
        HipRenderer.clear(); 
        // string _txt = txt.text;
        // string input = KeyboardHandler.getInputText(abnt2);
        // _txt~= input;
        // txt.setText(_txt);
        txt.draw("Hello World", 0, 0);
        txt.render();
        txt.mesh.shader.setFragmentVar("FragBuf.uColor", cast(float[4])[1.0, 1.0, 0.0, 1.0]);
    }
}