# create
curl --include --request POST http://localhost:3000/lists \
  --header "Content-Type: application/json" \
  --data '{
    "list": {
      "title": "Maine Camping July 2016"
    }
  }'

# update
curl --include --request PATCH http://localhost:3000/lists/1 \
  --header "Content-Type: application/json" \
  --data '{
    "list": {
      "title": "Maine Camping June 2016"
    }
  }'

#index
curl --include --request GET http://localhost:3000/lists

#show
curl --include --request GET http://localhost:3000/lists/1

#delete
curl --include --request DELETE http://localhost:3000/lists/1