class Rat(n:Int, d:Int) {
  require (d != 0, "Denomiator cannot be 0")

  val num = n
  val denom = d

  override def toString = s"$n/$d"

  def +(that: Rat): Rat = {
    new Rat(n * that.denom + that.num * d, d * that.denom)
  }

  def -(that: Rat): Rat = {
    new Rat(n * that.denom - that.num * d, d * that.denom)
  }

  def *(that: Rat): Rat = {
    new Rat(n * that.num, d * that.denom)
  }

  def /(that: Rat): Rat = {
    new Rat(n * that.denom, d * that.num)
  }

}

println (new Rat(1,0))
println (new Rat(1,2) - new Rat(1,3))
println (new Rat(1,2) * new Rat(1,3))
println (new Rat(1,2) / new Rat(1,3))
val r = (new Rat(5,1) + new Rat(4,1) + (new Rat(2,1) - (new Rat(3,1) - (new Rat(6,1) + new Rat(4,5))))) / (new Rat(3,1) * (new Rat(6,1) - new Rat(2,1)) * (new Rat(2,1) - new Rat(7,1)))
println (r)