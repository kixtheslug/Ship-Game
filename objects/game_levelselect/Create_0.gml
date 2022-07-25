/// @description Generate the map
typeString = "ERROR";
typeColor = c_black;
typeTeam = "ERROR";

rowNumber = 12;
colNumber = 8;
if(colNumber%2 != 1) colNumber--;

tileGridBuffer = 75;
tileGridX = (room_width-rowNumber*tileGridBuffer)/2;
tileGridY = 175;
connectionWidth = 5;
tileSize = 32;

alliedZones = 5;

levelMap = []

for(var r = 0; r < rowNumber; r++){ //fill array
	for(var c = 0; c < colNumber; c++){
		var newLevel = instance_create_layer(0,0,"Levels",Level_Handler);
		
		if(r == 0){
			if(alliedZones>0){
				newLevel.team = Game_ListHandler.teamList.player;
				newLevel.areaType = Game_ListHandler.tileTypes.Space;
				alliedZones--;
			} else {
				newLevel.areaType = Game_ListHandler.tileTypes.Nothing;
			}
		} else{
			var type = irandom_range(0,Game_ListHandler.numTileTypes);
			newLevel.areaType = type;
			
			if(irandom_range(0,1)) newLevel.team = Game_ListHandler.teamList.neutral;
			else newLevel.team = Game_ListHandler.teamList.hostile;
		}
		
		levelMap[r][c] = newLevel;
	}
}