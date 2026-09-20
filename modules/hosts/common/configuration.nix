{ self, inputs, ... }: {
	flake.nixosModules.commonConfiguration = { pkgs, lib, ... }: {
	  imports =
	    [ # Include the results of the hardware scan.
	      #self.nixosModules.frameworkHardware
	      self.nixosModules.niri
	      self.nixosModules.kanata
	      self.nixosModules.fonts
	      self.nixosModules.bluetooth
	      self.nixosModules.steam
	      self.nixosModules.environment
	      self.nixosModules.files
	      self.nixosModules.brave
	      self.nixosModules.morePackages
	      self.nixosModules.vscodium
	      self.nixosModules.syncthing
	    ];

	  # Bootloader.
	  boot.loader.systemd-boot.enable = true;
	  boot.loader.efi.canTouchEfiVariables = true;

	
	  networking = {
	    hostName = "nixos"; # Define your hostname.
	  };
	 
	  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
	
	  # Configure network proxy if necessary
	  # networking.proxy.default = "http://user:password@proxy:port/";
	  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	  nix.settings.experimental-features = [ "nix-command" "flakes" ];

	  # Enable networking
	  networking.networkmanager.enable = true;

	  # Set your time zone.
	  time.timeZone = "America/New_York";

	  # Select internationalisation properties.
	  i18n.defaultLocale = "en_US.UTF-8";

	  i18n.extraLocaleSettings = {
	    LC_ADDRESS = "en_US.UTF-8";
	    LC_IDENTIFICATION = "en_US.UTF-8";
	    LC_MEASUREMENT = "en_US.UTF-8";
	    LC_MONETARY = "en_US.UTF-8";
	    LC_NAME = "en_US.UTF-8";
	    LC_NUMERIC = "en_US.UTF-8";
	    LC_PAPER = "en_US.UTF-8";
	    LC_TELEPHONE = "en_US.UTF-8";
	    LC_TIME = "en_US.UTF-8";
	  };

	  # Enable the X11 windowing system.
	  services.xserver.enable = true;

	  # Enable the GNOME Desktop Environment.
	  services.displayManager.gdm.enable = true;
	  #services.xserver.desktopManager.gnome.enable = true;

	  # Configure keymap in X11
	  services.xserver.xkb = {
	    layout = "us";
	    variant = "";
	  };

    services.ivpn.enable = true;

	  # Enable CUPS to print documents.
	  services.printing.enable = true;

    hardware.sane = {
        enable = true;
        extraBackends = [ pkgs.sane-airscan ];
    };
    # Required for network/WSD/airscan discovery and USB-connected scanners
    services.udev.packages = [ pkgs.sane-airscan ];
    services.ipp-usb.enable = true; # If connected via USB or IPP-over-USB

    services.upower = {
        enable = true;
        percentageLow = 20;
        percentageCritical = 5;
        percentageAction = 3;
        criticalPowerAction = "Hibernate";
    };

    services.tailscale.enable = true;
    
	  # Enable sound with pipewire.
	  services.pulseaudio.enable = false;
	  security.rtkit.enable = true;
	  services.pipewire = {
	    enable = true;
	    alsa.enable = true;
	    alsa.support32Bit = true;
	    pulse.enable = true;
	    # If you want to use JACK applications, uncomment this
	    #jack.enable = true;

	    # use the example session manager (no others are packaged yet so this is enabled by default,
	    # no need to redefine it in your config for now)
	    #media-session.enable = true;
	  };

	  # Enable touchpad support (enabled default in most desktopManager).
	  # services.xserver.libinput.enable = true;

	  # Define a user account. Don't forget to set a password with ‘passwd’.
	  programs.zsh.enable = true;
	  users = {
	    defaultUserShell = pkgs.zsh;
		    users."rxsl" = {
			    isNormalUser = true;
			    description = "nixos";
			    extraGroups = [ "video" "audio" "networkmanager" "wheel" "input" "uninput" "libvirtd" "scanner" "lp" ];
			    packages = with pkgs; [
			    #  thunderbird
			    ];
		  };
	  };

	  # Install firefox.
	  programs.firefox.enable = true;

	  # Allow unfree packages
	  nixpkgs.config.allowUnfree = true;

	  # List packages installed in system profile. To search, run:
	  # $ nix search wget
	  environment.systemPackages = with pkgs; [
	    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	    easyeffects
	    libnotify
	    wget
	    brightnessctl
	    swaybg
      nautilus
      hunspell # active spell check in LibreOffice
            hunspellDicts.en_US
            hunspellDicts.en_US-large
     libreoffice-qt
     simple-scan
     pfetch-rs
     brave
     qt6Packages.qt6ct
     libsForQt5.qt5ct
     obsidian
     keepassxc
	  ];

	  nix = {
	    gc = {
	      automatic = true;
	      dates = "daily";
	      options = "--delete-older-than 7d"; 
	    };
	  };

	  # Some programs need SUID wrappers, can be configured further or are
	  # started in user sessions.
	  # programs.mtr.enable = true;
	  # programs.gnupg.agent = {
	  #   enable = true;
	  #   enableSSHSupport = true;
	  # };

	  # List services that you want to enable:

	  # Enable the OpenSSH daemon.
	  # services.openssh.enable = true;

	  # Open ports in the firewall.
	  # networking.firewall.allowedTCPPorts = [ ... ];
	  # networking.firewall.allowedUDPPorts = [ ... ];
	  # Or disable the firewall altogether.
	  # networking.firewall.enable = false;

	  # This value determines the NixOS release from which the default
	  # settings for stateful data, like file locations and database versions
	  # on your system were taken. It‘s perfectly fine and recommended to leave
	  # this value at the release version of the first install of this system.
	  # Before changing this value read the documentation for this option
	  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	  system.stateVersion = "26.05"; # Did you read the comment?

	};
}
