curl --include --request PATCH http://localhost:3000/lists/$ID \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "list": {
      "title": "Acadia Hiking"
    }
  }'