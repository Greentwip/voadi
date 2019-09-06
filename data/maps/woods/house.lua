local map = ...
local game = map:get_game()

-- Event called at initialization time, as soon as this map becomes is loaded.
function map:on_started()

end


function chicken:on_interaction()

  if game:get_value("flippers_acquired") == nil or game:get_value("flippers_acquired") == false then

    game:start_dialog("woods.activist_house.chicken", function()
      chicken:prompt_item(function(item)
        if item and item:get_name() == "cultured_meat" then
          item:set_variant(0) -- destroy the item
          map:start_coroutine(function()
            dialog("woods.activist_house.chicken2")
            wait_for(hero.start_treasure, hero, "flippers", 1, nil)
            game:set_value("flippers_acquired", true)
          end)
        end
      end)
    end)
  else
    print("ok")
    game:start_dialog("woods.activist_house.chicken3")
  end
end
