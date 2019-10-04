
#region
// Open Special skills menu
switch (state) {
	case SEL_SPEC: 
		if (sp_actions[3]) {
			if Kcp(ord("A")) {
				instance_create_layer(room_width/2-100, 550, "Instances", Btl_Spec_Menu_Obj)
			}
		}
	break



}

#endregion