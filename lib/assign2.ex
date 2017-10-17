defmodule Assign2 do

  def print(input) do
    input
    |> IO.inspect
    
    # Run Moves
    # Print Board
  
  end 


  
  def readFrom(input) do
    strucs = String.split(input, "\n")
    commands = findCommands(strucs)
    
    #Transform input for the following feilds: 
    #
    # Set Board
    # Set Dice
    # Set Moves
    # Return a list of [ 2D List for Board, Dice List, Moves List ] 
  end

  def findCommands([head | tail]) do
    temp = String.split(head, " ")
    setCommand(temp)
  end

  def findCommands([]) do
    
  end


  def setCommand(cmd) do 
    cond do
      String.downcase(Enum.at(cmd, 0)) == "board" ->
        Board.set(cmd)
      String.downcase(Enum.at(cmd, 0)) == "dice" ->
        Dice.set(cmd)
      String.downcase(Enum.at(cmd, 0)) == "moves" ->
        Moves.set(cmd)
    end
  end
end
