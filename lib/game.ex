defmodule Game do

  def compute(commands) do
    runMoves(commands[:moves], commands[:dice], commands, 0)
  end

  def runMoves([nextMove | remainingMoves], [nextRoll | remainingRolls], commands, score) do
    piece = Tetrimino.createType(nextRoll, { round(Float.ceil(Board.getNumCols(commands[:board]) / 2)), Board.getNumRows(commands[:board]) - 1 })

    {board, newPiece, status} = TetriminoActions.performMove(commands[:board], piece, nextMove)

    remainingRolls = remainingRolls ++ [nextRoll]

    if status == :placed do
      points = Tetrimino.getPosOnBoard(newPiece)
      commands = Map.put(commands, :board, placePieceOnBoard(points, newPiece.type, board))
      score = score + 1 
      runMoves(remainingMoves, remainingRolls, commands, score)
    else
      runMoves(remainingMoves, remainingRolls, commands, newPiece, score)
    end
  end

  def runMoves([], _, commands, score) do
    Map.put(commands, :score, score) 
  end

  def runMoves([nextMove | remainingMoves], rolls, commands, piece, score) do
    {board, newPiece, status} = TetriminoActions.performMove(commands[:board], piece, nextMove)

    if status == :placed do
      points = Tetrimino.getPosOnBoard(newPiece)
      commands = Map.put(commands, :board, placePieceOnBoard(points, newPiece.type, board))
      score = score + 1
      runMoves(remainingMoves, rolls, commands, score)
    else
      runMoves(remainingMoves, rolls, commands, newPiece, score)
    end

  end

  def runMoves([], _, commands, piece, score) do
    points = Tetrimino.getPosOnBoard(piece)
    Map.put(commands, :board, placePieceOnBoard(points, piece.type, commands[:board]))
    |> Map.put(:score, score + 1)
  end

  def placePieceOnBoard([block | remainingBlock], type, board) do
    x = List.first(block)
    y = List.last(block)
    board = put_in board[y][x], type
    placePieceOnBoard(remainingBlock, type, board)
  end


  def placePieceOnBoard([], _, board) do
    board
  end


end
