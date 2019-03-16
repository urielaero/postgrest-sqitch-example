#! /bin/bash
export TESTAPI='http://localhost:3000'
failed=0
(./bin/postgrest ./postgREST.conf) & pgpid=$!
sleep 1
for filename in test/*test.yaml; do
    echo "run test for $filename"
    ./bin/curl-runnings -f $filename
    if [ $? == 1 ] ; then
        failed=1;
    fi
done

kill -9 $pgpid

exit $failed
