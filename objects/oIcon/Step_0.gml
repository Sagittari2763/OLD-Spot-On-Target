on_camera(70, 10);
if global.lightningAtk = true {sprite_index = sLightningAtkIcon; image_alpha = 1;} //Lightning icon
else if global.zoomies = true {sprite_index = sZoomiesIcon; image_alpha = 1;} //Zoomies icon
else if global.lastStand = true {sprite_index = sLastStandIcon; image_alpha = 1;} //Zoomies icon
else {image_alpha = 0;} //Invisible if no ability