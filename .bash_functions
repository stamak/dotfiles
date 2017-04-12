
myws_sshhostname () {
  # Requires record in /etc/hosts and ssh host config
  ping -t1 -c1 pr_wsip > /dev/null 2>&1 # Add pr_wsip to the  /etc/hosts
  if [ $? == 0 ]; then
    export ws='priv_ws_sshname' # Put priv_ws_sshname host config in ssh config
  else
    export ws='pub_ws_sshname' # Put pub_ws_sshname host config in ssh config
  fi
}
