#!/usr/bin/env bash

cd ~/stcndm-env/ckanext-stcndm/ckanext/stcndm/bin

date | tee -a jsonl_dumps/load_errs.txt
echo -users | tee jsonl_dumps/load_errs.txt
ckanapi load users -I jsonl_dumps/ckan_users.jsonl 2>&1 >/dev/null | tee | grep -i error >> jsonl_dumps/load_errs.txt
echo done users | tee -a jsonl_dumps/load_errs.txt

date | tee -a jsonl_dumps/load_errs.txt
echo -org | tee jsonl_dumps/load_errs.txt
ckanapi load organizations -I jsonl_dumps/org_statcan.jsonl 2>&1 >/dev/null | tee | grep -i error >> jsonl_dumps/load_errs.txt
echo done organizations | tee -a jsonl_dumps/load_errs.txt

date | tee -a jsonl_dumps/load_errs.txt
echo -codesets | tee jsonl_dumps/load_errs.txt
ckanapi load datasets -I jsonl_dumps/codesets.jsonl 2>&1 >/dev/null | tee | grep -i error >> jsonl_dumps/load_errs.txt
echo done codesets | tee -a jsonl_dumps/load_errs.txt

date | tee -a jsonl_dumps/load_errs.txt
echo -geolevels | tee -a jsonl_dumps/load_errs.txt
ckanapi load datasets -I jsonl_dumps/geolevels.jsonl 2>&1 >/dev/null | tee | grep -i error >> jsonl_dumps/load_errs.txt
echo done geolevels | tee -a jsonl_dumps/load_errs.txt

date | tee -a jsonl_dumps/load_errs.txt
echo -subjects | tee -a jsonl_dumps/load_errs.txt
ckanapi load datasets -p 3 -I jsonl_dumps/subjects.jsonl 2>&1 >/dev/null | tee | grep -i error >> jsonl_dumps/load_errs.txt
echo done subjects | tee -a jsonl_dumps/load_errs.txt

date | tee -a jsonl_dumps/load_errs.txt
echo -provinces | tee -a jsonl_dumps/load_errs.txt
ckanapi load datasets -p 3 -I jsonl_dumps/provinces.jsonl 2>&1 >/dev/null | tee | grep -i error >> jsonl_dumps/load_errs.txt
echo done provinces | tee -a jsonl_dumps/load_errs.txt

date | tee -a jsonl_dumps/load_errs.txt
echo -geodescriptors | tee -a jsonl_dumps/load_errs.txt
ckanapi load datasets -p 3 -I jsonl_dumps/geodescriptors.jsonl 2>&1 >/dev/null | tee | grep -i error >> jsonl_dumps/load_errs.txt
echo done geodescriptors | tee -a jsonl_dumps/load_errs.txt

date | tee -a jsonl_dumps/load_errs.txt
echo -surveys | tee -a jsonl_dumps/load_errs.txt
ckanapi load datasets -p 3 -I jsonl_dumps/surveys.jsonl 2>&1 >/dev/null | tee | grep -i error >> jsonl_dumps/load_errs.txt
echo done surveys | tee -a jsonl_dumps/load_errs.txt

date | tee -a jsonl_dumps/load_errs.txt
echo -cubes | tee -a jsonl_dumps/load_errs.txt
ckanapi load datasets -p 3 -I jsonl_dumps/cubes.jsonl 2>&1 >/dev/null | tee | grep -i error >> jsonl_dumps/load_errs.txt
echo done cubes | tee -a jsonl_dumps/load_errs.txt

date | tee -a jsonl_dumps/load_errs.txt
echo -views | tee -a jsonl_dumps/load_errs.txt
ckanapi load datasets -p 3 -I jsonl_dumps/views.jsonl 2>&1 >/dev/null | tee | grep -i error >> jsonl_dumps/load_errs.txt
echo done views | tee -a jsonl_dumps/load_errs.txt

date | tee -a jsonl_dumps/load_errs.txt
echo -indicators | tee -a jsonl_dumps/load_errs.txt
ckanapi load datasets -p 3 -I jsonl_dumps/indicators.jsonl 2>&1 >/dev/null | tee | grep -i error >> jsonl_dumps/load_errs.txt
echo done indicators | tee -a jsonl_dumps/load_errs.txt

date | tee -a jsonl_dumps/load_errs.txt
echo -conferences | tee -a jsonl_dumps/load_errs.txt
ckanapi load datasets -p 3 -I jsonl_dumps/conferences.jsonl 2>&1 >/dev/null | tee | grep -i error >> jsonl_dumps/load_errs.txt
echo done conferences | tee -a jsonl_dumps/load_errs.txt

date | tee -a jsonl_dumps/load_errs.txt
echo -services | tee -a jsonl_dumps/load_errs.txt
ckanapi load datasets -p 3 -I jsonl_dumps/services.jsonl 2>&1 >/dev/null | tee | grep -i error >> jsonl_dumps/load_errs.txt
echo done services | tee -a jsonl_dumps/load_errs.txt

date | tee -a jsonl_dumps/load_errs.txt
echo -pumfs | tee -a jsonl_dumps/load_errs.txt
ckanapi load datasets -p 3-I jsonl_dumps/pumfs.jsonl 2>&1 >/dev/null | tee | grep -i error >> jsonl_dumps/load_errs.txt
echo done pumfs | tee -a jsonl_dumps/load_errs.txt

date | tee -a jsonl_dumps/load_errs.txt
echo -analyticals | tee -a jsonl_dumps/load_errs.txt
ckanapi load datasets -p 3 -I jsonl_dumps/analyticals.jsonl 2>&1 >/dev/null | tee | grep -i error >> jsonl_dumps/load_errs.txt
echo done analyticals | tee -a jsonl_dumps/load_errs.txt

date | tee -a jsonl_dumps/load_errs.txt
echo -corrections | tee -a jsonl_dumps/load_errs.txt
ckanapi load datasets -p 3 -I jsonl_dumps/corrections.jsonl 2>&1 >/dev/null | tee | grep -i error >> jsonl_dumps/load_errs.txt
echo done corrections | tee -a jsonl_dumps/load_errs.txt

date | tee -a jsonl_dumps/load_errs.txt
echo rebuild search index | tee -a jsonl_dumps/load_errs.txt
paster --plugin=ckan search-index rebuild -r -e
echo done | tee -a jsonl_dumps/load_errs.txt
date | tee -a jsonl_dumps/load_errs.txt
