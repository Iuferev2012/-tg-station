//Warden and regular officers add this result to their get_access()
/datum/job/proc/check_config_for_sec_maint()
	if(config.jobs_have_maint_access & SECURITY_HAS_MAINT_ACCESS)
		return list(access_maint_tunnels)
	return list()

/*
Head of Security
*/
/datum/job/hos
	title = "Head of Security"
	flag = HOS
	department_head = list("Captain")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "��������"
	selection_color = "#ffdddd"
	req_admin_notify = 1
	minimal_player_age = 14

	default_id = /obj/item/weapon/card/id/silver
	default_pda = /obj/item/device/pda/heads/hos
	default_headset = /obj/item/device/radio/headset/heads/hos/alt
	default_backpack = /obj/item/weapon/storage/backpack/security
	default_satchel = /obj/item/weapon/storage/backpack/satchel_sec

	access = list(access_security, access_sec_doors, access_brig, access_armory, access_court, access_weapons, access_eva,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_armory, access_court, access_weapons,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers, access_eva,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway)

/datum/job/hos/equip_items(var/mob/living/carbon/human/H)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/head_of_security/navyblue(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/hos/trenchcoat(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/color/black/hos(H), slot_gloves)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/HoS(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/security/sunglasses(H), slot_glasses)

	if(H.backbag == 1)
		H.equip_to_slot_or_del(new /obj/item/weapon/restraints/handcuffs(H), slot_l_store)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/restraints/handcuffs(H), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/weapon/melee/classic_baton/telescopic(H), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/weapon/gun/energy/gun(H), slot_in_backpack)

	var/obj/item/weapon/implant/loyalty/L = new/obj/item/weapon/implant/loyalty(H)
	L.imp_in = H
	L.implanted = 1
	H.sec_hud_set_implants()

/*
Warden
*/
/datum/job/warden
	title = "Warden"
	flag = WARDEN
	department_head = list("Head of Security")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "����� ������ ������������"
	selection_color = "#ffeeee"
	minimal_player_age = 7

	default_pda = /obj/item/device/pda/warden
	default_headset = /obj/item/device/radio/headset/headset_sec/alt
	default_backpack = /obj/item/weapon/storage/backpack/security
	default_satchel = /obj/item/weapon/storage/backpack/satchel_sec

	access = list(access_security, access_sec_doors, access_brig, access_armory, access_court, access_maint_tunnels, access_morgue, access_weapons, access_forensics_lockers)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_armory, access_court, access_weapons) //See /datum/job/warden/get_access()

/datum/job/warden/equip_items(var/mob/living/carbon/human/H)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/warden/navyblue(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest/warden/alt(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/warden(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/color/black(H), slot_gloves)
	H.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/security/sunglasses(H), slot_glasses)
	H.equip_to_slot_or_del(new /obj/item/device/flash/handheld(H), slot_l_store)

	if(H.backbag == 1)
		H.equip_to_slot_or_del(new /obj/item/weapon/restraints/handcuffs(H), slot_l_hand)
		H.equip_to_slot_or_del(new /obj/item/key/security(H), slot_r_hand)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/restraints/handcuffs(H), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/key/security(H), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/weapon/gun/energy/gun/advtaser(H), slot_in_backpack)

	var/obj/item/weapon/implant/loyalty/L = new/obj/item/weapon/implant/loyalty(H)
	L.imp_in = H
	L.implanted = 1
	H.sec_hud_set_implants()

/datum/job/warden/get_access()
	var/list/L = list()
	L = ..() | check_config_for_sec_maint()
	return L

/*
Detective
*/
/datum/job/detective
	title = "Detective"
	flag = DETECTIVE
	department_head = list("Head of Security")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "����� ������ ������������"
	selection_color = "#ffeeee"
	minimal_player_age = 7

	default_pda = /obj/item/device/pda/detective
	default_headset = /obj/item/device/radio/headset/headset_sec

	access = list(access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels, access_court, access_weapons, access_brig, access_security)
	minimal_access = list(access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels, access_court, access_weapons)

/datum/job/detective/equip_items(var/mob/living/carbon/human/H)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/det(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sneakers/brown(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/det_hat(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/color/black(H), slot_gloves)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/det_suit(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/toy/crayon/white(H), slot_l_store)
	H.equip_to_slot_or_del(new /obj/item/weapon/lighter/zippo(H), slot_r_store)

	var/obj/item/clothing/mask/cigarette/cig = new /obj/item/clothing/mask/cigarette(H)
	cig.light("")
	H.equip_to_slot_or_del(cig, slot_wear_mask)

	if(H.backbag == 1)//Why cant some of these things spawn in his office?
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/evidence(H), slot_l_hand)
		H.equip_to_slot_or_del(new /obj/item/device/detective_scanner(H), slot_r_store)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/evidence(H), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/device/detective_scanner(H), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/weapon/melee/classic_baton/telescopic(H), slot_in_backpack)

	var/obj/item/weapon/implant/loyalty/L = new/obj/item/weapon/implant/loyalty(H)
	L.imp_in = H
	L.implanted = 1
	H.sec_hud_set_implants()

