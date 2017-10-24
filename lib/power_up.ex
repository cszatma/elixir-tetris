defmodule PowerUp do

  def set(power_up, board) do 
    x =  String.to_integer(Enum.at(power_up, 1)) 
    y =  String.to_integer(Enum.at(power_up, 2))
    board = put_in board[y][x], "x"
    board
  end 


end
