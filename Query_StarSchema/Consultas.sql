-- 1. Avaliação média por disciplina
SELECT 
    d.nome AS disciplina,
    AVG(f.avaliacao) AS avaliacao_media
FROM 
    fato_professor f
JOIN 
    dim_disciplina d ON f.id_disciplina = d.id_disciplina
GROUP BY 
    d.nome;

-- 2. Carga horária total por professor
SELECT 
    p.nome AS professor,
    SUM(f.carga_horaria) AS carga_horaria_total
FROM 
    fato_professor f
JOIN 
    dim_professor p ON f.id_professor = p.id_professor
GROUP BY 
    p.nome;

-- 3. Professores com maior avaliação média
SELECT 
    p.nome AS professor,
    AVG(f.avaliacao) AS avaliacao_media
FROM 
    fato_professor f
JOIN 
    dim_professor p ON f.id_professor = p.id_professor
GROUP BY 
    p.nome
ORDER BY 
    avaliacao_media DESC
LIMIT 5;

-- 4. Carga horária por campus
SELECT 
    l.campus AS campus,
    SUM(f.carga_horaria) AS carga_horaria_total
FROM 
    fato_professor f
JOIN 
    dim_localizacao l ON f.id_localizacao = l.id_localizacao
GROUP BY 
    l.campus;

-- 5. Distribuição de aulas por ano
SELECT 
    t.ano AS ano,
    COUNT(*) AS total_aulas
FROM 
    fato_professor f
JOIN 
    dim_tempo t ON f.id_tempo = t.id_tempo
GROUP BY 
    t.ano;

-- 6. Professores que lecionaram em mais de um departamento
SELECT 
    p.nome AS professor,
    COUNT(DISTINCT f.id_departamento) AS departamentos_distintos
FROM 
    fato_professor f
JOIN 
    dim_professor p ON f.id_professor = p.id_professor
GROUP BY 
    p.nome
HAVING 
    departamentos_distintos > 1;

-- 7. Avaliação média por departamento
SELECT 
    d.nome AS departamento,
    AVG(f.avaliacao) AS avaliacao_media
FROM 
    fato_professor f
JOIN 
    dim_departamento d ON f.id_departamento = d.id_departamento
GROUP BY 
    d.nome;

-- 8. Aulas realizadas em um prédio específico
SELECT 
    l.predio AS predio,
    COUNT(*) AS total_aulas
FROM 
    fato_professor f
JOIN 
    dim_localizacao l ON f.id_localizacao = l.id_localizacao
WHERE 
    l.predio = 'Bloco A'
GROUP BY 
    l.predio;

-- 9. Professores mais antigos (por data de admissão)
SELECT 
    p.nome AS professor,
    p.data_admissao
FROM 
    dim_professor p
ORDER BY 
    p.data_admissao ASC
LIMIT 10;

-- 10. Total de carga horária por mês
SELECT 
    t.mes AS mes,
    SUM(f.carga_horaria) AS carga_horaria_total
FROM 
    fato_professor f
JOIN 
    dim_tempo t ON f.id_tempo = t.id_tempo
GROUP BY 
    t.mes
ORDER BY 
    t.mes;
