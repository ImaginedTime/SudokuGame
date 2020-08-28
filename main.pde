Board b;
SudokuGen s;
Button bt;
String lvl = "Easy";
void setup()
{
  s = new SudokuGen();
  s.generate(lvl);
  b = new Board(s.grid);
  bt = new Button();
  fullScreen();
  background(41,44,52);
  b.make();
}

void draw()
{
  s.draw();
  bt.make(lvl);
  b.make();
}

void mousePressed()
{
  bt.click();
  b.click(bt.btnSelected);
  int x = mouseX, y = mouseY;
  if(x > 2*width/3 && y > 0.05* height && x < width - width/20 && y < 0.05* height + width/10)
    setup(); 
  else if(x > width/20 && y > 0.05 * height && x < width/3 && y < 0.05 * height + width/10)
  {
    if(lvl.equals("Easy"))
      lvl = "Medium";
    else if(lvl.equals("Medium"))
      lvl = "Hard";
    else if(lvl.equals("Hard"))
      lvl = "Easy";
      
    setup();
  }
}

