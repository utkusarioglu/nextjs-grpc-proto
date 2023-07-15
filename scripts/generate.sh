#!/bin/bash


function main {
  service=$1

  if [ -z "$service" ]; then
    echo "Error: First param needs to be the name of the service"
    exit 1
  fi

  echo "Generating Grpc code for '$service'…"
  
  case $service in 
    ms)
      yarn buf generate \
        --template templates/buf.gen.ms.yaml \
        --path src/inflation/decade-stats.proto
      ;;

    frontend)
      yarn buf generate \
        --template templates/buf.gen.frontend.yaml \
        --path src/inflation/decade-stats.proto
      ;;

    *)
      echo "Error: Unrecognized service name"
      exit 2
      ;;
  esac

  echo "Done"
}

main $@
