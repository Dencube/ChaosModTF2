#pragma semicolon 1
#pragma newdecls required

public void AddCond_OnMapStart(ChaosEffect effect)
{
	// Bumper Car sounds
	PrecacheSound(")weapons/bumper_car_speed_boost_start.wav");
	PrecacheSound(")weapons/bumper_car_speed_boost_stop.wav");
	PrecacheSound(")weapons/bumper_car_jump_land.wav");
	PrecacheSound(")weapons/bumper_car_jump.wav");
	PrecacheSound("weapons/bumper_car_hit1.wav");
	PrecacheSound("weapons/bumper_car_hit2.wav");
	PrecacheSound("weapons/bumper_car_hit3.wav");
	PrecacheSound("weapons/bumper_car_hit4.wav");
	PrecacheSound("weapons/bumper_car_hit5.wav");
	PrecacheSound("weapons/bumper_car_hit6.wav");
	PrecacheSound("weapons/bumper_car_hit7.wav");
	PrecacheSound("weapons/bumper_car_hit8.wav");
}

public bool AddCond_OnStart(ChaosEffect effect)
{
	if (!effect.data)
		return false;
	
	TFCond nCondition = view_as<TFCond>(effect.data.GetNum("condition"));
	
	for (int client = 1; client <= MaxClients; client++)
	{
		if (!IsClientInGame(client))
			continue;
		
		TF2_AddCondition(client, nCondition);
	}
	
	return true;
}

public void AddCond_OnEnd(ChaosEffect effect)
{
	TFCond nCond = view_as<TFCond>(effect.data.GetNum("condition"));
	
	for (int client = 1; client <= MaxClients; client++)
	{
		if (!IsClientInGame(client))
			continue;
		
		TF2_RemoveCondition(client, nCond);
	}
}

public void AddCond_OnPlayerSpawn(ChaosEffect effect, int client)
{
	TFCond nCond = view_as<TFCond>(effect.data.GetNum("condition"));
	
	TF2_AddCondition(client, nCond);
}

public void AddCond_OnConditionRemoved(ChaosEffect effect, int client, TFCond condition)
{
	TFCond nCondition = view_as<TFCond>(effect.data.GetNum("condition"));
	
	if (nCondition == condition)
	{
		TF2_AddCondition(client, nCondition);
	}
}
