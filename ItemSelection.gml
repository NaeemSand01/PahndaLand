

#region
switch (state) {
	case SEL_ITEM: 
			// select Item menu
		 if sp_actions[2] {
			if Kcp(ord("A")){
				instance_create_layer(room_width/2-100, 550, "Instances", Battle_Itm_Menu_Obj)
			}
			else {
				return state
			}
		}
	break
		default:
		return 

	}


#endregion


