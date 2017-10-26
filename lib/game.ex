defmodule Game do 

  def compute(commands) do
    commands
    rollDice(commands[:dice], commands)
  end

  def runMoves(piece, [head | tail], commands) do 
    #takes the head item in list and tests if it is possible
    #runs the  move does put_in board for commands[:board] the new values
    #then recusivle calls runMoves(tail, commands)
    #
    #
    #Test below: 
    #"This is the head : " <> head <> " for piece " <> Integer.to_string(piece) |> IO.puts 
    runMoves(piece, tail, commands)
  end

  def runMoves(piece, [], commands) do 
    commands 
  end

  def rollDice([head | tail], commands) do
    # IO.puts("Started piece : " <> Integer.to_string(head))
    runMoves(head, commands[:moves], commands)
    #"=========================================="
    #|> IO.puts
    rollDice(tail, commands)
  end

  def rollDice([], commands) do
    commands
  end



end
