function chrome-incognito-jail
  firejail --caps.drop=all --name=ichrome google-chrome --incognito
end
