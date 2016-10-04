curl --include --request POST http://localhost:3000/items \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "item": {
      "name": "shirt"
    }
  }'