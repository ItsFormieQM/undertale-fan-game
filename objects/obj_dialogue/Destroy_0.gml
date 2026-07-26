global.canmove = true
global.interacted = 0
var _id = instance_nearest(x, y, obj_savemark);
if (instance_exists(_id)) {
    scr_save(_id);
}