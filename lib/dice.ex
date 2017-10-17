defmodule Dice do

   def set([ _ | tail ]) do
    result = Convert.stringListToInt(tail, []) 
    result
   end

end 
