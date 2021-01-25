# HEADHUNTERS

Headhunters é uma plataforma web onde headhunters​ e candidatos se
relacionarem em torno de vagas de emprego. Os candidatos podem criar uma conta na
plataforma para buscar vagas e se inscrever para os processos seletivos. Os headhunters
cadastram suas vagas e recebem inscrições de candidatos. A partir da inscrição de um
candidato em uma vaga, pode haver uma troca de mensagens, agendamento de entrevista,
envio de proposta e envio de feedbacks.

## Projeto em desenvolvimento :warning:

# Requisitos :wrench:

* Ruby version 2.7.2
* Rails version 5.2.4.4
* Node 14.15.4
* Yarn 1.22.10

# GEMS :gem:

* Capybara
* Rspec_rails
* Factory Bot

# FEATURES :pushpin:

Candidato                              
---------                               
- [ ] Candidato cria uma conta        
- [ ] Candidato completa o seu perfil  
- [ ] Ver vagas disponíveis            
- [ ] Buscar uma vaga                
- [ ] Inscrever-se em uma vaga        
- [ ] Receber proposta do recrutador  
- [ ] Aceitar a proposta              
- [ ] Rejeitar a proposta             
                                       
Recrutador
----------
- [ ] Recrutador cria uma conta
- [ ] Recrutador cadastra uma vaga
- [ ] Ver candidato inscritos para uma vaga
- [ ] Escrever comentários no perfil do candidato
- [ ] Marcar candidato como destaque
- [ ] Recusar candidato em vaga 
- [ ] Enviar proposta para o candidato
- [ ] Ver feedback das propostas
- [ ] Encerrar uma vaga

# Instruções :runner:

Clone o projeto no diretório de sua preferência:
```
git clone git@github.com:rcleyton/headhunter.git
```
Acesse o diretório:
```
cd headhunter
```
Run
```
yarn install
```
Instalando as Gems do projeto (O parâmetro garante que não precisamos instalar 
as gems de produção no ambiente de desenvolvimento. Um exemplo é que o ambiente
de desenvolvimento utiliza sqlite como BD, enquanto produção com deploy no
heruko utiliza Postgres)
```
bundle install --without production
```
Criando o BD
```
rails db:create
```
Executando a Migrate
```
rails db:migrate
```
Execuntando a aplicação. Após o comando abaixo, acesse http://127.0.0.1:3000/
```
rails server
```
