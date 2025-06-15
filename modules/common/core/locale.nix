{ data, ... }:
let
  language = data.language or "en_US.UTF-8";
in {
  i18n.defaultLocale = language;
}
