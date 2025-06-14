{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    cups
  ];
}
