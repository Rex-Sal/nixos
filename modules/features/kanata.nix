{ self, inputs, ... }: {
  flake.nixosModules.kanata = { pkgs, lib, ... }: {
    services.kanata = {
      enable = true;
      keyboards = {
	internalKeyboards = {
		            devices = [
		                "/dev/input/by-id/usb-BY_Tech_NuPhy_Halo96-event-kbd"
		                "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
		            ];
		            extraDefCfg = "process-unmapped-keys yes";
		config = ''
		(defsrc
		    caps
        kp1 kp2 kp3 kp4 kp5 kp0
		)

		(defalias
		    escctrl (tap-hold 100 100 esc lctrl)
        f1key (tap-hold 100 100 f1 f1)
        f2key (tap-hold 100 100 f2 f2)
        f3key (tap-hold 100 100 f3 f3)
        f4key (tap-hold 100 100 f4 f4)
        f5key (tap-hold 100 100 f5 f5)
        f10key (tap-hold 100 100 f10 f10)
		)

		(deflayer base
		    @escctrl
        @f1key
        @f2key
        @f3key
        @f4key
        @f5key
        @f10key
		)
		'';
	          };
	      };
    };

	};
}
