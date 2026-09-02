# https://www.reddit.com/r/NixOS/comments/1hdsfz0/what_do_i_have_to_do_to_make_my_xbox_controller/
# I dont know what exactly everything does, but I followed this and now I FINALLY HAVE BLUETOOTH (at least for an Xbox
# Controller)

{ self, inputs, ... }: {
    flake.nixosModules.bluetooth = { pkgs, lib, config, ... }: {	
        hardware.bluetooth = {
            enable = true;
            powerOnBoot = true;
            settings.General = {
                experimental = true;
                Privacy = "device";
                JustWorksPairing = "always";
                Class = "0x000100";
                FastConnectable = true;
			      };
        };	
        services.blueman.enable = true;

        hardware.xpadneo.enable = true;
    
        boot = {
            extraModulePackages = with config.boot.kernelPackages; [ xpadneo ];
            extraModprobeConfig = ''
                options bluetooth disable_ertm=Y
            '';
        };	
	  };
}
