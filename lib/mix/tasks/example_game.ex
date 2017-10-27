defmodule Mix.Tasks.ExampleGame do

  use Mix.Task
  @shortdoc "The Testcase from the CPS506 Assignment Page"

  def run(_) do
    Assign2.print(Assign2.readFrom("board 8 10
powerup 2 9
dice 1 2 7 2 2
moves llll+.."))
  end
end
