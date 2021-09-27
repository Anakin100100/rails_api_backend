ten endpoint pozwala wylogować istniejącego użytkownika użytkownika i unieważnić authentucation_token

przykładowe body requestu:

{
    "user": {
        "authentication_token": "DSF4v6DkfUAbTyMAxsBc",
        "id": 5
    }
}

przykładowa odpowiedź: 

{
    "message": "logged out succesfully"
}