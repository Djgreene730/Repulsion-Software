--
-- Project: KatAstrophy
-- Description: 
--
-- Version: 1.0
-- Managed with http://CoronaProjectManager.com
--
-- Copyright 2012 Jason Simmons. All Rights Reserved.
-- 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
 
----------------------------------------------------------------------------------
-- 
--      NOTE:
--      
--      Code outside of listener functions (below) will only be executed once,
--      unless storyboard.removeScene() is called.
-- 
---------------------------------------------------------------------------------
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- Called when the scene's view does not exist:
function scene:createScene( event )
        local group = self.view
 
	
        -----------------------------------------------------------------------------
                
        --      CREATE display objects and add them to 'group' here.
        --      Example use-case: Restore 'group' from previously saved state.
        
        -----------------------------------------------------------------------------
        
end
 
 
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
        local group = self.view
        
        -----------------------------------------------------------------------------
                
        --      INSERT code here (e.g. start timers, load audio, start listeners, etc.)
		
		local physics = require( "physics" )
		physics.start()

		local space = display.newImage( "../images/space.png")
		space.x = display.contentWidth/2
		space.y = display.contentHeight/2
		space:scale(1.5, 1.5)
		
		local earth = display.newImage("../images/earth_slice.png")
		earth.x=display.contentWidth/2 -20
		earth.y=display.contentHeight/5 + 250
		

		local textObj = display.newText("KatAstrophy",0,0,nil,20)
		textObj.x = display.contentWidth/2
		textObj.y = display.contentHeight/2 -120
		--textObj:setReferencePoint(display.CenterRightReferencePoint)
		--local textHey = display.newText(display.contentHeight,0,0,nil,14)
		
		
		local button= display.newImage("../images/play-button2.png")
		button.x=display.contentHeight/2 +80
		button.y=display.contentWidth/2
		button:scale(.2,.2)
		
		
		function button:touch( event )
				--storyboard.gotoScene( "menu_mainmenu", flip, 500 )
				--local hey = display.newText("hey girl",0,0,nil,20)
				--button.x=event.x
				--storyboard.exitScene()
				storyboard.gotoScene("menu_mainmenu")
		       
		end

		button:addEventListener( "touch", button )
		
        -----------------------------------------------------------------------------
        
end
 
 
-- Called when scene is about to move offscreen:
function scene:exitScene( event )
        local group = self.view
        
        -----------------------------------------------------------------------------
        
        --      INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
        
        -----------------------------------------------------------------------------
        
end
 
 
-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
        local group = self.view
        
        -----------------------------------------------------------------------------
        
        --      INSERT code here (e.g. remove listeners, widgets, save state, etc.)
        
        -----------------------------------------------------------------------------
        
end
 
---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )
 
-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )
 
-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )
 
-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )
 
---------------------------------------------------------------------------------
 
return scene