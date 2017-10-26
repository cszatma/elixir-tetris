defmodule Game do 

  def compute(commands) do
    runMoves(commands[:moves], commands[:dice], commands)
  end

  def runMoves([nextMove | remainingMoves], [nextRoll | remainingRolls], commands) do
    piece = Tetrimino.createType(nextRoll, { round(Float.ceil(Board.getNumCols(commands[:board]) / 2)), Board.getNumRows(commands[:board]) })
    
    {board, newPiece, status} = TetriminoActions.performMove(commands[:board], piece, nextMove)
    
    remainingRolls = remainingRolls ++ [nextRoll]
    
    if status == :placed do
      points = Tetrimino.getPosOnBoard(newPiece)
      commands = Map.put(commands, :board, placePieceOnBoard(points, newPiece.type, board)) 
      runMoves(remainingMoves, remainingRolls, commands)
    else
      runMoves(remainingMoves, remainingRolls, commands, newPiece)
    end
  end

  def runMoves([nextMove | remainingMoves], rolls, commands, piece) do
    {board, newPiece, status} = TetriminoActions.performMove(commands[:board], piece, nextMove)

    if status == :placed do
      points = Tetrimino.getPosOnBoard(newPiece)
      commands = Map.put(commands, :board, placePieceOnBoard(points, newPiece.type, board))
      runMoves(remainingMoves, rolls, commands)
    else
      runMoves(remainingMoves, rolls, commands, newPiece)
    end

  end

  def runMoves([], _, commands) do
    commands
  end

  def runMoves([], _, commands, piece) do
    points = Tetrimino.getPosOnBoard(piece)
    Map.put(commands, :board, placePieceOnBoard(points, piece.type, commands[:board]))
  end

  def placePieceOnBoard([block | remainingBlock], type, board) do
    x = List.first(block)
    y = List.last(block)
    IO.puts("x = #{x} and y = #{y}")
    IO.inspect(board)
    board = put_in board[y][x], type
    placePieceOnBoard(remainingBlock, type, board)
  end


  def placePieceOnBoard([], _, board) do
    board
  end


end
