defmodule PowerUp do

  def set(cmd, commands) do 
    commands = addPowerUp(cmd, commands)
    Map.put(commands, :board, placePowerUp(cmd, commands[:board])) 
  end 
  
  def placePowerUp(cmd, board) do
    x =  String.to_integer(Enum.at(cmd, 1)) 
    y =  String.to_integer(Enum.at(cmd, 2))
    board = put_in board[y][x], "x"
    board

  end

  def addPowerUp(cmd, commands) do
    x = String.to_integer(Enum.at(cmd, 1))
    y = String.to_integer(Enum.at(cmd, 2)) 
    Map.put_new(commands, :powerup, [x, y]) 
  end

end
