#region // Action Selection movement back and forth
	switch(state) {
		case SEL_ATTK:
		#region // attack position switch
		
			// switch to defense option from attack
		if Kcp(vk_left) {
			sprite_index = sp_actions[1]
			state = state + 1
		}
		#endregion
		break
		case SEL_DEF:
		#region // defense left and right switches
		// switch to items from defense
		if Kcp(vk_left)
			if sprite_index = sp_actions[1]{
			sprite_index = sp_actions[2]
			state = state + 1
		}
		// switch to attack from defense
		if Kcp(vk_right)
			if sprite_index = sp_actions[1] {
				sprite_index = sp_actions[0]
				state = state - 1
			}
			#endregion
		break
		
		case SEL_ITEM:
		#region // item left and right switches
		// switch to special from items
			if Kcp(vk_left)
				if sprite_index = sp_actions[2]{
				sprite_index = sp_actions[3]
				state = state + 1
			}
		// switch to defense from items
			if Kcp(vk_right)
				if sprite_index = sp_actions[2] {
					sprite_index = sp_actions[1]
					state = state - 1
				}
		#endregion
		break
		
		case SEL_SPEC:
		#region // special left and right switches
			// switch to escape from special
		if Kcp(vk_left)
			if sprite_index = sp_actions[3]{
			sprite_index = sp_actions[4]
			state = state + 1
		}
		// switch to items from specials
		if Kcp(vk_right)
			if sprite_index = sp_actions[3] {
				sprite_index = sp_actions[2]
				state = state - 1
			}
		#endregion
		break
		
		case SEL_ESC:
		#region // escape right switch
			// switch to special from escape
			if Kcp(vk_right)
				if sprite_index = sp_actions[4] {
					sprite_index = sp_actions[3]
					state = state -1
				}
			#endregion
		break
	}
#endregion
