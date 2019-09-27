{ config, pkgs, ... }:
{
  networking.firewall = { enable = true;
                          allowedTCPPorts = [ 80 3000 ];
                          extraCommands = "iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 3000"; };

  services.openssh.enable = true;  ## used by gitea ; might instead use the gitea-builtin-ssh, but this work out of the box

  services.gitea = {
    enable = true;
    httpPort = 3000;
    domain = "gitea";
    rootUrl = "http://gitea.container/";
    extraConfig = ''
      [repository]
      FORCE_PRIVATE = true

      [picture]
      DISABLE_GRAVATAR = true

      [server]
      #SSH_DOMAIN = gitea
      OFFLINE_MODE = true

      [service]
      DISABLE_REGISTRATION = true
    '';
 };
}


## when cloning via http there might be a problem like:
##  error: unable to read askpass response from '/nix/store/x1ivsylb02q62924bhlw4q816qa2iiwh-x11-ssh-askpass-1.2.4.1/libexec/x11-ssh-askpass'
## which is only displayed when pressing ESC while being non-responsive
