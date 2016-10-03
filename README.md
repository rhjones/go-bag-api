# Go Bag API

A Rails API for [Go Bag](https://github.com/rebekahheacock/go-bag), a packing list app. Includes authentication.

## Dependencies

-   [`rails-api`](https://github.com/rails-api/rails-api)
-   [`rails`](https://github.com/rails/rails)
-   [`active_model_serializers`](https://github.com/rails-api/active_model_serializers)
-   [`ruby`](https://www.ruby-lang.org/en/)
-   [`postgres`](http://www.postgresql.org)
-   [`deep_cloneable`](https://github.com/moiristo/deep_cloneable)


## API Documentation

Scripts are included in [`scripts`](scripts) to test built-in actions.

### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |

#### POST /sign-up

Request:

```sh
curl --include --request POST http://localhost:3000/sign-up \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password",
      "password_confirmation": "an example password"
    }
  }'
```

```sh
scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email"
  }
}
```

#### POST /sign-in

Request:

```sh
curl --include --request POST http://localhost:3000/sign-in \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password"
    }
  }'
```

```sh
scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email",
    "token": "33ad6372f795694b333ec5f329ebeaaa"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH http://localhost:3000/change-password/$ID \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "an example password",
      "new": "super sekrit"
    }
  }'
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl --include --request DELETE http://localhost:3000/sign-out/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl --include --request GET http://localhost:3000/users \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "another@example.email"
    },
    {
      "id": 1,
      "email": "an@example.email"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:3000/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "another@example.email"
  }
}
```

### Lists

| Verb   | URI Pattern | Controller#Action |
|--------|-------------|-------------------|
| GET    | `/lists`    | `lists#index`     |
| GET    | `/lists/1`  | `lists#show`      |
| POST   | `/lists`    | `lists#create`    |
| POST   | `/clone/1`  | `lists#clone`     |
| PATCH  | `/lists/1`  | `lists#update`    |
| DELETE | `/lists/1`  | `lists#destroy`   |

#### GET /lists

Users are only permitted to access their own lists.

Request: 

```sh
curl --include --request GET http://localhost:3000/lists \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/list-index.sh
```

Response:
```
{
  "lists": [
    {
      "id":1,
      "title":"Kampala in January",
      "contents": []
    },
    {
      "id": 2,
      "title": "RightsCon 2016",
      "contents": []
    },
```

#### GET /lists/1

Users are only permitted to access their own lists.

Request: 

```sh
curl --include --request GET http://localhost:3000/lists/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/list-show.sh
```

Response:

```
HTTP/1.1 200 OK 
Content-Type: application/json; charset=utf-8

{
  "list": {
    "id": 1,
    "title": "Kampala in January",
    "contents": []
  }
}
```

#### POST /lists

Request:

```sh
curl --include --request POST http://localhost:3000/lists \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "list": {
      "title": "Camping"
    }
  }'
```

```sh
TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/list-create.sh
```

Response: 

```
HTTP/1.1 201 Created 
Content-Type: application/json; charset=utf-8

{
  "list": {
    "id": 39,
    "title": "camping",
    "contents": []
  }
}
```






## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
1.  All software code is licensed under GNU GPLv3.
