{ data, ... }:
let
  timezone = data.timeZone or "Africa/Cairo";
in {
  time.timezone = timezone;
}
