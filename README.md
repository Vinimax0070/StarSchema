# Star Schema - Tabela Fato: Professor 📊

## Sobre o Projeto ✨
Este projeto foi desenvolvido para ilustrar e explicar o conceito de Star Schema (Esquema Estrela) em banco de dados, usando como exemplo uma tabela fato centrada em **Professor**. O Star Schema é amplamente utilizado em Data Warehousing e Business Intelligence devido à sua simplicidade e eficiência em consultas analíticas.

### O que é Star Schema? 🌟
O Star Schema é uma abordagem de modelagem de dados que organiza os dados em:

- **Tabela Fato**: Contém os dados numéricos e métricas principais para análise.
- **Tabelas Dimensão**: Contêm dados descritivos e contextuais, permitindo a navegação e interpretação dos dados na tabela fato.

No formato de estrela, a tabela fato é o centro, conectada diretamente a múltiplas tabelas dimensão, formando uma estrutura semelhante a uma estrela. ⭐

## Objetivo 🎯
Este projeto simula um cenário acadêmico onde analisamos informações relacionadas a professores, suas disciplinas, departamentos, localizações e datas, com base em uma modelagem de dados centralizada na tabela fato.

## Modelo Relacional 🗂️
### Diagrama Lógico 🖼️
![Modelo Star Schema](StarSchema.PNG)

O modelo é composto por:

- **Tabela Fato:** `fato_professor`
- **Tabelas Dimensão:**
  - `dim_professor`
  - `dim_disciplina`
  - `dim_departamento`
  - `dim_localizacao`
  - `dim_tempo`

### Estrutura das Tabelas 🏗️
#### 1. Tabela Fato: `fato_professor`
A tabela fato armazena métricas relacionadas à alocação de professores em disciplinas. Cada entrada é uma instância de um professor lecionando em uma disciplina em um determinado período.

**Colunas:**
- `id_fato` (PK): Identificador único da tabela fato.
- `id_professor` (FK): Chave estrangeira para a dimensão professor.
- `id_disciplina` (FK): Chave estrangeira para a dimensão disciplina.
- `id_departamento` (FK): Chave estrangeira para a dimensão departamento.
- `id_localizacao` (FK): Chave estrangeira para a dimensão localização.
- `id_tempo` (FK): Chave estrangeira para a dimensão tempo.
- `carga_horaria`: Carga horária total lecionada.
- `avaliacao`: Avaliação média do professor (0-10).

#### 2. Dimensão: `dim_professor`
Armazena informações detalhadas sobre os professores.

**Colunas:**
- `id_professor` (PK): Identificador único do professor.
- `nome`: Nome completo do professor.
- `titulação`: Titulação acadêmica (ex.: Mestre, Doutor).
- `data_admissao`: Data de admissão na instituição.

#### 3. Dimensão: `dim_disciplina`
Armazena informações sobre as disciplinas lecionadas.

**Colunas:**
- `id_disciplina` (PK): Identificador único da disciplina.
- `nome`: Nome da disciplina.
- `carga_horaria`: Carga horária total da disciplina.

#### 4. Dimensão: `dim_departamento`
Armazena informações sobre os departamentos acadêmicos.

**Colunas:**
- `id_departamento` (PK): Identificador único do departamento.
- `nome`: Nome do departamento.
- `responsavel`: Nome do responsável pelo departamento.

#### 5. Dimensão: `dim_localizacao`
Armazena dados sobre a localização dos departamentos e salas de aula.

**Colunas:**
- `id_localizacao` (PK): Identificador único da localização.
- `campus`: Nome do campus.
- `prédio`: Nome ou número do prédio.
- `sala`: Número da sala.

#### 6. Dimensão: `dim_tempo`
Armazena informações temporais para análises baseadas em tempo.

**Colunas:**
- `id_tempo` (PK): Identificador único de tempo.
- `data`: Data específica.
- `ano`: Ano da data.
- `mes`: Mês da data.
- `dia_semana`: Nome do dia da semana.

## Como Executar o Projeto 🚀

### Pré-requisitos 🛠️
- MySQL, PostgreSQL ou outro SGBD de sua preferência instalado.
- Cliente SQL (opcional, mas recomendado).

### Passos 📋
1. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/star-schema-professor.git
   ```
2. Importe o script SQL para criar as tabelas e popular os dados:
   ```sql
   -- Execute o script sql/modelo_star_schema.sql no seu SGBD.
   ```
3. Explore as tabelas e execute consultas analíticas! 🔍

## Consultas de Exemplo 📊
### Exemplo 1: Avaliação média por disciplina
```sql
SELECT 
    d.nome AS disciplina,
    AVG(f.avaliacao) AS avaliacao_media
FROM 
    fato_professor f
JOIN 
    dim_disciplina d ON f.id_disciplina = d.id_disciplina
GROUP BY 
    d.nome;
```

### Exemplo 2: Carga horária total por professor
```sql
SELECT 
    p.nome AS professor,
    SUM(f.carga_horaria) AS carga_horaria_total
FROM 
    fato_professor f
JOIN 
    dim_professor p ON f.id_professor = p.id_professor
GROUP BY 
    p.nome;
```

## Contribuição 🤝
Sinta-se à vontade para contribuir com melhorias neste projeto enviando PRs ou sugestões.

---
**Autor:** Vinicius Antonioli Shinohara
**GitHub:** [Meu Git](https://github.com/Vinimax0070) 🌐
