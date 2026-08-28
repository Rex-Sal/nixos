{ self, inputs, ... }: {
	flake.nixosModules.steam = { pkgs, lib, ... }: {		
    #opengl
    hardware.graphics = {
        enable = true;
        enable32Bit = true;
        #driSupport = true;
        #driSupport32Bit = true;
    };

    services.xserver.videoDrivers = ["amdgpu"];  

	  programs.steam = {
		    enable = true;
        gamescopeSession.enable = true;
		    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
		    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
		    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
	  };

    programs.gamemode.enable = true;
	};
}
