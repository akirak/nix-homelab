{ pkgs, ...}:
{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      # ssh
      22
      # adguardhome
      53
      # tailscale
      41641
    ];
    allowedUDPPorts = [
      53
    ];
  };

  services.tailscale = {
    enable = true;
  };

  services.adguardhome = {
    enable = true;
    openFirewall = true;
    settings = {
      bind_port = 3000;
      bind_host = "0.0.0.0";
      dns = {
        bind_port = 3000;
        bind_host = "0.0.0.0";
        bootstrap_dns = [
          "1.1.1.1"
        ];
      };
    };
  };

  programs.git = {
    enable = true;
    config = {
      user.name = "Akira Komamura";
      user.email = "akira.komamura@gmail.com";
    };
  };

  environment.systemPackages = [
    pkgs.git-annex
  ];
}