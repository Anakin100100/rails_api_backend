ten endpoint pozwala zalogować istniejącego użytkownika użytkownika i uzyskać authentucation_token

przykładowe body requestu:

{
   "user":{
      "email":"testemai@gmail.coco2",
      "password":"test12"
   }
}

przykładowa odpowiedź: 

{
    "user": {
        "authentication_token": "DSF4v6DkfUAbTyMAxsBc",
        "email": "testemai@gmail.coco2",
        "id": 5,
        "created_at": "2021-09-27T09:32:53.475Z",
        "updated_at": "2021-09-27T09:35:05.793Z"
    }
}