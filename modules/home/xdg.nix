{ pkgs, ... }:
{
  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "zen-browser.desktop";
        "x-scheme-handler/http" = "zen-browser.desktop";
        "x-scheme-handler/https" = "zen-browser.desktop";
        "x-scheme-handler/about" = "zen-browser.desktop";
        "application/x-extension-htm" = "zen-browser.desktop";
        "application/x-extension-html" = "zen-browser.desktop";
        "application/x-extension-shtml" = "zen-browser.desktop";
        "application/xhtml+xml" = "zen-browser.desktop";
        "application/x-extension-xhtml" = "zen-browser.desktop";
        "application/x-extension-xht" = "zen-browser.desktop";
      };
    };
  };
}
