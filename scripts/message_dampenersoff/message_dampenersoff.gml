function Message_Dampeners(on){
	if(on)
		array_push(Game_MessageHandler.messages, [Game_MessageHandler.messageDampenersOn,Game_MessageHandler.messageDampenersOn_Time]);
	else
		array_push(Game_MessageHandler.messages, [Game_MessageHandler.messageDampenersOff,Game_MessageHandler.messageDampenersOff_Time]);
}