defmodule Mix.Tasks.TestGame do

  use Mix.Task
  @shortdoc "Base Testcase for Tetris Game" 
  def run(_) do
    Assign2.print(Assign2.readFrom("board 4 4
dice 1 1
moves ll
powerup 1 2"))
  end

end
