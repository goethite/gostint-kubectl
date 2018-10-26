#!/usr/local/bin/yamlsh --yaml=/secrets.yml

if [ "$YAMLSH_KUBECONFIG_BASE64" == "" ]
then
  echo "ERROR: KUBECONFIG_BASE64 value missing from secrets.yml" >&2
  exit 1
fi

umask 077
echo "$YAMLSH_KUBECONFIG_BASE64" | base64 -d > /tmp/config.yml

RUNCMD=${RUNCMD:-kubectl}
KUBECONFIG=/tmp/config.yml $RUNCMD "$@"