/*
Security Officer
*/
/datum/job/officer
	title = "Security Officer"
	flag = OFFICER
	department_head = list("Head of Security")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 10 //Handled in /datum/controller/occupations/proc/setup_officer_positions()
	spawn_positions = 5 //Handled in /datum/controller/occupations/proc/setup_officer_positions()
	supervisors = "����� ������ ������������ � ����� ������ � ������� �� ��������� �������� �������� ����� ���������� �������"
	selection_color = "#ffeeee"
	minimal_player_age = 7
	var/list/dep_access = null

	default_pda = /obj/item/device/pda/security
	default_headset = /obj/item/device/radio/headset/headset_sec/alt
	default_backpack = /obj/item/weapon/storage/backpack/security
	default_satchel = /obj/item/weapon/storage/backpack/satchel_sec

	access = list(access_security, access_sec_doors, access_brig, access_court, access_maint_tunnels, access_morgue, access_weapons, access_forensics_lockers)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_court, access_weapons) //But see /datum/job/warden/get_access()

/datum/job/officer/equip_items(var/mob/living/carbon/human/H)
	assign_sec_to_department(H)

	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/beret/sec(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/color/black(H), slot_gloves)
	H.equip_to_slot_or_del(new /obj/item/device/flash/handheld(H), slot_l_store)

	if(H.backbag == 1)
		H.equip_to_slot_or_del(new /obj/item/weapon/restraints/handcuffs(H), slot_r_store)
		H.equip_to_slot_or_del(new /obj/item/weapon/melee/baton/loaded(H), slot_l_hand)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/restraints/handcuffs(H), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/weapon/melee/baton/loaded(H), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/weapon/gun/energy/gun/advtaser(H), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest(H), slot_in_backpack)

	var/obj/item/weapon/implant/loyalty/L = new/obj/item/weapon/implant/loyalty(H)
	L.imp_in = H
	L.implanted = 1
	H.sec_hud_set_implants()

/datum/job/officer/get_access()
	var/list/L = list()
	if(dep_access)
		L |= dep_access.Copy()
	L |= ..() | check_config_for_sec_maint()
	dep_access = null;
	return L

var/list/sec_departments = list("���������� ������", "�������� ������", "����������� ������", "������-����������������� ������")

/datum/job/officer/proc/assign_sec_to_department(var/mob/living/carbon/human/H)
	if(!sec_departments.len)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security/blue(H), slot_w_uniform)
	else
		var/department = pick(sec_departments)
		sec_departments -= department
		var/destination = null
		var/obj/item/clothing/under/U = new /obj/item/clothing/under/rank/security/blue(H)
		switch(department)
			if("�������� ������")
				default_headset = /obj/item/device/radio/headset/headset_sec/alt/department/supply
				dep_access = list(access_mailsorting, access_mining)
				destination = /area/security/checkpoint/supply
				U.attachTie(new /obj/item/clothing/tie/armband/cargo())
			if("���������� ������")
				default_headset = /obj/item/device/radio/headset/headset_sec/alt/department/engi
				dep_access = list(access_construction, access_engine)
				destination = /area/security/checkpoint/engineering
				U.attachTie(new /obj/item/clothing/tie/armband/engine())
			if("����������� ������")
				default_headset = /obj/item/device/radio/headset/headset_sec/alt/department/med
				dep_access = list(access_medical)
				destination = /area/security/checkpoint/medical
				U.attachTie(new /obj/item/clothing/tie/armband/medblue())
			if("������-����������������� ������")
				default_headset = /obj/item/device/radio/headset/headset_sec/alt/department/sci
				dep_access = list(access_research)
				destination = /area/security/checkpoint/science
				U.attachTie(new /obj/item/clothing/tie/armband/science())
		H.equip_to_slot_or_del(U, slot_w_uniform)
		var/teleport = 0
		if(!config.sec_start_brig)
			if(destination)
				if(!ticker || ticker.current_state <= GAME_STATE_SETTING_UP)
					teleport = 1
		if(teleport)
			var/turf/T
			var/safety = 0
			while(safety < 25)
				T = safepick(get_area_turfs(destination))
				if(T && !H.Move(T))
					safety += 1
					continue
				else
					break
		H << "<b>�� ���� ��������� �� ��������� � [department]!</b>"
		return

/obj/item/device/radio/headset/headset_sec/department/New()
	wires = new(src)
	secure_radio_connections = new

	initialize()
	recalculateChannels()

/obj/item/device/radio/headset/headset_sec/alt/department/engi
	keyslot = new /obj/item/device/encryptionkey/headset_sec
	keyslot2 = new /obj/item/device/encryptionkey/headset_eng

/obj/item/device/radio/headset/headset_sec/alt/department/supply
	keyslot = new /obj/item/device/encryptionkey/headset_sec
	keyslot2 = new /obj/item/device/encryptionkey/headset_cargo

/obj/item/device/radio/headset/headset_sec/alt/department/med
	keyslot = new /obj/item/device/encryptionkey/headset_sec
	keyslot2 = new /obj/item/device/encryptionkey/headset_med

/obj/item/device/radio/headset/headset_sec/alt/department/sci
	keyslot = new /obj/item/device/encryptionkey/headset_sec
	keyslot2 = new /obj/item/device/encryptionkey/headset_sci
