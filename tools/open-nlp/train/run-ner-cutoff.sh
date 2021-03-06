#!/bin/bash

printf "\n** performing ner cutoff **\n"
for r in {0..3}
do
	printf "\n** repeat "$r" **\n"
	for i in 0 {3..7} 10
	do
		FOLDER=../outputs/repeat-$r/joined
		MODEL=models/repeat-$r/experiences/cutoff/$i
		RESULTS=results/repeat-$r/experiences/cutoff/$i
		printf "\n** cutoff value: "$i" **\n"
		printf "\n** testing categories **\n"
		iconv -f ISO-8859-1 -t UTF-8 $FOLDER/cat_test_sent_doc-clean.xml | bin/opennlp TokenNameFinder $MODEL/pt-ner-cat.bin > $RESULTS/out-cat.txt
		printf "\n** testing types **\n"
		iconv -f ISO-8859-1 -t UTF-8 $FOLDER/types_test_sent_doc-clean.xml | bin/opennlp TokenNameFinder $MODEL/pt-ner-types.bin > $RESULTS/out-types.txt
		printf "\n** testing subtypes **\n"
		iconv -f ISO-8859-1 -t UTF-8 $FOLDER/subtypes_test_sent_doc-clean.xml | bin/opennlp TokenNameFinder $MODEL/pt-ner-subtypes.bin > $RESULTS/out-subtypes.txt
		printf "\n** testing filtered **\n"
		iconv -f ISO-8859-1 -t UTF-8 $FOLDER/filtered_test_sent_doc-clean.xml | bin/opennlp TokenNameFinder $MODEL/pt-ner-filtered.bin > $RESULTS/out-filtered.txt
	done
done
