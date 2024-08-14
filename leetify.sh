#!/bin/bash

tfb=$(basename "${0}");

function convert {
  sed -s 's/a/4/gi' |
  sed -s 's/e/3/gi' |
  sed -s 's/i/1/gi' |
  sed -s 's/o/0/gi' |
  sed -s 's/t/7/gi' |
  tr [:lower:] [:upper:];
};

function action {
  if [[ -e "${1}" ]]; then
    cat "${1}" | convert;
  else
    echo "${1}" | convert;
  fi
}

function about {
  echo 'About: …';
}

function usage {
  echo """  -a, --action		Acción de convertir
  -A, --about		Detalles sobre el Software
  -u, --usage		Instrucciones de uso
  -v, --version		Versión específica del Software
  -h, --help		Muestra esta ayuda""";
}

function version {
  echo 'Version: 1.0.0';
}

function help {
  echo "Syntax: ${tfb} --action <file or string>";
  usage;
}

case "${1}" in
  -a|--action) action "${2}" ;;
  -A|--about) about ;;
  -u|--usage) usage ;;
  -v|--version) version ;;
  -h|--help) help ;;
  *) echo "Try: ./${tfb} --help" ;;
esac
