# README

Nexoos Challenge

Seu desafio será completar o desenvolvimento dessa API capaz de gerir empréstimos, salvando informações necessárias do cliente para podermos realizar o cálculo do valor da parcela (PMT), além de haver a possibilidade de leitura desses dados pelo cliente.

Deve-se:

- Modelar o banco de dados parar ter os dados necessários do cálculo da PMT
- Completar as rotas `POST /loans` e `GET /loans/ID`, alterando a API para escrever e retornar dados do banco de dados.
  - Na escrita, deve-se calcular o valor da parcela (PMT) e salvar no banco de dados.

Sobre a PMT:

https://fia.com.br/blog/matematica-financeira/#:~:text=PMT%20s%C3%A3o%20pagamentos%20de%20mesmo,ou%20empresarial%20de%20forma%20recorrente.&text=Por%20isso%2C%20tamb%C3%A9m%20s%C3%A3o%20tratados,fixa%20de%20empr%C3%A9stimo%20ou%20financiamento

Cálculo da PMT:

http://ghiorzi.org/amortiza.htm


# Para executar execute os seguintes comandos

**INSTALL DEPENDENCIES**
```sh
  bundle install
```

**CREATE DATABASE**
```sh
  rails db:create db:migrate
```

**RUN THE SERVER API**
```sh
  rails server
```

**CONSOLE**
```sh
  rails console
```

**RUN RSPEC TESTS**
```sh
  rspec
```

# Post Request para Loans:

## With JSON body
```sh
curl --request POST \
  --url http://localhost:3000/loans \
  --header 'Content-Type: application/json' \
  --data '{
	"present_value": 1000.00,
	"rate": 0.02,
	"periods": 4
}'
```

## With Query Params
```sh
curl --request POST \
  --url 'http://localhost:3000/loans?present_value=1000.00&rate=0.02&periods=4'
```

Expected Response:

```json
{
  "loan": {
      "id": 1
  }
}
```

# Get Request para Loans:

```sh
curl --request GET \
  --url http://localhost:3000/loans/1
```

Expected Response:
```json
{
  "loan": {
      "id": 1,
      "pv": 1000.0,
      "rate": 0.02,
      "periods": 4,
      "pmt": 262.62
  }
}
```
