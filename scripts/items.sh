# create
curl --include --request POST http://localhost:3000/items \
  --header "Content-Type: application/json" \
  --data '{
    "item": {
      "name": "toothbrush"
    }
  }'

# update
curl --include --request PATCH http://localhost:3000/items/2 \
  --header "Content-Type: application/json" \
  --data '{
    "item": {
      "name": "shampoo"
    }
  }'

#index
curl --include --request GET http://localhost:3000/items

#show
curl --include --request GET http://localhost:3000/items/2

#delete
curl --include --request DELETE http://localhost:3000/items/1