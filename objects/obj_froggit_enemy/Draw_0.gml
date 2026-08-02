// only attempt to run shaking/drawing code if this parent object actually has a sprite
if (sprite_index != -1) {
    if (shake_timer <= 50 && was_hit == 1) {
		if global.enemy_part1[0] == obj_froggit_head_en {
			obj_froggit_head_en.sprite_index = spr_froggit_hurt_1
		}
		if ran == 0 {
			ran = 1
			alarm[1] = 20
		}
		_pspeed = 0
		shake_timer++
        var _offset_x = random_range(-shake_magnitude, shake_magnitude);
        //var _offset_y = random_range(-shake_magnitude, shake_magnitude);
        draw_sprite_ext(sprite_index, image_index, x + _offset_x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    } else {
        draw_self();
		if global.enemy_part1[0] == obj_froggit_head_en && global.enemy_hp[0] >= 1{
			obj_froggit_head_en.sprite_index = spr_froggit_head
		}
		_pspeed = 0.125
		if ran == 1 {
			alarm[0] = 1
		}
    }
}
