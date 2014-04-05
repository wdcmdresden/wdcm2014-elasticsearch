curl -X POST "http://localhost:9200/wdcm/topics/_search?pretty=true" -d '
{
  "facets" : {
    "categories" : { "terms" : {"field" : "categories"} },
    "year" : { "terms" : {"field" : "year"} },
    "author" : { "terms" : {"field" : "authors"} }
  }
} ' | ./jq .facets | less
