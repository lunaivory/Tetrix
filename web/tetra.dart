library tetra;
import 'init.dart';
import 'board.dart';
import 'score.dart';

class Tetra
{
  
  int color,x,y,r;
  List<List<int>> brick;

  void create(Board inBoard)
  {
    x=5;y=2;r=0;
    color = random.nextInt(SUM);
    brick = shape[color][r];
    var cnt=0;
    bool flag=false;
    for(cnt=0 ; cnt<5 ; cnt++)
    {
      for(int j=0 ; j<5 ; j++)
      {
        if(brick[j][cnt]!=BGC) flag=true; 
        if(flag) break;
      }
      if(flag)break;
    }
    y=y-cnt;
    flag = false;
    while(check(inBoard)){  y--; flag=true;}
    if(flag) y++;
  }
  void left(Board inBoard)
  {
    x--;
    if(check(inBoard))  x++;
  }
  void right(Board inBoard)
  {
    x++;
    if(check(inBoard)) x--;
  }
  void down(Board inBoard)
  {
    while(!check(inBoard))  y++;
    y--;
  }
  void rotate(Board inBoard)
  {
    
    brick=shape[color][(r=(r+1)%4)];
    if(check(inBoard)) x++;
    else return;
    if(check(inBoard)) x++;
    else return;
    if(check(inBoard)){x=x-2;x--;}
    else return;
    if(check(inBoard)){x--;}
    else return;
    if(check(inBoard)){x+=2; brick=shape[color][(r=(r+3)%4)];}
    else return;
  }
  void drop(Board inBoard)
  {
    y++;
    if(check(inBoard)){y--; fixed(inBoard);}
  }
  bool check(Board inBoard)
  {
    for(int i=0 ; i<5 ; i++)
      for(int j=0 ; j<5 ; j++)
        if(brick[i][j]==BGC)  continue;
        else if(x-2+i>=0&&x-2+i<ROW && y-2+j>=0 && y-2+j<COL && inBoard.colorBoard[x-2+i][y-2+j]!=BGC) return true;
        else if(x-2+i<0 || x-2+i>=ROW ||y-2+j<0 || y-2+j>=COL) return true;
    return false;
  }
  void fixed(Board inBoard)
  {
    inBoard.doPaint(this);
    score(inBoard);
    this.create(inBoard);
    inBoard.doPaint(this);
  }
}