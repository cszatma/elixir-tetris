defmodule Assign2 do

  def print(input) do
    input
    |> IO.inspect
    
    # Run Moves
    # Print Board
  
  end 


  
  def readFrom(input) do
    strucs = String.split(input, "\n")
    commands = findCommands(strucs, [])
    commands    
  end

  def findCommands([head | tail ], listCmds) do
    cmd = String.split(head, " ")
     cond do
      String.downcase(Enum.at(cmd, 0)) == "board" ->
        listCmds = listCmds ++ [ Board.set(cmd) ]
      String.downcase(Enum.at(cmd, 0)) == "dice" ->
        listCmds = listCmds ++ [ Dice.set(cmd) ]
      String.downcase(Enum.at(cmd, 0)) == "moves" ->
        listCmds = listCmds ++ [ Moves.set(cmd) ]
     end
    findCommands(tail, list)
  end

  def findCommands([], listCmds) do
    listCmds
  end
 
end
