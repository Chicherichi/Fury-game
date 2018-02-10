class GameObject
{

  protected float x;
  protected float y;
  protected float size;

  GameObject()
  {
    this.x = 0;
    this.y = 0;
    this.size = 0.0;
  }

  public void update()
  {
  }

  public float getX()
  {
    return this.x;
  }

  public float getY()
  {
    return this.y;
  }

  public void setX(float x)
  {
    this.x = x;
  }

  public void setY(float y)
  {
    this.y = y;
  }
}