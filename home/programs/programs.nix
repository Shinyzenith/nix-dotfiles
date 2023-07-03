{ config, pkgs, ... }:

{
  programs = {
    gpg = {
      enable = true;
      homedir = "${config.xdg.dataHome}/gnupg";
    };

    tmux = {
      enable = true;
      #shell = "${pkgs.fish}/bin/fish";
      prefix = "C-a";
      baseIndex = 1;
      keyMode = "vi";
      mouse = true;
      terminal = "screen-256color";
      escapeTime = 0;
      extraConfig =
        "${pkgs.lib.fileContents ../config/configs/tmux/extra.conf}";
      plugins = with pkgs.tmuxPlugins; [ resurrect vim-tmux-navigator ];
    };

    obs-studio.enable = true;

    neovim = {
      enable = true;
      vimAlias = true;
      vimdiffAlias = true;
      defaultEditor = true;
      plugins = with pkgs.vimPlugins; [
        cmp-cmdline
        cmp-nvim-lsp
        cmp-path
        cmp_luasnip
        editorconfig-vim
        indent-blankline-nvim
        lualine-nvim
        luasnip
        nerdcommenter
        nvim-cmp
        nvim-lspconfig
        nvim-treesitter.withAllGrammars
        nvim-treesitter-context
        nvim-web-devicons
        packer-nvim
        pears-nvim
        presence-nvim
        telescope-nvim
        tokyonight-nvim
        vim-css-color
        vim-tmux-navigator
      ];
    };
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
  };

  home.packages = with pkgs; [
    libnotify
    aerc
    alacritty
    authy
    bat
    bitwarden
    blueberry
    btop
    clang-tools
    discord-canary
    duf
    exa
    fzf
    imagemagick
    imv
    jq
    killall
    mako
    mpv
    networkmanagerapplet
    pcmanfm
    playerctl
    polkit_gnome
    pulsemixer
    ranger
    ripgrep
    slurp
    swappy
    swayfx
    tmux
    tofi
    wayshot
    wget
    wl-clipboard
    wlsunset
    xournalpp
    yt-dlp
    zathura
  ];

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    Unit = {
      Description = "Run polkit authentication agent";
      X-RestartIfChanged = true;
    };
    Service.ExecStart =
      "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    Install.WantedBy = [ "graphical-session.target" ];
  };

}
