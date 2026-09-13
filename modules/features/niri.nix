{ self, inputs, self', lib,  ... }: {

    flake.nixosModules.niri = { pkgs, lib, ... }: {
        programs.niri = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
        };
    };
	
    perSystem = { pkgs, lib, self', ... }: {
        packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
            inherit pkgs;
            settings = {
                spawn-at-startup = [ 
	              (lib.getExe self'.packages.myNoctalia)
	              #(lib.getExe pkgs.mako)
                ];
	          #spawn-sh-at-startup = [ "swaybg -i ~/Pictures/amz1x6hewomh1.jpeg -m fill" ];
            xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

	          input = {
		            keyboard.xkb.layout = "us, ua";
		            keyboard.numlock = true;
		            touchpad = {
			              tap = _:{};
			              tap-button-map = "left-right-middle";
			              click-method = "button-areas";
			              natural-scroll = _:{};
			              accel-profile = "adaptive";
			              scroll-method = "two-finger";
			              middle-emulation = _:{};
		            };
		            #focus-follows-mouse = _:{};
		            warp-mouse-to-focus = _:{};
	          };
	
            hotkey-overlay = {
                skip-at-startup = _:{};
            };
        
            layout = {
                focus-ring = {
                    on = _:{};
                    width = 2;
                    active-color = "#cba6f7";
                    inactive-color = "#b4befe";
                };

	              border = {
	                  width = 2;
	                  active-color = "#cba6f7";
	                  inactive-color = "#b4befe";
	              };
	
	  
	              gaps = 14;

	              struts = {
                    left = 20;
                    right = 10;
                    top = 10;
                    bottom = 10;
                };
	          };

            window-rule = {
                clip-to-geometry = true;
                geometry-corner-radius = 12;
            };

            binds = {
                "super+Return".spawn-sh = lib.getExe pkgs.kitty;
                "super+D".spawn-sh = lib.getExe pkgs.fuzzel;
                "super+S".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";
                "super+Q".close-window = _:{};
                "super+F".maximize-column = _:{};
                "super+W".toggle-column-tabbed-display = _:{};
                "super+T".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call lockScreen lock";
              

                "super+H".focus-column-left = _:{};
                "super+J".focus-window-down = _:{};
                "super+K".focus-window-up = _:{};
                "super+L".focus-column-right = _:{};
                "super+Left".focus-column-left = _:{};
                "super+Down".focus-window-down = _:{};
                "super+Up".focus-window-up = _:{};
                "super+Right".focus-column-right = _:{};


                "super+Shift+H".move-column-left = _:{};
                "super+Shift+J".move-window-down = _:{};
                "super+Shift+K".move-window-up = _:{};
                "super+Shift+L".move-column-right = _:{};

                "super+Alt+K".focus-workspace-up = _:{};
                "super+Alt+J".focus-workspace-down = _:{};

                "XF86AudioMute".spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
                "XF86AudioLowerVolume".spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-";
                "XF86AudioRaiseVolume".spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+";
                "XF86AudioPrev".spawn-sh = "${lib.getExe self'.packages.myNoctalia} msg media previous";
                "XF86AudioPlay".spawn-sh = "${lib.getExe self'.packages.myNoctalia} msg media playPause";
                "XF86AudioNext".spawn-sh = "${lib.getExe self'.packages.myNoctalia} msg media next";
                "XF86MonBrightnessDown".spawn-sh = "brightnessctl set 5%-"; 
                "XF86MonBrightnessUp".spawn-sh = "brightnessctl set 5%+"; 
                "Print".spawn-sh = "niri msg action screenshot";
                "XF86AudioMedia".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";
            };
        };
    };
    };
}
