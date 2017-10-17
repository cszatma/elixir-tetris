defmodule Assign2 do

  def print(input) do
    input
    |> Convert.boardToString
    |> IO.inspect
  end 


  
  def readFrom(input) do
    strucs = String.split(input, "\n")
    commands = findCommands(strucs, %{})
    commands[:board]    
  end

  def findCommands([head | tail ], listCmds) do
    cmd = String.split(head, " ")
    listCmds = 
      case String.downcase(Enum.at(cmd, 0)) do
        "board" -> Map.put_new(listCmds, :board, Board.set(cmd))
        "dice" -> Map.put_new(listCmds, :dice, Dice.set(cmd))
        "moves" -> Map.put_new(listCmds, :moves, Moves.set(cmd))
      end
  
    findCommands(tail, listCmds)
  end

  def findCommands([], listCmds) do
    listCmds
  end
 
end
