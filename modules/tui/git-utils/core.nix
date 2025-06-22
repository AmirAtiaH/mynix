{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git
    curl
    gh
    wget
    gnumake
  ];
}
