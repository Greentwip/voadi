local map = ...
local game = map:get_game()

-- Event called at initialization time, as soon as this map is loaded.
function map:on_started()
game:set_value("witch_clear", false)
end

function witch:on_interaction()
  if game:get_value("witch_clear") == nil or game:get_value("witch_clear") == false then
    game:start_dialog("woods.witch.1", function()
    witch:prompt_item(function(item)
          if not item then return end

          local is_whiskey = item:get_name() == "whiskey"

          if is_whiskey then
            game:start_dialog("woods.witch.4", function()
                hero:start_treasure("cultured_meat")
                game:set_value("witch_clear", true)
            end)
          else
            return
          end
        end)
    end)
  else
    game:start_dialog("woods.witch.4")
  end
end