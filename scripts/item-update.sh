curl --include --request PATCH http://localhost:3000/items/$ID \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "item": {
      "name": "soapppp"
    }
  }'