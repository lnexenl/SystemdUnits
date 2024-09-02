#!/bin/zsh


login_vpn() {
    # GROUP=2  # International(0) / Office.FaceID(1) / Office.GoogleAuth(2)
    PWD="$PASSWORD$(oathtool --base32 --totp $TOTP_TOKEN)"
    echo "$PWD" | openconnect vpn.megvii-inc.com --verbose -b -s $VPNC_SCRIPT_PATH --authgroup="$VPN_GROUP" -u $VPN_USER --passwd-on-stdin;
}

main() {
    if ip a | grep -q tun0 ; then
        echo "VPN running, exiting"
    else
        echo "VPN stopped, restarting...";
        pkill "/^openconnect$/"
        login_vpn;
    fi
}

main
