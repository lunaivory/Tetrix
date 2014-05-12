library score;

import 'board.dart';
import 'user.dart';
import 'init.dart';
import 'dart:html';

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
    if(!full){toDelete++; continue;}
    for(int j=0 ; move>=0&&j<ROW ; j++) inBoard.colorBoard[j][move] = inBoard.colorBoard[j][i];
    move--;
  }
  if(toDelete!=0) inBoard.rePaint();
  scoreSum += toDelete*scoreMultiplier;
  if(toDelete!=0 && (scoreSum/100)%3==0){  DURATION=DURATION-5; LEVEL++;  scoreMultiplier=scoreMultiplier+50;}
  scoreBox.text = "score : "+scoreSum.toString()+"\n"+"Level "+LEVEL.toString();
  
}



