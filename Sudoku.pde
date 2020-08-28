import java.util.*;
public class SudokuGen
{
  public int[][] grid = new int[9][9];
  final int max = 8;
  final int min = 0;

  final int digitMax = 9;
  final int digitMin = 1;

  final int easyMin = 36;
  final int easyMax = 49;

  final int mediumMin = 32;
  final int mediumMax = 35;

  final int hardMin = 22;
  final int hardMax = 27;

  
  public void generate(String option)
  {
    
    Random random = new Random();
    
    int row = 0;
    int col = 0;

    int randomNumber = 0;
    int noOfCellsToBeGenerated = 0;

    if ("Easy".equals(option))
            noOfCellsToBeGenerated = random.nextInt((easyMax - easyMin) + 1) + easyMin;
    
    else if ("Medium".equals(option))
            noOfCellsToBeGenerated = random.nextInt((mediumMax - mediumMin) + 1) + mediumMin;
   
    else 
            noOfCellsToBeGenerated = random.nextInt((hardMax - hardMin) + 1) + hardMin;

    for (int i = 1; i <= noOfCellsToBeGenerated; i++) 
    {
      row = random.nextInt((max - min) + 1) + min;
      col = random.nextInt((max - min) + 1) + min;
      randomNumber = random.nextInt((digitMax - digitMin) + 1) + digitMin;

      if (grid[row][col] == 0 && noConflict(grid, row, col, randomNumber))
          grid[row][col] = randomNumber;
      else
          i--;

    }

  }
  
  public boolean noConflict(int[][] array, int row, int col, int num) 
  {
    for(int i = 0; i < 9; i++) 
    {
      if(array[row][i] == num)
         return false;
      if(array[i][col] == num)
         return false;
    }

    int gridRow = row - (row % 3);
    int gridColumn = col - (col % 3);
    for(int p = gridRow; p < gridRow + 3; p++)
      for(int q = gridColumn; q < gridColumn + 3; q++)
        if(array[p][q] == num)
           return false;
           
    return true;
  }
  
  // to draw the sudoku on the canvas
  public void draw()
  {
    int s = width / 9;
    float off = 0.15 * height;
    for(int i = 0; i < 9; i++)
    {
      for(int j = 0; j < 9;j++)
      {
        if(grid[i][j] != 0)
        {
          fill(255);
          textSize(2 * s / 3);
          text(grid[i][j], s * (i + 0.3), s * (j + 0.75) + off);
        }// if closed
      }// j - loop closed 
    }// i - loop closed
    
  }//draw() function closed
 
}// class closed