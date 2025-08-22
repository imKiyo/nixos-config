{ inputs, ... }: {
  sops = {
    age.keyFile = "/home/kiyo/.config/sops/age/keys.txt";
    defaultSopsFile = ./secrets.yaml;
    secrets = {
      sshconfig = {
        owner = "kiyo";
        path = "/home/kiyo/.ssh/config";
        mode = "0600";
      };
      github-key = {
        owner = "kiyo";
        path = "/home/kiyo/.ssh/github";
        mode = "0600";
      };
      cloudflare-dns-token = { path = "/etc/cloudflare/dnskey.txt"; };
      nextcloud-pwd = { path = "/etc/nextcloud/pwd.txt"; };
      adguard-pwd = { };
      hoarder = { };
      wireguard-pia = { owner = "torrenter"; };
      recyclarr = { owner = "recyclarr"; };
    };
  };
}
