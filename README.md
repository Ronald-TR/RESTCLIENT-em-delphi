# RESTCLIENT-em-delphi
Uma classe para consultas a APIs RESTful, onde recebe-se a BaseURL, o Recurso,o Valor (opcionais a depender se os dados da BaseURL são suficientes) e o verbo HTTP (padrão GET se não especificado), retornando uma string JSON.

Exemplo de chamada inline simples com "garbage collector" de um json text \n TcRest.New('https://jsonplaceholder.typicode.com/posts').Executar('get'));
