ten endpoint pozwala zewnętrznym usługom sprawdzić czy kontener w którym dziala aplikacja
jest "zdrowy" czyli czy działa. Jeżeli nasza aplikacja nie potrafi odpowiedzieć na request
wysłany na ten endpoint najczęściej oznacza to, że nie potrafi odpowiedzieć na zapytanie na 
jakikolwiek endpoint. Poprawna odpowiedź na ten enpoint zazwyczaj zapewnia, że serwer działa 
ale nie ozancza, że inne endpointy nie zawierają błędów logicznych. (np. zwracanie niewłaściwej wartości lub
bug w kodzie)