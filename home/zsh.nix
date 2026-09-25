{ config, pkgs, ... }: 
{

    home.packages = [
      pkgs.pokemon-colorscripts
      pkgs.fastfetch
      pkgs.pipes
      pkgs.lsd
    ];
    programs.fzf.enable = true;
    programs.zsh = {
		    enable = true;
		    enableCompletion = false; # disabled for fzf and fzf-tab
		    autosuggestion.enable = true;
		    syntaxHighlighting.enable = true;


		    history.size = 5000;
		    #history.path = "${config.xdg.dataHome}/zsh/history";
		    history.share = true;

		    # zsh plugins
		    zplug = {
		        enable = true;
		        plugins = [
			          { name = "xvoland/Extract"; } # Extract files from any compressed file format 
			          { name = "softmoth/zsh-vim-mode"; } # vim mode in zsh (after jumping between multiple github
							  # discussions, I found this just happens to be the one that 
							  # works with fzf
			          { name = "Aloxaf/fzf-tab"; }	# fzf functionality for tab completion
		        ];
		    };


		    initContent = ''
			      # Alternate version of cowsay, but with pokemon
			      #bash -c 'fortune | pokemonsay'

			      # runs bash script in ./modules/ to setup fzf (best solution here was the easiest one)
			      if [ -f ~/nix/home/initFzf.sh ]; then
			          bash ~/nix/home/initFzf.sh 
			      fi

			      # for using fzf for tab completion (again, something I wasn't able to implement with nix)
			      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

			      # Shell integrations
			      eval "$(fzf --zsh)"
			      eval "$(zoxide init zsh)"

			      # Echos a random pokemon when opening a new shell
			      pokemon-colorscripts --random --no-title

			      # Fixes highlight issues in tmux nvim (works with another line in tmux.conf)
			      export TERM=xterm-256color
			      # Fixes delayed escape issue in tmux nvim (see additional config line in tmux.conf)
			      set ttimeoutlen=100
		    '';

		    shellAliases = 
			  let
				    flakeDir = "~/nix";
			  in {

            rebuild = "sudo nixos-rebuild switch --flake ~/nix#$FLAKE_PROFILE";
            upgrade = "sudo nixos-rebuild switch --upgrade --flake ~/nix#$FLAKE_PROFILE";

            l = "lsd -lh"; # replaces "l = 'lsd -alh'
            ls = "lsd";
            ll = "lsd -l";
            lh = "ls -ld .??*"; # Show only hidden files
            cdl = "cd && clear";
            cl = "clear";
            zb = "cd -";

            zl = "z && clear";

            vim = "nvim";
            v = "nvim";
            vf = "nvim $(fzf)";


            kanata-fix = "modprobe uinput"; # in case kanata stops being enabled, run this

            nixadd = "git -C ~/nix add --all";
            nixstatus = "git -C ~/nix status";
            dev = "devenv shell";
            webdev = "devenv shell && codium";
            flake = "[ -f ./flake.nix ] && nvim ./flake.nix || echo 'flake.nix not found in the current directory'"; 
            fetch = "hyfetch";
            pipes = "pipes.sh";

        };



    };
}
