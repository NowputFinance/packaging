#!/bin/bash
set -e

if [ "$(echo "$1" | cut -c1)" = "-" ]; then
  echo "$0: assuming arguments for nowpd"
  set -- nowpd "$@"
fi

if [ "$(echo "$1" | cut -c1)" = "-" ] || [ "$1" = "nowpd" ]; then

  mkdir -p "$NOWP_DATA"
  chmod 700 "$NOWP_DATA"
  chown -R nowp "$NOWP_DATA"

	if [[ ! -s "$NOWP_DATA/nowp.conf" ]]; then
    cat <<-EOF > "$NOWP_DATA/nowp.conf"
    test.rpcbind=0.0.0.0
    main.rpcbind=0.0.0.0
    rpcallowip=::/0
    rpcpassword=${RPC_PASSWORD}
    rpcuser=${RPC_USER}
		EOF
    chown nowp "$NOWP_DATA/nowp.conf"
	fi

  set -- "$@" -datadir="$NOWP_DATA"
fi

if [ "$1" = "nowpd" ] || [ "$1" = "nowp-cli" ] || [ "$1" = "nowp-tx" ] || [ "$1" = "nowp-wallet" ] || [ "$1" = "nowp-util" ]; then
  echo
  exec gosu nowp "$@"
fi

exec "$@"
