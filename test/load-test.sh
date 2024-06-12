#!/bin/bash

cat ../model.pl > model.pl
cat ../knowledgebase.pl > knowledgebase.pl
python3 prepare.py $1 >> knowledgebase.pl

echo "starting load test (stage1: load data only)"
date
swipl -f test-case.pl -g halt
echo "load test finished (stage1: load data only)"
date

echo "starting load test (stage2: load data + validate)"
date
swipl -f test-case.pl -g loadTestValid -g halt > /dev/null
echo "load test finished (stage2: load data + validate)"
date

echo "starting load test (stage3: load data + explain)"
date
swipl -f test-case.pl -g loadTestExplain -g halt > /dev/null
echo "load test finished (stage3: load data + explain)"
date

rm model.pl
rm knowledgebase.pl

