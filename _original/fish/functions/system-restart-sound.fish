function system-restart-sound
  pulseaudio -k & sudo alsa force-reload
end
