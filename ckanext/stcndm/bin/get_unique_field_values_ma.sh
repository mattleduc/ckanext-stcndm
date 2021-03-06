#!/bin/sh
die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 2 ] || die "2 arguments required, $# provided. arg1: organisation, arg2: field name"

curl http://ndmckanq1.stcpaz.statcan.gc.ca:8282/solr/ndm_core_dev/query?q=pkuniqueidcode_bi_strs:$1*\&rows=70000\&fl=$2 | \
   jq '.response.docs' | \
   jq "[.[].$2]" | \
   jq 'unique'
