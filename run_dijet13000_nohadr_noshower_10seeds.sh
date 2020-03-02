#!/bin/bash
#source /home/petr/.bashrc
# Energy:
b=13000
#echo "Type number of events:"
c=100000000
#c=100
echo "Running the analysis == rivet-buildplugin RivetMC_DIJET_PB.so MC_DIJET_PB.cc"
rivet-buildplugin RivetMC_DIJET_PB.so MC_DIJET_PB.cc
for s in 61972970 23354883 88615218 70896900 18669684 71917516 25202807 62914023 20426705 23209777;do
for j in 0 25 50 75 100 125 150 175;do
echo "Reading file == Herwig read LHC_pb13000_no_hadronization_${j}.in with seed $s.";
Herwig read LHC_pb13000_no_hadronization_${j}.in;
#mkdir ${s}_mass_window_start_${j}_900
mv LHC13000_${j}.run LHC13000_${j}_${s}.run;
#mv other_pdgid.txt ${s}_900_other_pdgid.txt
echo "Running Herwig == Herwig run LHC13000_${j}_${s}.run -N ${c} -s ${s}";
Herwig run LHC13000_${j}_${s}.run -N $c -s $s;
done;
done;

