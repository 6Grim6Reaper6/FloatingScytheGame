if (asset_has_tags(room, "Menu", asset_room) and room != MainMenu)
{
	if (room == SettingsMenu) { room_goto(MainMenu); }
	else { room_goto(SettingsMenu); }
}