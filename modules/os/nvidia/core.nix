{
  services.xserver.videoDrivers = ["nvidia"];
  
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    forceFullCompositionPipeline = true;
    modesetting.enable = true;
    powerManagement.enable = true;
    nvidiaSettings = true;
    open = false;
  };
}
