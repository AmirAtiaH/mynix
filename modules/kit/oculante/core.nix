{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    oculante
  ];
}
