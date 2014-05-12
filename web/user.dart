library user;

import 'board.dart';
import 'init.dart';
import 'tetra.dart';
import 'animator.dart';

class User implements Actor
{
  Board usrBoard;
  Tetra usrTetra;
  int _times=0;
  User(){usrBoard = new Board();}
  void createTetra()
  {
    usrTetra = new Tetra();
    usrTetra.create(usrBoard);
    usrBoard.doPaint(usrTetra);
  }
  void timeReset(){_times=0;}
  void next(num time)
  {
    if(_times>=DURATION)
    {
      usrBoard.unPaint(usrTetra);
      usrTetra.drop(usrBoard);
      usrBoard.doPaint(usrTetra);
      _times=0;
    }
    else
      _times++;
  }
}