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
          if(evt.keyCode != PKEY &&pause) return;
          print("$debugg move1");
          inBoard.unPaint(inTetra);
          inBoard.unPreview(inTetra);
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
            case UP://ROTATE
              inTetra.rotate(inBoard);
              break;
            case ALT:
              inTetra.toBottom(inBoard);
              inTetra.fixed(inBoard);
              usr.timeReset();
              break;
            case PKEY:
              if(!end) pause = !pause;
              break;
            default:
              break;
          }
          print("$debugg move2");
          inBoard.unPreview(inTetra);
          inBoard.doPreview(inTetra);
          inBoard.doPaint(inTetra);
        }
      );
}
