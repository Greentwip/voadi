-- Lua script of map woods/dungeon2.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

-- Event called at initialization time, as soon as this map is loaded.
function map:on_started()

  local switch_path_a = map:get_entity("switch_path_a")
  local block_path_a = map:get_entity("block_path_a")
  function switch_path_a:on_activated()
    block_path_a:set_enabled(false)
  end
  function switch_path_a:on_inactivated()
    block_path_a:set_enabled()
  end

  local switch_path_b = map:get_entity("switch_path_b")
  local block_path_b = map:get_entity("block_path_b")
  function switch_path_b:on_activated()
    block_path_b:set_enabled(false)
  end
  function switch_path_b:on_inactivated()
    block_path_b:set_enabled()
  end

  local puzzle1 = map:get_puzzle("1")
  local block_paths = map:get_entity("block_paths")

  function puzzle1:on_solved()
    block_paths:set_enabled()
  end

  local puzzle2 = map:get_puzzle("2")
  local chest_path_b = map:get_entity("chest_path_b")

  function puzzle2:on_solved()
    chest_path_b:set_enabled()
  end

  function switch_main_door:on_activated()
    gate_1:open()
  end

  local puzzle3 = map:get_puzzle("3")

  function puzzle3:on_solved()
    map.puzzle_3_solved = true
  end

  local puzzle4 = map:get_puzzle("4")

  function puzzle4:on_solved()
    map.puzzle_4_solved = true
  end

  function switch_straight_a:on_activated()
    map.switch_straight_a_activated = true
  end

  function switch_straight_b:on_activated()
    map.switch_straight_b_activated = true
  end


  local block_straight_right = map:get_entity("block_straight_right")

  function switch_straight_c:on_activated()
    if map.puzzle_3_solved == true and
      map.puzzle_4_solved == true and
      map.switch_straight_a_activated == true and
      map.switch_straight_b_activated == true then
        block_straight_right:set_enabled(false)
    end
  end

  function switch_final:on_activated()
    block_final:set_enabled(false)
  end





end

-- Event called after the opening transition effect of the map,
-- that is, when the player takes control of the hero.
function map:on_opening_transition_finished()

end
