{ inputs, ... }: {

    imports = [
	      inputs.nixvim.homeManagerModules.nixvim
		    ./options.nix
        ./tmux-navigator.nix
        ./lualine.nix
        ./emmet.nix
        ./nvim-tree.nix
        ./lsp/default.nix
        ./cmp.nix
	  ];
    
	  programs.nixvim = {
		    enable = true;
		    defaultEditor = true;
		    nixpkgs.useGlobalPackages = true;
		    viAlias = true;
		    vimAlias = true;

        globals.mapleader = " ";

        extraConfigVim = ''
            autocmd BufRead,BufNewFile *.pl set filetype=prolog
        '';

        keymaps = [
            # Global
            # Default mode is "" which means normal-visual-op
            {
              key = "<C-n>";
              action = "<CMD>NvimTreeToggle<CR>";
              options.desc = "Toggle NvimTree";
            }
            {
              key = "<leader>c";
              action = "+context";
            }
            {
              key = "<leader>co";
              action = "<CMD>TSContextToggle<CR>";
              options.desc = "Toggle Treesitter context";
            }
            {
              key = "<leader>ct";
              action = "<CMD>CopilotChatToggle<CR>";
              options.desc = "Toggle Copilot Chat Window";
            }
            {
              key = "<leader>cf";
              action = "<CMD>CopilotChatFix<CR>";
              options.desc = "Fix the selected code";
            }
            {
              key = "<leader>cs";
              action = "<CMD>CopilotChatStop<CR>";
              options.desc = "Stop current Copilot output";
            }
            {
              key = "<leader>cr";
              action = "<CMD>CopilotChatReview<CR>";
              options.desc = "Review the selected code";
            }
            {
              key = "<leader>ce";
              action = "<CMD>CopilotChatExplain<CR>";
              options.desc = "Give an explanation for the selected code";
            }
            {
              key = "<leader>cd";
              action = "<CMD>CopilotChatDocs<CR>";
              options.desc = "Add documentation for the selection";
            }
            {
              key = "<leader>cp";
              action = "<CMD>CopilotChatTests<CR>";
              options.desc = "Add tests for my code";
            }

            # File
            {
              mode = "n";
              key = "<leader>f";
              action = "+find/file";
            }
            {
              # Format file
              key = "<leader>fm";
              action = "<CMD>lua vim.lsp.buf.format()<CR>";
              options.desc = "Format the current buffer";
            }

            # Tabs
            {
              mode = "n";
              key = "<leader>t";
              action = "+tab";
            }
            {
              mode = "n";
              key = "<leader>tn";
              action = "<CMD>tabnew<CR>";
              options.desc = "Create new tab";
            }
            {
              mode = "n";
              key = "<leader>td";
              action = "<CMD>tabclose<CR>";
              options.desc = "Close tab";
            }
            {
              mode = "n";
              key = "<leader>ts";
              action = "<CMD>tabnext<CR>";
              options.desc = "Go to the sub-sequent tab";
            }
            {
              mode = "n";
              key = "<leader>tp";
              action = "<CMD>tabprevious<CR>";
              options.desc = "Go to the previous tab";
            }
            

             # Terminal
            {
              # Escape terminal mode using ESC
              mode = "t";
              key = "<esc>";
              action = "<C-\\><C-n>";
              options.desc = "Escape terminal mode";
            }

            # Trouble 
            {
              mode = "n";
              key = "<leader>d";
              action = "+diagnostics/debug";
            }
            {
              key = "<leader>dt";
              action = "<CMD>Trouble diagnostics toggle<CR>";
              options.desc = "Toggle trouble";
            }
        ];
	  };
}
