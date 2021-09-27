ten endpoint pozwala wczytać istniejącą aktywność:

przykładowe body requestu: 

{
    "user": {
        "authentication_token": "D-cUqhTG3_Jsqepe-Byt",
        "id": 4
    },
    "activity": {
        "id": 3
    }
}

przykładowa odpowiedź:

{
    "message": "activity fetched successfully",
    "activity": {
        "id": 3,
        "user_id": 4,
        "name": "test activity name",
        "created_at": "2021-09-27T09:19:40.350Z",
        "updated_at": "2021-09-27T09:19:40.350Z"
    }
}