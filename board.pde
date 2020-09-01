public class Board
{
  public int n = 9;
  public int s = width / n;
  public float off = 0.15 * height;
  public int[][] grid = new int[9][9];
  public int[][] grid2 = new int[9][9];
  
  public Board(int[][] grid)
  {
    this.grid = grid;
    for(int i = 0; i < 9;i++)
      for(int j = 0; j < 9;j++)
        grid2[i][j] = grid[i][j];
  }
  
  public void make()
  {
    stroke(200);
    strokeWeight(2);
    
    // to create lines
    for(int i = 1;i < n; i++)
    {
      line(s * i, off, s * i , width + off);
      // vertical lines
      line(0, s * i + off, width, s * i + off);
      // horizontal lines
    }
    
    // to create a tic tac toe design red coloured
    strokeWeight(5);
    stroke(255,0,0);
    line(s * 3, off, s * 3, width + off);
    line(s * 6, off, s * 6, width + off);
    line(0, s * 3 + off, width, s * 3 + off);
    line(0, s * 6 + off, width, s * 6 + off);
    
  }
  
  public void click(int btn)
  {
    int x = mouseX;
    int y = mouseY;
    
    for(int i = 0; i < 9;i++)
    {
      for(int j = 0; j < 9;j++)
      {
        if(grid2[i][j] == 0 && x < (i+1) * s && y < off + (j+1) * s && x > i*s && y > off + j*s)
        {
          // to uncolor all the unselected sqs
          colorSq();
          
          // to color the selected sq
          fill(100);
          noStroke();
          rect(i*s, off + j*s, s, s);
          addNo(i,j, btn);
          
          break;
        }
      }
    }
  }
  
  // to color all the empty sq which are unselected
  public void colorSq()
  {
    // for all rows and cols except 1st row and 1st col
    for(int i = 1; i < 9;i++)
      for(int j = 1; j < 9;j++)
        if(grid[i][j] == 0)
        {
          fill(41,44,52);
          rect(i*s + 2, off + j*s + 2, s - 2, s - 2);
          noStroke();
        }
    
    for(int i = 0; i < 9;i++)
    {
      // for 1st row
      if(grid[i][0] == 0)
      {
        fill(41,44,52);
        rect(i*s, off, s, s);
        noStroke();
      }
      // for 1st col
      if(grid[0][i] == 0)
      {
        fill(41,44,52);
        rect(0, off + i*s, s, s);
        noStroke();
      }
    }
  }
  
  public void addNo(int i, int j, int btn)
  {
    if(btn != 10)
    {
      grid[i][j] = btn;
    }
    else
    {
     if(grid2[i][j] == 0 && grid[i][j] != 0)
        grid[i][j] = 0;
    }
  }
}
