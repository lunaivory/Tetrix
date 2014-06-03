library score;

import 'board.dart';
import 'user.dart';
import 'init.dart';
import 'dart:html';
import 'dart:js';

void score(Board inBoard)
{
  int toDelete=0;
  bool full, empty;
  int move=COL-1;
  for(int i=COL-1; i>=0&&i<COL ; i--)
  {
    full = false;
    empty= false;
    for(int j=0 ; j<ROW&&(!full) ; j++) if(inBoard.colorBoard[j][i]==BGC){ full=true; }
    if(!full){toDelete++;levelCnt++; continue;}
    for(int j=0 ; move>=0&&j<ROW ; j++) inBoard.colorBoard[j][move] = inBoard.colorBoard[j][i];
    move--;
  }
  if(toDelete!=0) {inBoard.rePaint();
  var remove_sound = new JsObject(context['remove_sound'],[0]);}
  scoreSum += toDelete*scoreMultiplier;
  if(toDelete!=0 && levelCnt>LEVEL*3){  DURATION=DURATION-5; LEVEL++;  scoreMultiplier=scoreMultiplier+50;}
  scoreBox.text = scoreSum.toString();
  levelBox.text = LEVEL.toString();
  
}



