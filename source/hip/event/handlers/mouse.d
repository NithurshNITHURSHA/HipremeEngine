module hip.event.handlers.mouse;
public import hip.api.input.mouse;
import hip.math.vector;
import hip.event.handlers.button;
import hip.error.handler;
import hip.util.data_structures;
import hip.util.reflection;

// class HipMouse : IHipMouse
class HipMouse
{
    Vector2[] positions;
    Vector2[] lastPositions;
    Vector3 scroll;
    HipButtonMetadata[enumLength!HipMouseButton] metadatas;
    this()
    {
        positions = new Vector2[](1); //Start it with at least 1
        lastPositions = new Vector2[](1); //Start it with at least 1
        positions[0] = Vector2(0,0);
        lastPositions[0] = Vector2(0,0);
        foreach(i; 0..enumLength!HipMouseButton)
            metadatas[i] = new HipButtonMetadata(cast(int)i);
    }

    void setPressed(HipMouseButton btn, bool pressed)
    {
        metadatas[cast(int)btn].setPressed(pressed);
    }
    bool isJustPressed(HipMouseButton btn){return metadatas[btn].isJustPressed;}
    bool isJustReleased(HipMouseButton btn){return metadatas[btn].isJustReleased;}
    void setPosition(float x, float y, uint id = 0)
    {
        if(id+1 > positions.length)
            positions.length = id+1;
        if(id+1 > lastPositions.length)
        {
            lastPositions.length = id+1;
        }
        lastPositions[id] = positions[id];
        ErrorHandler.assertExit(id < positions.length, "Touch ID out of range");
        positions[id].x=x;
        positions[id].y=y;
    }
    void setScroll(float x, float y, float z)
    {
        scroll.x=x;
        scroll.y=y;
        scroll.z=z;
    }
    bool isPressed(HipMouseButton btn = HipMouseButton.left){return metadatas[btn].isPressed;}

    ///Use the ID for getting the touch, may return null
    Vector2 getPosition(uint id = 0)
    {
        if(id > positions.length) return Vector2.zero;
        return positions[id];
    }
    Vector2 getDeltaPosition(uint id = 0)
    {
        if(id > positions.length) return Vector2.zero;

        return positions[id] - lastPositions[id];
    }
    Vector3 getScroll(){return scroll;}

    void postUpdate()
    {
        for(int i = 0; i < metadatas.length; i++)
            metadatas[i]._isNewState = false;
    }
}