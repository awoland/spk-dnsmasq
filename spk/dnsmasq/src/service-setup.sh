CFG_FILE="${SYNOPKG_PKGDEST}/var/dnsmasq.conf"
PATH="${SYNOPKG_PKGDEST}/bin:${PATH}"
SERVICE_COMMAND="${SYNOPKG_PKGDEST}/sbin/dnsmasq -C ${CFG_FILE}"

service_postinst ()
{
    # Discard legacy obsolete busybox user account
    BIN=${SYNOPKG_PKGDEST}/bin
    $BIN/busybox --install $BIN
    $BIN/delgroup "${USER}" "users" >> ${INST_LOG}
    $BIN/deluser "${USER}" >> ${INST_LOG}
}
