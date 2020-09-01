import java.util.*;
public class SudokuGen
{
 int a[][] = new int[9][9];
 int a2[][] = new int[9][9];
 public void generate()
 {
   int counter=1,k1,k2;
   	gen();
   	random_gen(1);
   	random_gen(0);
   
   for(int i = 0; i < 9;i++)
   {
     for(int j = 0; j < 9;j++)
     {
       a2[i][j] = a[i][j];
     }
   }
   
   Random rand=new Random();
   int n[]={0,3,6};
   for(int i=0;i<2;i++)
  	 {
    	  k1=n[rand.nextInt(n.length)];
      do{
       	  k2=n[rand.nextInt(n.length)];
      }while(k1==k2);
    	  
      	if(counter==1)
      		row_change(k1,k2);
      	else 
      		col_change(k1,k2);  
     	 counter++;
   	 }
   int max=8;
   int min=0;

    //Striking out
    for(k1=0;k1<9;k1++)
    	{
        for(k2=0;k2<9;k2++)
       		strike_out(k1,k2);
  	  }
    	
 }
 public void strike_out(int k1,int k2)
	{
   int row_from;
   int row_to;
   int col_from;
   int col_to;
   int i,j,b,c;
   int rem1,rem2;
   int flag;
   int temp=a[k1][k2];
   int count=9;
   for(i=1;i<=9;i++)
  	 {
  	 	flag=1;
    for(j=0;j<9;j++)
     	 {
          if(j!=k2)
       	  {
            if(i!=a[k1][j])
               continue;
            else
           	{
             	 flag=0;
               break;
          	 }
        	 } 
    	  }
    	  
     if(flag==1)
     	{
        for(c=0;c<9;c++)
        	{
           if(c!=k1)
           	{
              if(i!=a[c][k2])
                   continue;
               else
              	{
              		flag=0;
                break; 
             	 }
           	 }
    		 }
		  }
    if(flag==1)
    	{
       	rem1=k1%3; rem2=k2%3;
       	row_from=k1-rem1;
       	row_to=k1+(2-rem1);
      	 col_from=k2-rem2;
      	 col_to=k2+(2-rem2);
        for(c=row_from;c<=row_to;c++)
      	 {
           for(b=col_from;b<=col_to;b++)
       	   {
              if(c!=k1 && b!=k2)
          	   {
                 if(i!=a[c][b])
                 continue;
                 else
               	 {
                 	  flag=0;
                    break;
              	  }
            	 }
         	 }
      	 }
   	 }
   	 
   if(flag==0)
   		count--;
  	}
  	
   if(count==1)
     	a[k1][k2]=0;
}

   
//For row
public void permutation_row(int k1,int k2)
{
   int temp;//k1 and k2 are two rows that we are selecting to interchange.
   for(int j=0;j<9;j++)
   {
      temp=a[k1][j];
      a[k1][j]=a[k2][j];
      a[k2][j]=temp;
   }
}

//For col
public void permutation_col(int k1,int k2)
{
	int temp;
   for(int j=0;j<9;j++)
   {
      temp=a[j][k1];
      a[j][k1]=a[j][k2];
      a[j][k2]=temp;
   }
}


public void row_change(int k1,int k2)
{
   int temp;
   for(int n=1;n<=3;n++)
   {
      for(int i=0;i<9;i++)
      {
         temp=a[k1][i];
         a[k1][i]=a[k2][i];
         a[k2][i]=temp;
      }
      k1++;
      k2++;
   }
}

public void col_change(int k1,int k2)
{
   int temp;
   for(int n=1;n<=3;n++)
   {
      for(int i=0;i<9;i++)
      {
         temp=a[i][k1];
         a[i][k1]=a[i][k2];
         a[i][k2]=temp;
      }
      k1++;
      k2++;
   }
}


public void gen()
{
   int k=1,n=1;
   for(int i=0;i<9;i++)
   {
      k=n;
      for(int j=0;j<9;j++)
      {
          if(k<=9)
          {
              a[i][j]=k;
              k++;
          }
          
          else
          {
          	k=1;
          	a[i][j]=k;
         	 k++;
          }
      }
      
      n=k+3;
      
      if(k==10)
        	n=4;
      if(n>9)
    	    n=(n%9)+1;
   }
}


public void random_gen(int check)
{
  int k1,k2,max=2,min=0;
  Random r= new Random();
   for(int i=0;i<3;i++)
   {
//There are three groups.So we are using for loop three times.
      k1=r.nextInt(max-min+1)+min;
      
//This while is just to ensure k1 is not equal to k2.
     
      do{
         k2=r.nextInt(max-min+1)+min;
      }while(k1==k2);
      
      max+=3;min+=3;
      
//check is global variable.
//We are calling random_gen two time from the main func.
//Once it will be called for columns and once for rows.
      
      if(check==1)
//calling a function to interchange the selected rows.
      	permutation_row(k1,k2);
      else if(check==0)
      
      	permutation_col(k1,k2);
   }
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
        if(a[i][j] != 0)
        {
          fill(255);
          textSize(2 * s / 3);
          text(a[i][j], s * (i + 0.3), s * (j + 0.74) + off);
        }// if closed
      }// j - loop closed 
    }// i - loop closed
    
  }//draw() function closed
 
}// class closed
