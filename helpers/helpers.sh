function bkp_current_config() {
  current_config=$1
  if [[ -f $current_config ]]; then
    echo "Backing up current config: $current_config"
    cp "$current_config" "$current_config.bkp"
  else
    echo "No existing config found at $current_config, skipping backup."
  fi
}
