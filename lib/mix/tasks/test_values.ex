defmodule Mix.Tasks.TestValues do

  use Mix.Task

  @shortdoc "Testcase for the readFrom function"

  def run(_) do
    Assign2.printAllValues(Assign2.readFrom("board 4 4
dice 1 2 3 4
moves lrRL
powerup 2 2"))
  end

end
