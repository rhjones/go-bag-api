curl --include --request POST http://localhost:3000/clone/$ID \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{}'