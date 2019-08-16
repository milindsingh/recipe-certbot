# Recipe Cert Bot: Installation and Setup

if !command -v sudo certbot -h &>/dev/null; then
  echo "Installing Cert Bot"
  echo ""
  sudo add-apt-repository ppa:certbot/certbot -y
  if !command -v python3 &>/dev/null; then
      echo ""
      echo "Installing Python 3"
      echo ""
      sudo apt install python3 -y
  fi

  sudo apt install python-certbot-apache -y

  echo ""
  echo "Cert Bot installed successfully."
else
  echo ""
  echo "Cert Bot is already installed."
fi

read -p "Enter your domain to generate ssl certificate (mydomian.com)? " DOMAIN
echo
if [ -z "$DOMAIN" ]
then
  echo ""
  echo "domain is invalid."
else
  sudo  certbot certonly --manual --preferred-challenges dns --server https://acme-v02.api.letsencrypt.org/directory --manual-public-ip-logging-ok -d *.$DOMAIN -d $DOMAIN
fi