{ config, pkgs, ... }:
{
    programs.git = {
		    enable = true;
        userName = "Rex-Sal";
        userEmail = "273584355+Rex-Sal@users.noreply.github.com";
		    signing = {
			      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHbcwTUSWCG9tk/S/rv0mXbKo3ijX9td8gfp1imMUdV+ 273584355+Rex-Sal@users.noreply.github.com";
			      signByDefault = true;
		    };
		    settings = {
			      gpg.format = "ssh";
			      init.defaultBranch = "main";
			      credential.helper = "cache"; # Or `store`, or "" (empty string to disable entirely)
		    };
	  };
}

