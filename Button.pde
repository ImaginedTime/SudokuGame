class Button
{
  public int off = (int)width/7;
  public int btnSelected = 0; 
  public void make(String lvl)
  {
    stroke(255);
    strokeWeight(2);
    noFill();
    textSize(2 * width/21);
    ellipseMode(CENTER);
    
    //1-5 buttons
    for(int i = 1; i <= 5;i++)
    {
      ellipse(36*(i-1)*width / 203 + off, 0.75 * height,width/7, width/7);
      text(i,i * width/9 + (i-1) * width/15, 0.765 * height);
    }
    //6-9 buttons and × button
    for(int i = 1; i <= 5;i++)
    {
      ellipse(36*(i-1)*width / 203 + off, 0.84 * height, width/7, width/7);
      if(i < 5)
        text(i + 5,i * width/9 + (i-1) * width/15, 0.855 * height);
      else
      {
        textSize(width/7);
        text("×",i * width/9 + (i-1) * width/15.5, 0.86 * height);
      
      }
    }
    
    // Restart button
    rect(2*width/3, 0.05 * height, width/3 - width/20, width/10);
    textSize(width/15);
    text("Restart", 2*width/3 + width/30, 0.084 * height);
    
    // Level Button
    rect(width/20, 0.05 * height, width/3 - width/20, width/10);
    textSize(width/15);
    text(lvl, width/20 + width/30, 0.084 * height);
  }
  
  public void click()
  {
    int x = mouseX;
    int y = mouseY;
    stroke(255);
    strokeWeight(2);
    for(int i = 1; i <= 5;i++)
    {
      if(x > 36*(i-1)*width / 203 + off - width/7 && y > 0.75 * height - width/7 && x < 36*(i-1)*width / 203 + off + width/7 && y < 0.75 * height + width/7)
      {
        //to uncolor the circle selected before
        colorCircle();
        
        //to color the current selected circle
        fill(85);
        ellipseMode(CENTER);
        ellipse(36*(i-1)*width / 203 + off, 0.75 * height, width/7, width/7);
        btnSelected = i;
        break;
      }
      else if(x > 36*(i-1)*width / 203 + off - width/7 && y > 0.84 * height - width/7 && x < 36*(i-1)*width / 203 + off + width/7 && y < 0.84 * height + width/7)
      {
        //to uncolor the circle selected before
        colorCircle();
        
        //to color the current selected circle
        fill(85);
        ellipseMode(CENTER);
        ellipse(36*(i-1)*width / 203 + off, 0.84 * height, width/7, width/7);
        btnSelected = i + 5;
        break;
      }
    }
  }
  
  public void colorCircle()
  {
    if(btnSelected != 0 && btnSelected > 5)
    {
      fill(41,44,52);
      ellipseMode(CENTER);
      ellipse(36* (btnSelected - 6) *width / 203 + off, 0.84 * height, width/7, width/7);
    } 
    else if(btnSelected != 0 && btnSelected <= 5)
    {
      fill(41,44,52);
      ellipseMode(CENTER);
      ellipse(36* (btnSelected - 1) *width / 203 + off, 0.75 * height, width/7, width/7);
    }
  }
}