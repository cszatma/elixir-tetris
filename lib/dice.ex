defmodule Dice do

   def set([ _ | tail ]) do
    Convert.stringListToInt(tail, []) 
   end

end 
