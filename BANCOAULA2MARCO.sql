-- EXIBIR NOTICIAS ONDE EXISTE A PALAVRA "tecnologia" em sua DESCRIÇÃO;
-- ERRADO --- SELECT titulo, texto FROM noticia WHERE descricao LIKE "%tecnologia%";

SELECT titulo, texto, descricao FROM noticia
INNER JOIN categoria
ON categoria_idcategoria = idcategoria
WHERE descricao LIKE "%tec%";


-- EXIBIR NOTICIAS DA CATEGORIA "MUNDO", CONTENDO TODOS OS DETALHES, COMO TÍTULO, DATA, ETC
SELECT titulo, texto, data, descricao FROM noticia
INNER JOIN categoria
ON categoria_idcategoria = idcategoria
WHERE descricao = "mundo";

-- Selecione todos os usuários com id's entre 100 e 200
SELECT nome, idusuario FROM usuario WHERE idusuario BETWEEN 100 AND 200;

-- Selecione todos os usuários com id's entre 100, 103 e 150
SELECT nome, idusuario FROM usuario WHERE idusuario in (100,103,200);

-- Selecione todas as notícias escritas pelo usuário 100 ordenando por categoria
INSERT INTO noticia values
('14','Greve', '2023-02-24', 'Caminhoneiros entram em greve', 'C:\fotos\image10.jpg', '100', '2' ); 
INSERT INTO noticia values
('15','Rainha do Funk Adulto', '2023-01-20', 'McPipokinha diz estar "farta de ser rainha".', 'C:\fotos\image03.jpg', '100', '1' );


-- Selecione todas as notícias escritas pelo usuário 200 ordenando por categoria
SELECT * FROM noticia
INNER JOIN categoria
ON categoria_idcategoria = idcategoria
INNER JOIN usuario
on usuario_idusuario = idusuario
WHERE idusuario = 100
ORDER BY descricao;

-- Selecionar todas as descrições das categorias que começam com a letra E ou M
SELECT descricao FROM categoria 
WHERE descricao LIKE "E%" or descricao LIKE "M%"; 

-- Selecionar todos os títulos de notícias que tem a palavra guerra.
SELECT titulo FROM noticia
WHERE titulo LIKE "%GUERRA%";

-- selecionar imagens com formato .jpg
SELECT * FROM noticia WHERE imagem LIKE "%jpg";

-- selecionar emails do tipo gmail
SELECT nome, email FROM usuario 
WHERE email LIKE '%GMAIL%';

-- Atualize a data de todas as notícias com categoria de número 2 para 26 de fevereiro de 2022.
UPDATE noticia
SET noticia.data = '2022-02-26'
WHERE categoria_idcategoria = 2;

 
-- Atualize a descrição de todas as notícias por ‘Novidades em breve’.
UPDATE noticia
SET noticia.data = '2022-02-26'
WHERE categoria_idcategoria = 2;


-- adicionar mais comentário para fazer o próximo exercício
INSERT INTO `sitenoticias`.`comentario`
values
('129', '2023-01-30', 'Essa mulher é uma depravada!', '100', '15' );

-- Selecionar a notícia com mais comentários em 2022
SELECT * FROM noticia
INNER JOIN comentario
ON idnoticia = noticia_idnoticia;

SELECT titulo, count(idcomentario) as coment FROM noticia
INNER JOIN comentario
ON idnoticia = noticia_idnoticia
GROUP BY idnoticia
ORDER BY coment DESC LIMIT 1;


-- Quantos dias se passaram a partir da última notícia
-- encontrar ultima noticia
SELECT titulo, noticia.data, DATEDIFF(curdate(), data) from noticia 
WHERE data < curdate()
ORDER BY noticia.data asc LIMIT 1;


-- verificar a diferença de dia entre o primeiro e o último registro da tabela noticias;
SELECT titulo, datediff(MAX(data), MIN(data))
FROM noticia;

-- exibir o nome do mês do primeiro registro
SELECT monthname(data)
FROM noticia
ORDER BY idnoticia LIMIT 1;


