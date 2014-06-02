library tetra;
import 'init.dart';
import 'board.dart';
import 'score.dart';

class Tetra
{
  int color,x,y,r,dx, dy;
  List<List<int>> brick;
  Tetra(){nextcolor = random.nextInt(SUM);}
  void create(Board inBoard)
  {
    x=5;y=0;r=0;
    color = nextcolor;
    nextcolor = random.nextInt(SUM);
    brick = shape[color][r];
    var cnt=0;
    while(check(inBoard)){  y--; }
    getPreview(inBoard);
    paintPreviewBox();
    debugg++;
  }
  void getPreview(Board inBoard)
  {
    dx = x;
    dy = y;
    while(!checkPreview(inBoard)) dy++;
    dy--;
    print("$debugg getPreview $dx $dy");
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
  void toBottom(Board inBoard)
  {
    while(!check(inBoard))  y++;
    y--;
  }
  void down(Board inBoard)
  {
    y++;
    if(check(inBoard)) y--;
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
    var cnt=0;
    for(int i=0 ; i<5 ; i++)
      for(int j=0 ; j<5 ; j++)
        if(brick[i][j]==BGC)  continue;
        else if(x-2+i>=0&&x-2+i<ROW&&y-2+j>=0 && y-2+j<COL && inBoard.colorBoard[x-2+i][y-2+j]!=BGC){return true;}
        else if(x-2+i<0 || x-2+i>=ROW || y-2+j>=COL)return true;
    return false;
  }
  bool checkPreview(Board inBoard)
  {
    var cnt=0;
    for(int i=0 ; i<5 ; i++)
      for(int j=0 ; j<5 ; j++)
        if(brick[i][j]==BGC)  continue;
        else if(dx-2+i>=0 && dx-2+i<ROW && dy-2+j>=0 && dy-2+j<COL && inBoard.colorBoard[dx-2+i][dy-2+j]!=BGC){return true;}
        else if(dx-2+i<0 || dx-2+i>=ROW || dy-2+j>=COL)return true;
    return false;
  }
  void fixed(Board inBoard)
  {
    inBoard.unPreview(this);
    inBoard.doPaint(this);
    for(int i=0 ; i<5 ; i++)
      for(int j=0 ; j<5 ; j++)
        if(brick[i][j]!=BGC && y-2+j<0){ gameOver();  return;}
    score(inBoard);
    usr.timeReset();
    print("new");
    this.create(inBoard);
    inBoard.unPreview(this);
    inBoard.doPreview(this);
    inBoard.doPaint(this);
  }
}