{ config, pkgs, ... }: {
    programs.ssh = {
		    enable = true;
		    settings."*".addKeysToAgent = "yes";
	  };

	
	  programs.keychain = {
		    enable = true;
		    keys = [ "rxsl_gh" ];
		    extraFlags = [ "--quiet" ];
	  };
	
}
