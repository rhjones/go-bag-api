curl --include --request PATCH http://localhost:3000/contents/$ID \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "content": {
      "packed": true
    }
  }'