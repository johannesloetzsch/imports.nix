{ pkgs, ... }:

{
  services.clipmenu.enable = true;
  environment.systemPackages = with pkgs; [ dmenu ];

  programs.dconf.profiles.user.databases = [
    {
      settings = {
        "org/mate/desktop/keybindings/custom1" = {
          name = "clipmenu";
          action = "clipmenu";
          binding = "<Mod4>h";
        };
      };
    }
  ];
}
