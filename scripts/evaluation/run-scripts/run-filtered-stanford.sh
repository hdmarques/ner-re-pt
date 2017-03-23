#!/bin/bash

# join output from stanford ner and test file
# evaluate results
for r in {1..3}
do
	for i in {0..9}
	do
		TOOL=../../../tools/stanford-ner
		IN_NER=$TOOL/outputs/ner-results/repeat-$r/fold-$i
		IN_GOLD=$TOOL/outputs/repeat-$r/fold-$i
		OUT_RES=../results/stanford-ner/repeat-$r/fold-$i

		../join-output-golden.sh $IN_NER/out-filtered.txt $IN_GOLD/t_filtered_test.txt | ../conlleval > $OUT_RES/filtered.txt
	done

	python ../src/avg-results.py stanford-ner filtered $r
done