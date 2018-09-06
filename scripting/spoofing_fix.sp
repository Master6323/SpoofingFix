
//This script has been Licenced by Master(D) under http://creativecommons.org/licenses/by-nc-nd/3.0/
//All Rights of this script is the owner of Master(D).

//Terminate:
#pragma semicolon		1
#pragma newdecls		required
#pragma dynamic			4194304

//Includes:
#include <sourcemod>

//Plugin Info:
public Plugin myinfo =
{
	name = "Spoofing Fix",
	author = "Master(D)",
	description = "Kicks players who spoof there Steamid",
	version = "1.0b",
	url = ""
};

//Initation:
public void OnPluginStart()
{

}

//Public Void OnClientPutInServer(int Client)
public void OnClientPostAdminCheck(int Client)
{

	//Ignore Fake Clients
	if(IsFakeClient(Client))

	{

		//Return:
		return;
	}

	//LoadItems:
	CreateTimer(0.1, OnClientPostAdminCheck_PreLoad, Client);
}

//Create SQLite Database:
public Action OnClientPostAdminCheck_PreLoad(Handle Timer, any Client)
{

	//Connected:
	if(IsClientConnected(Client))
	{

		//Declare:
		char SteamID[32];

		//Initulize:
		GetClientAuthId(Client, AuthId_Steam3, SteamID, 32);

		//Check to see if player has spoofed his steamid
		if(StrEqual(SteamID, "STEAM_ID_STOP_IGNORING_RETVALS"))  
		{

			//Kick Player
			KickClient(Client, "You have kicked from this server\nReason: %s", "SteamId Spoofing");
		}
	}
}