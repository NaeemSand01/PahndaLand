
#region	
canAttack = false;

// Make Attack point ui visible on attack selection
if (state = SEL_ATTK) {
	if Kcp(ord("A")) {
		instance_create_layer(room_width/2-30, 180, "Instances", Attk_Pnt_Obj);
		Action_Selector_Obj.visible = false;
		// Allow for an attack
		canAttack = true;
	} 
	
	// Close/end attack, hide Attack point ui and display Action Selector
	if Kcp(ord("X")) {
		instance_destroy(Attk_Pnt_Obj);
		Action_Selector_Obj.visible = true;
		canAttack = false;
	}
}
#endregion
