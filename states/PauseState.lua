--[[
    PauseState Class
    Author: Matt Geerling

    The PlayState class is the bulk of the game, where the player actually controls the bird and
    avoids pipes. When the player collides with a pipe, we should go to the GameOver state, where
    we then go back to the main menu.
]]

PauseState = Class{__includes = BaseState}

function PauseState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('p') then
        gStateMachine:change('play', {
            score = 10
        })
    end
end

function PauseState:render()
    -- TODO change when rendered to something random 

    love.graphics.setFont(flappyFont)
    love.graphics.print('Paused', 8, 8)

end

--[[
    Called when this state is transitioned to from another state.
]]
function PauseState:enter()
    scrolling = false
    BACKGROUND_SCROLL_SPEED = 0
end

--[[
    Called when this state changes to another state.
]]
function PauseState:exit()
    -- stop scrolling for the death/score screen
    scrolling = true
end