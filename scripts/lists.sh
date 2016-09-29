# create
curl --include --request POST http://localhost:3000/lists \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "list": {
      "title": "White Mountains Sept 2016"
    }
  }'

# update
curl --include --request PATCH http://localhost:3000/lists/$ID \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "list": {
      "title": "Maine Camping June 2016"
    }
  }'

#index
curl --include --request GET http://localhost:3000/lists \
  --header "Authorization: Token token=$TOKEN"

#show
curl --include --request GET http://localhost:3000/lists/$ID \
  --header "Authorization: Token token=$TOKEN"


#delete
curl --include --request DELETE http://localhost:3000/lists/$ID \
  --header "Authorization: Token token=$TOKEN"