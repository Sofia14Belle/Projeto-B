# 📋 Plano de Testes — Dunnas Challenge

Este documento descreve o plano de testes do sistema **Dunnas Challenge**, incluindo casos de teste funcionais, não funcionais, automação recomendada e matriz de rastreabilidade.

---

## 🎯 Objetivo do Plano de Testes
Garantir que as funcionalidades essenciais do sistema de controle de visitantes funcionem conforme o esperado, cobrindo:

- Cadastro de visitantes  
- Registro de entrada e saída  
- Validações  
- Autenticação (se existir)  
- Rotas e controllers  
- Banco de dados e migrations  
- Containerização (Docker)  
- Segurança básica (XSS, validação)

---

# 🧪 Tabela de Casos de Teste

| ID   | Caso de teste                           | Pré-condição / Setup                    | Passos                                                             | Dados de teste                                | Resultado esperado                                                        | Tipo           | Prioridade |
|------|------------------------------------------|------------------------------------------|--------------------------------------------------------------------|-----------------------------------------------|---------------------------------------------------------------------------|----------------|------------|
| T001 | Cadastro de visitante válido             | App rodando                              | 1. Abrir formulário<br>2. Preencher<br>3. Enviar                  | nome: Maria<br>email: maria@mail.com          | Visitante criado e listado                                                | Automatizável  | Alta       |
| T002 | Cadastro inválido (email inválido)       | App rodando                              | 1. Preencher email inválido<br>2. Salvar                           | email: maria_at_mail                          | Validação exibida, registro não criado                                   | Auto/Manual    | Alta       |
| T003 | Campos obrigatórios                      | App rodando                              | 1. Submeter sem nome                                               | nome: vazio                                    | Erro: campo obrigatório                                                   | Automatizável  | Alta       |
| T004 | Registrar entrada (check-in)              | Visitante cadastrado                      | 1. Selecionar visitante<br>2. Registrar entrada                    | visitante_id                                   | Check-in criado com timestamp                                             | Automatizável  | Alta       |
| T005 | Registrar saída (check-out)               | Visita em aberto                          | 1. Abrir visita<br>2. Registrar saída                               | visita_id                                      | Campo check_out preenchido                                                | Automatizável  | Alta       |
| T006 | Listagem de visitantes                    | Banco com visitantes                      | 1. Abrir lista                                                      | —                                             | Lista exibida sem erros                                                    | Manual         | Média      |
| T007 | Autenticação válida (se existir login)    | Usuário registrado                        | 1. Acessar login<br>2. Inserir credenciais                          | email + senha                                  | Login bem-sucedido                                                        | Automatizável  | Alta       |
| T008 | Autenticação inválida                     | —                                        | 1. Inserir dados errados                                            | email inválido                                 | Mensagem de falha                                                         | Automatizável  | Alta       |
| T009 | Permissão: usuário sem acesso             | Usuário "viewer"                          | 1. Tentar excluir visitante                                         | —                                             | Ação negada / erro 403                                                     | Manual/Auto    | Média      |
| T010 | API CRUD visitante                        | API habilitada                            | Testar GET/POST/PUT/DELETE                                          | JSON válido/ inválido                          | Status corretos (200/201/204/422)                                         | Automatizável  | Alta       |
| T011 | Migrations                               | Rodar migrations                         | 1. Executar `rails db:migrate`                                      | —                                             | Migração sem erro, tabelas corretas                                       | Automatizável  | Alta       |
| T012 | Docker build                              | Docker instalado                          | 1. `docker-compose build`                                           | —                                             | Containers constroem sem erros                                            | Manual/Auto    | Alta       |
| T013 | Docker run                                | Containers criados                        | 1. `docker-compose up`                                              | —                                             | App disponível em localhost                                               | Manual         | Alta       |
| T014 | Segurança XSS                             | Forms de texto                            | 1. Inserir `<script>alert(1)</script>`                              | XSS payload                                   | Script não executa, texto é escapado                                      | Automatizável  | Alta       |
| T015 | Performance básica                        | 500+ visitantes                           | 1. Abrir listagem                                                   | —                                             | Página carrega < 2 segundos                                               | Manual         | Baixa      |
| T016 | Rotas principais (smoke test)            | Server ativo                              | 1. Acessar `/`                                                       | —                                             | Resposta HTTP 200                                                         | Automatizável  | Alta       |

---

# 🔗 Matriz de Rastreabilidade

| Requisito                     | Casos de Teste Relacionados |
|-------------------------------|------------------------------|
| R1 – Cadastro visitante       | T001, T002, T003            |
| R2 – Registro de visita       | T004, T005                  |
| R3 – Listagem                 | T006                        |
| R4 – Autenticação             | T007, T008                  |
| R5 – Segurança                | T014                        |
| R6 – API                      | T010                        |
| R7 – Infraestrutura (Docker)  | T012, T013                  |
| R8 – Rotas                    | T016                        |

---

# 🤖 Automação Recomendada

Estes testes devem ser **automatizados** (Minitest já implementado nos arquivos que criei para você):

- ✔ T001 — Cadastro válido  
- ✔ T002 — Cadastro inválido  
- ✔ T004 — Check-in  
- ✔ T005 — Check-out  
- ✔ T010 — API  
- ✔ T011 — Migrations  
- ✔ T016 — Smoke test

Todos já estão cobertos pelos **arquivos que gerei antes**.

---

# 📌 Observações

- Tests automatizados ficam em `/test`
- SimpleCov gera relatório em `/coverage/index.html`
- Testes rodam via:

