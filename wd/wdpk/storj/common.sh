#!/bin/sh
capture_run() {
    CORTAR_LOGFILE=/tmp/cortar.log
    echo "------------------------" >> ${CORTAR_LOGFILE}
		 date 		>> ${CORTAR_LOGFILE}
    echo "------------------------" >> ${CORTAR_LOGFILE}
    echo "Running CORTAR's script $0 (with process id $$)  total $# args: $* " >> ${CORTAR_LOGFILE}
    echo "UID context is : " . `id` >> ${CORTAR_LOGFILE}
    #echo "Running CORTAR's install $0(pid $$) script with $# args $* "  >> ${CORTAR_LOGFILE}
}
#capture_run $*
