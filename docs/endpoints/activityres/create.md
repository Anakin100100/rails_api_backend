ten endpoint pozwala dodać nową aktywność:

przykładowe body requestu: 

{
    "user": {
        "authentication_token": "D-cUqhTG3_Jsqepe-Byt",
        "id": 4
    },
    "activity": {
        "name": "test activity name"
    }
}

przykładowa odpowiedź:

{
    "message": "activity added",
    "activity": {
        "id": 2,
        "user_id": 4,
        "name": "test activity name",
        "created_at": "2021-09-27T09:02:32.717Z",
        "updated_at": "2021-09-27T09:02:32.717Z"
    }
}