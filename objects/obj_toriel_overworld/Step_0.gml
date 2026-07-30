if (speed != 0) {
    // 1. Update the actual angle towards the target first
    direction = point_direction(x, y, obj_pathway_technical.x, obj_pathway_technical.y);
    
    // 2. NOW calculate the quadrant index using the newly updated direction
    var _direction = floor((direction + 45) / 90) mod 4;
    
    // 3. Apply animation speed once outside the switch to keep it clean
    image_speed = img_speed;
    
    // 4. Update the Toriel sprite based on the fixed index
    switch (_direction) {
        case 0:
            sprite_index = spr_torielr;
            break;
        case 1:
            sprite_index = spr_torielu;
            break;
        case 2:
            sprite_index = spr_toriell;
            break;
        case 3:
            sprite_index = spr_torield;
            break;
    }
}
else {
    // Stop Toriel's animation on frame 0 when standing still
    image_speed = 0;
    image_index = 0;
}
