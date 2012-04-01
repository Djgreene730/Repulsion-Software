----------------------------------------------------------
-- enemybase.lua
-- Contains table of values that represent the enemy's base.
----------------------------------------------------------
local Material = require("materials")
W = display.contentWidth
H = display.contentHeight

EnemyBase = {}

EnemyBase.level1 = {
	numObjects=22,
	baseX=700,
	baseY=291.05834960938,
	totalCost=2900,
	id={
		2,1,1,1,1,2,2,2,2,1,2,2,2,1,2,2,2,2,1,1,1,1
	},
	x_vals={
		111.80799865723,56.010650634766,56.262878417969,56.289886474609,56.195877075195,3.7095489501953,2.5970306396484,2.4010772705078,2.1709136962891,37.456390380859,112.52397155762,111.39143371582,110.40083312988,75.03239440918,0,112.53120422363,7.4681854248047,106.67512512207,55.875244140625,56.332153320313,38.277587890625,76.486038208008
	},
	y_vals={
		0,-37.451644897461,-0.006317138671875,-74.896591186523,-112.34216308594,-0.00555419921875,-37.450012207031,-74.894577026367,-112.33990478516,-134.78517150879,-37.432952880859,-74.864685058594,-112.29808044434,-134.74757385254,-149.78770446777,-149.74310302734,-187.23030090332,-187.17177581787,-157.23876953125,-194.68506622314,-213.81237792969,-213.51936340332
	},
	rotations={
		-0.016262600198388,90.032989501953,-89.99454498291,450.04306030273,270.05126953125,0.0038259259890765,0.012969587929547,0.022412329912186,0.031325995922089,-0.018423473462462,-0.056806642562151,-0.093751631677151,-0.12467232346535,0.12692286074162,0.039988577365875,-0.15127845108509,0.045896988362074,-0.1664267629385,270.21362304688,90.225883483887,-193.24227905273,12.56519985199
	}
}

EnemyBase.level2 = {
	numObjects=25,
	baseX=700,
	baseY=302.5466003418,
	totalCost=2525,
	id={
	3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,2,2,2,3,2,4,4,4,4,2
	},
	x_vals={
	0,25.952362060547,40.407623291016,54.86833190918,142.01098632813,116.03897094727,101.56758117676,87.084564208984,40.091125488281,102.02961730957,38.521606445313,102.37808227539,37.191940307617,100.79486083984,46.640655517578,87.908187866211,46.296585083008,84.56005859375,61.880935668945,59.361068725586,58.121429443359,38.538650512695,76.011093139648,55.871765136719,58.364227294922
	},
	y_vals={
	-0.023101806640625,-11.481658935547,-11.478302001953,-11.480865478516,0,-11.500396728516,-11.498748779297,-11.478240966797,-37.387756347656,-37.602020263672,-51.543563842773,-51.986053466797,-65.709823608398,-66.286911010742,-91.41877746582,-91.708099365234,-128.68350219727,-128.98101806641,-154.48873901367,-180.12465667725,-201.7624130249,-207.72159576416,-208.4044342041,-214.44390869141,-236.35068511963
	},
	scaleX={
	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	},
	scaleY={
	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	},
	rotations={
	0.014953908510506,90.015365600586,89.983154296875,89.94645690918,-0.010513520799577,89.971488952637,89.982246398926,89.905197143555,0.0032201225403696,-1.0057270526886,0.10626636445522,-1.4990472793579,0.3043067753315,-1.8881067037582,0.40165439248085,-2.2379004955292,0.29689040780067,-2.299280166626,-0.43100771307945,-0.75919276475906,-0.9195573925972,-1081.1995849609,-0.89414042234421,-1.0600609779358,-1.0490657091141
	}
}

EnemyBase.loadBase = function(level)
	local physics = require("physics")
	local enemyGroup = display.newGroup()
	for i=1,level.numObjects do
		local obj = {}
		obj.id = level.id[i]
		obj = Material.clone(obj.id)
		obj.x = level.baseX + level.x_vals[i];
		obj.y = level.baseY + level.y_vals[i];
		obj.rotation = level.rotations[i]
		obj:addEventListener("postCollision",hit);
		local enemyCollisionFilter = { categoryBits = 4, maskBits = 5 }
		physics.addBody(obj, {density=obj.density, friction=obj.friction, bounce=obj.bounce, shape=obj.shape, filter=enemyCollisionFilter })
		enemyGroup:insert(obj)
	end
	return enemyGroup
end

return EnemyBase