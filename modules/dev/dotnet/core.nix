{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    dotnet-sdk
    dotnet-runtime
    dotnet-aspnetcore
    dotnet-ef
    omnisharp-roslyn
  ];
}
