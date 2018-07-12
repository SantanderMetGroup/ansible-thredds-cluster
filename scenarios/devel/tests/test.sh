DATASET1='http://localhost:9000/thredds/dodsC/collection1/singleDataset.nc.html'
DATASET2='http://localhost:9000/thredds/dodsC/collection2/singleDataset.nc.html'
RESTRICTED='http://localhost:9000/thredds/restrictedAccess/restringido'
USER='alice'
PASSWORD='1234'

CURL_OPTS='-v -o /dev/null -L --cookie-jar cookie.txt -b cookie.txt'

if [ -f cookie.txt ]; then
	rm cookie.txt
fi

curl $CURL_OPTS $DATASET1
curl $CURL_OPTS -u alice:1234 $DATASET2
