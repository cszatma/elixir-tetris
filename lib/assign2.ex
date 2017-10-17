defmodule Assign2 do

  def print(input) do
    input
    |> IO.puts
    
    # Run Moves
    # Print Board
  
  end 


  
  def readFrom(input) do
    strucs = String.split(input, "\n")

    
    #Transform input for the following feilds: 
    #
    # Set Board
    # Set Dice
    # Set Moves
    # Return a list of [ 2D List for Board, Dice List, Moves List ] 
    board = Enum.at(strucs, 0)
    board
  end



end
