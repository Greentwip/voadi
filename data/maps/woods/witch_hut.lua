local map = ...
local game = map:get_game()

-- Event called at initialization time, as soon as this map is loaded.
function map:on_started()

end

function witch:on_interaction()
  if game:get_value("witch_clear") == nil or game:get_value("witch_clear") == false then
    game:start_dialog("woods.witch.1", function()
      hero:start_treasure("cultured_meat")
      game:set_value("witch_clear", true)
    end)
  else
    game:start_dialog("woods.witch.4")
  end
end