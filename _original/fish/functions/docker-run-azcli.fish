function docker-run-azcli                          \
  --argument-names cli_                            \
  --description 'Provision an Azure CLI in Docker' \

  # command line environment must have a name
  if test -z "$cli_"
    printf "%s\n" "error: cli name not specified"
    exit 127
  end

  set --local az_home_   "$HOME/.az"
  set --local azqst_     "$az_home_/.azqst"
  set --local azqst_ts_  "$az_home_/.azqst.ts"
  set --local azra_      "$az_home_/.azra"
  set --local azra_ts_   "$az_home_/.azra.ts"
  set --local cli_home_  "$az_home_/$cli_"


  # make sure the quickstart templates are up to date
  if not test -d "$azqst_"
    printf "%s\n" "Pulling Azure Quick Start Templates."
    printf "%s\n" "This may take a while..."

    mkdir -p "$azqst_"
    git clone https://github.com/Azure/azure-quickstart-templates.git "$azqst_"
  else
    set --local azqstnow_ date +%s
    set --local azqstlud_ stat -t "$azqst_ts_" | cut -d" " -f12

    printf "%s\n" "Updating Azure Quick Start Templates."
    printf "%s\n" "This may take a while..."

    pushd "$azqst_"
    git pull
    popd
  end
  touch $azqst_ts_

  # make sure the reference architectures are up to date
  if not test -d "$azra_"
    printf "%s\n" "Pulling Azure Reference Architectures."
    printf "%s\n" "This may take a while..."

    mkdir -p "$azra_"
    git clone https://github.com/mspnp/reference-architectures.git "$azra_"
  else
    printf "%s\n" "Updating Azure Reference Architectures."
    printf "%s\n" "This may take a while..."

    pushd "$azra_"
    git pull
    popd
  end
  touch $azra_ts_

  # create environement
  if not test -d "$cli_home_"
    mkdir -p "$cli_home_"

    pushd "$cli_home_"
    mkdir "azure"
    mkdir "data"
    mkdir "kube"
    mkdir "ssh"
    ssh-keygen -t rsa -f "ssh/id_rsa" -q -N ""
    popd
  end

  # run the container
  clear

  docker run                                    \
    --interactive                               \
    --tty                                       \
    --rm                                        \
    --volume "$azqst_:/root/azqst:ro"           \
    --volume "$azra_:/root/azra:ro"             \
    --volume "$cli_home_/azure:/root/.azure"    \
    --volume "$cli_home_/data:/root/data"       \
    --volume "$cli_home_/kube:/root/.kube"      \
    --volume "$cli_home_/ssh:/root/.ssh"        \
    --name "$cli_"                              \
    azuresdk/azure-cli-python:latest
end
