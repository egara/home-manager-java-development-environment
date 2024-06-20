{
  config,
  pkgs,
  ...
}: {
  home = {
    homeDirectory = "/home/egarcia";

    packages = with pkgs; [
      brave
    ];

    stateVersion = "22.11";
    username = "egarcia";
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  programs.home-manager.enable = true;
}
