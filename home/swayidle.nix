{ pkgs, config, lib, myNoctalia, ... }: {
    services.swayidle =
		let
		    # Lock command
	 	    lock = "${lib.getExe myNoctalia} ipc call lockScreen lock";
		    # TODO: modify "display" function based on your window manager
		    # Sway
		    # display = status: "${pkgs.sway}/bin/swaymsg 'output * power ${status}'";
		    # Hyprland
		    # display = status: "hyprctl dispatch dpms ${status}";
		    # Niri
		    display = status: "${pkgs.niri}/bin/niri msg action power-${status}-monitors";
		in
		{
		    enable = true;
		    timeouts = [
		        {
		            timeout = 300; # in seconds
		            command = "${pkgs.libnotify}/bin/notify-send 'Locking in 5 seconds' -t 5000";
		        }
		        {
		            timeout = 305;
		            command = lock;
		        }
		        {
		            timeout = 335;
		            command = display "off";
		            resumeCommand = display "on";
		        }
		        {
		            timeout = 340;
		            command = "${pkgs.systemd}/bin/systemctl suspend";
		        }
		    ];
		    events = {
		        
		        "before-sleep" = (display "off") + "; " + lock;
		        
		        "after-resume"= display "on";
		        
		        "lock" = (display "off") + "; " + lock;
		        
		        "unlock" = display "on";
		        
		    };
		};
}
