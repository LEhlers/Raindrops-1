class Raindrop
{
  PVector loc;
  PVector vel;
  PVector acc;
  int d;
  boolean caught = false;
  float changeV;
  float distance;
  float dropheight;
  float initialV;
  float finalV;
  Raindrop()
  {
    dropheight = 400;
    changeV = .5;
    initialV = 0;
    loc = new PVector(random(width), d/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, changeV);
    distance = sqrt(2*dropheight/acc.y);
    finalV = acc.y*distance;
    d = 10;
    caught = false;
  }
  void display()
  {
    fill(0, 0, 255);
    noStroke();
    ellipse(loc.x, loc.y, d, d);
    triangle(loc.x-d/2, loc.y, loc.x+d/2, loc.y, loc.x, loc.y-(vel.y*5));
  }
  void move()
  {
    if (!caught)
    {
      acc.set(0, changeV);
      vel.add(acc);
      loc.add(vel);
    }
    else
    {
      acc.set(0, 0);
      vel.set(0, 0);
      loc.y = -100;
    }
  }
  void checkCatcher(Catcher catcher)
  {
    if (dist(loc.x, loc.y, catcher.loc.x, catcher.loc.y) <= (d/2)+(catcher.d/2))
    {
      caught = true;
      score++;
      Time-=200;
      catcher.initialX = catcher.loc.x;
      catcher.iCaughtIt= true;
    }
  }
  void checkheight()
  {
    initialV = vel.y;
    dropheight = dist(0, loc.y, 0, 400);
    distance = (finalV-initialV)/acc.y;
    println(distance);
  }
}

