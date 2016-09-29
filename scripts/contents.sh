# create
curl --include --request POST http://localhost:3000/contents \
  --header "Content-Type: application/json" \
  --data '{
    "content": {
      "item_id": "4",
      "list_id": "4",
      "packed": false
    }
  }'

# update
curl --include --request PATCH http://localhost:3000/contents/1 \
  --header "Content-Type: application/json" \
  --data '{
    "content": {
      "item_id": "3",
      "list_id": "2",
      "packed": true
    }
  }'

#index
curl --include --request GET http://localhost:3000/contents

#show
curl --include --request GET http://localhost:3000/contents/1

#delete
curl --include --request DELETE http://localhost:3000/contents/1