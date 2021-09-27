ten endpoint pozwala zarejestrować nowego użytkownika

przykładowe body requestu:

{
   "user":{
      "email":"testemai@gmail.coco2",
      "password":"test12",
      "password_confirmation":"test12"
   }
}

przykładowa odpowiedź: 

{
    "user": {
        "id": 5,
        "created_at": "2021-09-27T09:32:53.475Z",
        "updated_at": "2021-09-27T09:32:53.475Z",
        "email": "testemai@gmail.coco2",
        "authentication_token": "oWpB9gPwCK5n3eKQpzwm"
    }
}