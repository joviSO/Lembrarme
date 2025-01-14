# Lembrar-me

**Gerencie suas listas e tarefas de maneira eficiente**

[Lembrar-me](https://lembrarme.onrender.com/) é um sistema simples e leve para ajudar você a se organizar com suas listas e metas de forma prática. Ele permite criar e gerenciar listas com itens, definir objetivos e manter as suas tarefas no controle.

---

## Tecnologias utilizadas

- **Ruby on Rails** 7.1.5: Framework robusto para aplicação web.
- **PostgreSQL** 18: Banco de dados relacional utilizado para armazenar listas, itens e usuários.
- **Bootstrap** 5: Framework CSS para construção da interface responsiva.
- **Stimulus** e **Hotwire**: Para adicionar interatividade ao frontend.
- **Bcrypt**: Para autenticação segura dos usuários.

---

## Link do projeto

- Acesse o sistema em produção: [Lembrar-me (lembrarme.onrender.com)](https://lembrarme.onrender.com)

---

## Deploy e Infraestrutura

- **Hospedagem**: O deploy da aplicação foi feita utilizando o [Render](https://render.com/).
- **Banco de dados**: O [Supabase](https://supabase.com/) foi utilizado para armazenar o banco de dados na nuvem.

---

## Funcionalidades principais

1. **Criação de listas com itens**:
    - Permite ao usuário organizar tarefas e dividir suas metas em partes menores.

2. **Definição de metas**:
    - Crie objetivos para tornar os desafios mais interessantes.

3. **E-mails para listas repetitivas (planejado)**:
    - Apesar de não ter sido implementado, havia uma funcionalidade planejada de envio de e-mails automatizados para listas com repetição (por exemplo: compras mensais, pagamento de contas, etc.).

---

## Estrutura do projeto

A estrutura do sistema é simples e eficiente:

- **Usuário** - Pode ter uma ou mais listas.
- **Lista** - Cada lista pode ter um ou mais itens.
- **Item** - É o elemento principal da lista (uma tarefa específica, por exemplo).

---

## Como rodar o projeto localmente

1. **Pré-requisitos**:
    - Ruby 3.3.1
    - Bundler 2.5.10
    - PostgreSQL 18
    - Node.js (para gerenciar pacotes do frontend)

2. **Clone o repositório (ssh)**:
   ```bash
   git clone git@github.com:joviSO/Lembrarme.git
   cd Lembrarme
   ```

3. **Instale as dependências do projeto**:
   ```bash
   bundle install
   yarn install
   ```

4. **Configure o banco de dados**:
   Adicione suas credenciais no arquivo `config/database.yml` e inicialize o banco:
   ```bash
   rails db:create
   rails db:migrate
   ```

5. **Inicie o servidor localmente**:
   ```bash
   rails server
   ```

6. **Acesse no navegador**:
   [http://localhost:3000](http://localhost:3000)

---

## Futuras melhorias

- Implementação de **jobs** para envio automatizado de e-mails agendados.
- Melhorias na interface do usuário para maior produtividade.

---

## Licença

Este projeto está sob a licença **MIT**. Sinta-se livre para usar, modificar e distribuir!

---

Feito com 💙 por [joviSO]. 😊

## Features

Autentição de usuario;\
usuario apenas interage com o que é seu;

## Bugs conhecidos

Existe um bug na hora de listar os To Dos, cada item tem seu estado e eles podem sem modificados apenas clicando na tag **li**, mas por algum motivo a pagina precisa ser recarregada para isso;\
Na hora de Editar listas são gerados novos campos que não precisam ser preenchidos, mas precisam ser removidos manualmente;\
Quando se adicionam novos items na tela de Edição aparecem a quantidade de campos igual aos campos que haviam previamente;
