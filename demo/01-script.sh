curl -X DELETE 'http://localhost:9200/wdcm'
curl -X GET 'http://localhost:9200'
curl -X POST 'http://localhost:9200/wdcm/topics/1' -d '{ "title": "WDCM am 11. Februar 2014 – Automation und Deployment" }'
curl -X POST 'http://localhost:9200/wdcm/topics/1' -d '{ "title": "WDCM am 11. Februar 2014 – Automation und Deployment", "date": "2014-02-11 19:00" }'

curl -X GET 'http://localhost:9200/wdcm/topics/1'

curl -X POST 'http://localhost:9200/wdcm/topics/2' -d '{ "title": "#25 Private Daten nach Hause holen – Vorteile einer Cloud ohne Google & Co.", "date": "2013-06-11 19:00" }'

curl -X GET 'http://localhost:9200/wdcm/topics/_search?q=automation&pretty'
