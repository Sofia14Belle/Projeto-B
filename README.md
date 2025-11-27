# Dunnas-Challenge

**Sistema de controle de entrada de visitantes** — Projeto em Ruby on Rails desenvolvido como desafio técnico e para fins acadêmicos.

---

## Sumário

- [Descrição do projeto](#descrição-do-projeto)  
- [Equipe](#equipe)  
- [Objetivo Geral](#objetivo-geral)  
- [Tecnologias e Ferramentas](#tecnologias-e-ferramentas)  
- [Estrutura do Repositório](#estrutura-do-repositório)  
- [Plano de Testes (resumo)](#plano-de-testes-resumo)  
- [Testes Automatizados](#testes-automatizados)  
- [Instruções de instalação e execução](#instruções-de-instalação-e-execução)  
- [Métricas e Estimativas](#métricas-e-estimativas)  
- [Revisão Técnica](#revisão-técnica)  
- [Versionamento e Branching](#versionamento-e-branching)  
- [GitHub Pages / Landing Page](#github-pages--landing-page)  
- [Execução passo a passo (local e testes)](#execução-passo-a-passo-local-e-testes)  
- [Referências / Observações](#referências--observações)

---

## Descrição do projeto

Dunnas-Challenge é um sistema web construído com **Ruby on Rails** cujo objetivo é gerenciar o registro de visitantes (cadastro, registro de entrada/saída, relatórios). O projeto demonstra boas práticas de engenharia de software: testes automatizados, containerização (Docker), documentação e uso de controle de versão.

---

## Equipe

- Keyllian7 (autor / repositório principal)  
*Sofia de Souza Beleza*

---

## Objetivo Geral

Desenvolver e documentar um software funcional aplicando boas práticas de qualidade (testes, coverage, versionamento, documentação e apresentação) conforme os requisitos do Projeto A3 da disciplina de Gestão e Qualidade de Software. :contentReference[oaicite:1]{index=1}

---

## Tecnologias e Ferramentas

- Linguagem: **Ruby**  
- Framework: **Ruby on Rails**  
- Testes: **Minitest** (pasta `test/`) — (ou RSpec se presente)  
- Containerização: **Docker**, **docker-compose**  
- Cobertura: **SimpleCov** (sugerido)  
- Linter / estilo: **RuboCop** (sugerido)  
- CI: **GitHub Actions** (workflow para rodar testes)  
- Controle de versão: **Git** (GitHub)  
- Deploy / Landing Page: **GitHub Pages** (index estático)

---

## Estrutura do Repositório (padrão Rails)

- `app/` — controllers, models, views  
- `config/` — rotas e configurações  
- `db/` — migrations e seeds  
- `test/` ou `spec/` — suites de teste  
- `Dockerfile`, `docker-compose.yml` — containerização  
- `README.md` — este arquivo

---

## Plano de Testes (resumo)

Veja o arquivo `TEST_PLAN.md` neste repositório para a tabela completa de casos de teste (manuais e automatizados). O plano cobre funcionalidades críticas: cadastro de visitante, registro de visita, autenticação, rotas API, validações e fluxo de containerização.

---

## Testes Automatizados — Ferramentas utilizadas

- **Minitest** (padrão Rails) ou **RSpec** (se presente)  
- **SimpleCov** para relatório de cobertura de testes  
- Comando (exemplo):  
  - `bundle exec rails test` (Minitest)  
  - `bundle exec rspec` (RSpec)  
- CI: GitHub Actions — rodar testes em push/pull request.

---

## Instruções de instalação e execução

### Requisitos locais
- Ruby (versão compatível com o projeto — veja `Gemfile`)  
- Bundler (`gem install bundler`)  
- Docker & docker-compose (opcional, recomendado)

### Rodando com Docker (modo recomendado)
1. Copiar `.env.example` para `.env` e ajustar variáveis (se existir).  
2. Construir e subir containers:
   ```bash
   docker-compose build
   docker-compose up -d
