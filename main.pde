Board b;
SudokuGen s;
Button bt;

void setup()
{
  s = new SudokuGen();
  s.generate();
  b = new Board(s.a);
  bt = new Button();
  fullScreen();
  background(41,44,52);
}

void draw()
{
  s.draw();
  bt.make();
  b.make();
  
}

void mousePressed()
{
  bt.click();
  b.click(bt.btnSelected);
  
  int x = mouseX, y = mouseY;
  if(x > 2*width/3 && y > 0.05* height && x < width - width/20 && y < 0.05* height + width/10)
    setup(); 
}


