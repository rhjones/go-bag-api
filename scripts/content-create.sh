curl --include --request POST http://localhost:3000/contents \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "content": {
      "item_id": "2",
      "list_id": "8",
      "packed": false
    }
  }'