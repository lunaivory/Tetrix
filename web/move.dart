library move;
import 'init.dart';
import 'dart:html';
import 'board.dart';
import 'tetra.dart';
import 'user.dart';

void toMove(Tetra inTetra, Board inBoard)
{
  var keyListener = document.onKeyDown.listen
      (
        (KeyboardEvent evt)
        {
          if(end) return;
          var oldTetra;
          oldTetra = inTetra;
          inBoard.unPaint(inTetra);
          switch(evt.keyCode)
          {
            case LEFT:
              inTetra.left(inBoard);
              break;
            case RIGHT:
              inTetra.right(inBoard);
              break;
            case DOWN:
              inTetra.down(inBoard);
              usr.timeReset();
              break;
            default://ROTATE
              inTetra.rotate(inBoard);
              break;
          }
          inBoard.doPaint(inTetra);
        }
      );
}
