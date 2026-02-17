
select email
from sales.customers;

select 
first_name, email 
from sales.customers;

select *
from sales.customers;

select distinct first_name, email 
from sales.customers;

select brand
from sales.products

select distinct brand
from sales.products

select distinct brand, model_year
from sales.products

select email,state
from sales.customers
where state = 'SC';

select distinct state
from sales.customers

select email,state
from sales.customers
where state = 'SC' or  state ='MS';

select email,state
from sales.customers
where (state = 'SC' or  state ='MS') and date '2026-01-23' - birth_date >=30;

-- SELECT email,
--        state,
--        EXTRACT(YEAR FROM AGE('2026-01-23', birth_date)) AS age
-- FROM sales.customers
-- WHERE (state IN ('SC', 'MS')) 
--   AND EXTRACT(YEAR FROM AGE('2026-01-23', birth_date)) >= 30; dica da ia 

select *
from sales.products
order by price asc

select distinct state
from sales.customers
order by state asc

select *
from sales.funnel
limit (10)

select *
from sales.products
order by price desc
limit 10

-- EXERCÍCIOS ######################################################################

-- (Exercício 1) Selecione os nomes de cidade distintas que existem no estado de
-- Minas Gerais em ordem alfabética (dados da tabela sales.customers)

select distinct 
city,state
from sales.customers
where state = 'MG'
order by city 



-- (Exercício 2) Selecione o visit_id das 10 compras mais recentes efetuadas
-- (dados da tabela sales.funnel)

select visit_id,paid_date
from sales.funnel
where paid_date is not null
order by paid_date desc



-- (Exercício 3) Selecione todos os dados dos 10 clientes com maior score nascidos
-- após 01/01/2000 (dados da tabela sales.customers)

select *
from sales.customers
where birth_date >= '2000-01-01'
order by score desc
limit 10

select 
first_name,
email,
birth_date,
(current_date -birth_date)/365 as age
from sales.customers

select 
first_name,
email,
birth_date,
(current_date -birth_date)/365 as age
from sales.customers
order by age asc

select
(first_name|| ' ' ||last_name) as name_complete
from sales.customers

select 
customer_id,
first_name,
professional_status,
(professional_status = 'clt')as se_clt
from sales.customers

select *
from sales.products
where price >= 100000 and price <=200000;

select *
from sales.products
where price between 100000 and 200000
-- mesma abordagem porem usando between

select *
from sales.products
where price < 100000 or price >200000

select *
from sales.products
where  price not between 100000 and  200000

select *
from sales.products
where  brand ='HONDA'OR brand = 'TOYOTA'OR brand ='RENAULT'

select *
from sales.products
where  brand in('HONDA','TOYOTA','RENAULT')

select *
from sales.products
where  brand NOT IN('HONDA','TOYOTA','RENAULT')

select distinct first_name
from sales.customers
where first_name = 'ANA'

select distinct first_name
from sales.customers
where first_name like 'ANA%'

select distinct first_name
from sales.customers
where first_name like '%ANA'

select distinct first_name
from sales.customers
where first_name Ilike 'ana%'

select *
from temp_tables.regions
where population is null

-- (Exercício 1) Calcule quantos salários mínimos ganha cada cliente da tabela 
-- sales.customers. Selecione as colunas de: email, income e a coluna calculada "salários mínimos"
-- Considere o salário mínimo igual à R$1200
select 
email,
income,
floor (income/1200) as qtd_salarios_minimos
from sales.customers


-- (Exercício 2) Na query anterior acrescente uma coluna informando TRUE se o cliente
-- ganha acima de 5 salários mínimos e FALSE se ganha 4 salários ou menos.
-- Chame a nova coluna de "acima de 4 salários"
select 
email,
income,
floor(income/1200) as qtd_salarios_minimos,
(floor(income/1200) > 4) as acima_de_4_salários
from sales.customers


-- (Exercício 3) Na query anterior filtre apenas os clientes que ganham entre
-- 4 e 5 salários mínimos. Utilize o comando BETWEEN

select 
email,
income,
floor(income/1200) as qtd_salarios_minimos
from sales.customers
where floor(income/1200) between 4 and 5

-- (Exercício 4) Selecine o email, cidade e estado dos clientes que moram no estado de 
-- Minas Gerais e Mato Grosso. 

select 
email,
city,
state
from sales.customers
where state = 'MG' OR state = 'MT'

-- (Exercício 5) Selecine o email, cidade e estado dos clientes que não 
-- moram no estado de São Paulo.
select 
email,
city,
state
from sales.customers
where state not in ('SP')


-- (Exercício 6) Selecine os nomes das cidade que começam com a letra Z.
-- Dados da tabela temp_table.regions

select *
from temp_tables.regions
where city ilike 'z%' 
order by population desc

select count(*)
from sales.funnel

select *
from sales.funnel

select count(paid_date)
from sales.funnel

select  count( distinct product_id)
from sales.funnel
where visit_page_date between '2021-01-01' and '2021-01-31'

select 
ROUND(MIN(price), 2) AS preco_minimo, 
ROUND(MAX(price), 2) AS preco_maximo, 
ROUND(AVG(price), 2) AS media_preco
from sales.products

select max(price)
from sales.products

select *
from sales.products
where price =(select max(price)
from sales.products)

select state, count (*) as contagem
from  sales.customers
group by state
order by contagem desc

select state, professional_status, count (*) as contagem
from  sales.customers
group by state ,professional_status
order by state, contagem desc

select distinct state
from sales.customers

select 
state,
count(*) as contagem
from sales.customers
group by state
having count(*)  >=100 -- where filtra apenas colunas não agregadas enquanto having filtra tudo.
order by contagem desc

-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Conte quantos clientes da tabela sales.customers tem menos de 30 anos
select 
count(*)
from sales.customers
where (current_date -birth_date)/365 <30


-- (Exercício 2) Informe a idade do cliente mais velho e mais novo da tabela sales.customers
select 
first_name,
(current_date -birth_date)/365 as age
from sales.customers
order by age desc
limit (1)

select 
first_name,
(current_date -birth_date)/365 as age
from sales.customers
order by age asc
limit (1)

select 
	max((current_date - birth_date) / 365 ),
	min((current_date - birth_date) / 365 )
from sales.customers


-- (Exercício 3) Selecione todas as informações do cliente mais rico da tabela sales.customers
-- (possívelmente a resposta contém mais de um cliente)
select *
from sales.customers
order by income desc
limit 10

select *
from sales.customers
where income = (select max(income) from sales.customers)


-- (Exercício 4) Conte quantos veículos de cada marca tem registrado na tabela sales.products
-- Ordene o resultado pelo nome da marca

select 
brand,
count(*)
from sales.products
group by brand
order by brand



-- (Exercício 5) Conte quantos veículos existem registrados na tabela sales.products
-- por marca e ano do modelo. Ordene pela nome da marca e pelo ano do veículo
select 
brand,model,model_year,
count(*)
from sales.products
group by brand, model , model_year
order by brand, model_year


-- (Exercício 6) Conte quantos veículos de cada marca tem registrado na tabela sales.products
-- e mostre apenas as marcas que contém mais de 10 veículos registrados
select 
brand,
count(*) as contagem
from sales.products
group by brand
having count(*) >10

select tabela01.cpf,tabela01.name,tabela02.state
from temp_tables.tabela_1  tabela01
left join temp_tables.tabela_2  tabela02 
on tabela01.cpf = tabela02.cpf

select tabela01.cpf,tabela01.name,tabela02.state
from temp_tables.tabela_1  tabela01
inner join temp_tables.tabela_2  tabela02 
on tabela01.cpf = tabela02.cpf

select tabela02.cpf,tabela01.name,tabela02.state
from temp_tables.tabela_1  tabela01
right join temp_tables.tabela_2  tabela02 
on tabela01.cpf = tabela02.cpf

select tabela02.cpf,tabela01.name,tabela02.state
from temp_tables.tabela_1  tabela01
full join temp_tables.tabela_2  tabela02 
on tabela01.cpf = tabela02.cpf

select
professional_status,
count(paid_date) as pagamentos
from sales.funnel as fun
left join sales.customers as cus
on fun.customer_id = cus.customer_id
group by professional_status
order by pagamentos desc

select 
ibge.gender,
count(fun.paid_date)
from  sales.funnel as fun	 
left join sales.customers as cus
on   fun.customer_id = cus.customer_id
left join temp_tables.ibge_genders as ibge
on lower( cus.first_name) = ibge.first_name
group by ibge.gender


select *
from temp_tables.ibge_genders

select *
from sales.funnel

select *
from sales.customers

select 
ibge.gender,
count(ibge.gender)
from sales.funnel as fun 
join sales.customers as cus
on fun.customer_id = cus.customer_id
join temp_tables.ibge_genders as ibge
on lower (cus.first_name ) =ibge.first_name
group by ibge.gender

---------------
select 
cus.professional_status,
count(fun.paid_date)
from sales.funnel as fun
join sales.customers as cus
on fun.customer_id= cus.customer_id
group by cus.professional_status
order by count(fun.paid_date) desc

select *
from temp_tables.regions

select 
cus.state,
cus.city,
reg.region,
count(fun.paid_date)
from sales.funnel as fun
join sales.customers as cus
on fun.customer_id= cus.customer_id
join temp_tables.regions as reg
on lower (cus.state)=lower (reg.state)
group by reg.region, cus.state, cus.city
order by count(fun.paid_date) desc

select 
cus.state,
cus.city,
reg.region,
count(fun.visit_page_date)
from sales.funnel as fun
join sales.customers as cus
on fun.customer_id= cus.customer_id
join temp_tables.regions as reg
on lower (cus.state)=lower (reg.state)
group by reg.region, cus.state, cus.city
order by count(fun.visit_page_date) desc

-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Identifique quais as marcas de veículo mais visitada na tabela sales.funnel
select 
pro.brand,
count(fun.visit_page_date) contagem_visit
from sales.funnel as fun
join sales.products as pro
on fun.product_id = pro.product_id
group by pro.brand 
order by contagem_visit desc

select *
from sales.products

-- (Exercício 2) Identifique quais as lojas de veículo mais visitadas na tabela sales.funnel

select 
sto.store_name,
count(fun.visit_page_date) contagem_visit
from sales.funnel as fun
join sales.stores as sto
on fun.store_id = sto.store_id
group by sto.store_name 
order by contagem_visit desc

-- (Exercício 3) Identifique quantos clientes moram em cada tamanho de cidade (o porte da cidade
-- consta na coluna "size" da tabela temp_tables.regions)
select 
reg.size,
count(cus.customer_id) contagem
from sales.customers as cus
join temp_tables.regions as reg
on lower(cus.city )= lower(reg.city)
group by reg.size 
order by contagem desc


select * from sales.products
union all 
select * from temp_tables.products_2

--subquery no where
select *
from sales.products
where price = (select min(price) from sales.products)

-- subquery com with

with alguma_tabela as(
select
professional_status,
(current_date - birth_date)/365 as idade
from sales.customers
)

select professional_status,
avg(idade) as media_idade
from alguma_tabela
group by professional_status

-- subquery com from


select professional_status,
avg(idade) as media_idade
from (
select
professional_status,
(current_date - birth_date)/365 as idade
from sales.customers
) as alguma_tabela
group by professional_status

-- subquery com select
select 
sto.store_name,
fun.visit_page_date,
fun.store_id,
count(fun.store_id) contagem_visitas
from sales.funnel as fun
join sales.stores as sto
on fun.store_id = sto.store_id
group by sto.store_name, fun.visit_page_date, fun.store_id
order by contagem_visitas desc

select *
from sales.funnel

--recorrências de leads(visitas)

with primeira_visita as(
select customer_id, 
min(visit_page_date)as visita_1
from  sales.funnel
group by customer_id
)
select 
fun.visit_page_date,
(fun.visit_page_date<> primeira_visita.visita_1)as lead_recorrente,
count(*)
from sales.funnel as fun
join primeira_visita
on fun.customer_id = primeira_visita.customer_id
group by fun.visit_page_date, lead_recorrente


---analise preço versus o preço médio do veiculo
with preco_medio as (
select brand, avg(price) as preco_medio_da_marca
from sales.products
group by brand

)
select
fun.visit_id,
fun.visit_page_date,
pro.brand,
(pro.price *(1+fun.discount)) as preco_final,
preco_medio.preco_medio_da_marca,
((pro.price *(1+fun.discount))-preco_medio.preco_medio_da_marca) as preco_vs_media
from sales.funnel as fun 
join sales.products as pro
on fun.product_id = pro.product_id
join preco_medio
on pro.brand =preco_medio.brand

-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Crie uma coluna calculada com o número de visitas realizadas por cada
-- cliente da tabela sales.customers
select *
from sales.funnel

select *
from sales.customers

with contagem_visitas as(
select 
customer_id,
count(customer_id) as contagem_visitas_por_cliente
from sales.funnel
group by customer_id

)

select 
cus.*,
contagem_visitas.contagem_visitas_por_cliente
from sales.customers as cus
join contagem_visitas 
on cus.customer_id = contagem_visitas.customer_id


-- convertendo texto em data
-- formato de data ::date

select '2026-01-01'::date -'2025-01-01'::date

-- convertendo texto em numero
-- formato de texto para numero ::numeric

select '100'::numeric -'10'::numeric

-- convertendo numero em texto  
-- formato de numero em texto  ::
--replace coluna, item a modificar, valor pra inserir no lugar da modificação.

select replace(12121212::text,'1','a')

-- convertendo texto em data usando cast
-- formato de data cast date

select cast('2026-01-01'as date) -cast('2025-01-01'as date)

with faixa_renda as (
select
income,
case 
  when income <5000 then '<5mil'
  when income >=5000 and income <10000 then '5mil&10mil'
  when income >=10000 and income <15000 then '10mil&15mil'
  else '15mil+'
  end as condicao_financeira
from sales.customers

)
select
faixa_renda.condicao_financeira,
count (*)
from faixa_renda
group by condicao_financeira




select *,
case
when population is not null then population
else
(select avg (population) from temp_tables.regions  )
end as population_ajustada
from temp_tables.regions 
where population is null

select *,
coalesce (population,(select avg (population) from temp_tables.regions ) )as population_ajustada
from temp_tables.regions 
where population is null

select 'são paulo'= LOWER('SÃO PAULO')
select 'SÃO PAULO' = UPPER ('são paulo')
select TRIM('São    Paulo')='São Paulo'
select REPLACE( 'SAO PAULO','SAO','SÃO')='SÃO PAULO'

--somas de datas com  interval
select current_date +10
select (current_date + interval '1 week')::date
select (current_date + interval '1 month')::date
select (current_date + interval '1 hours')::timestamp

--truncagem de datas com  date_trunc


select visit_page_date, count(*)
from sales.funnel
group by visit_page_date
order by visit_page_date desc

select 
date_trunc('month',visit_page_date)::date as visit_page_month,
count(*)
from sales.funnel
group by visit_page_month
order by visit_page_month desc

--extração de unidades de uma data com  extract
select 
current_date :: date,
extract ('dow'from current_date :: date)

select 
extract ('dow'from visit_page_date :: date ) as dia_da_semana,
count(*) as contagem_visitas_dow
from sales.funnel
group by dia_da_semana
order by contagem_visitas_dow desc

---- diferença de datas usando operador de subtração por dias,semanas,meses e anos
select
(current_date  - ('2025-01-01'::date)) as days

select
(current_date  - ('2025-01-01'::date))/7 as weeks

select
(current_date  - ('2025-01-01'::date))/30 as months

select
(current_date  - ('2025-01-01'::date))/365 as years

--criando funções
--função datediff
create function datediff(unidade varchar,data_inicial date,data_final date)
returns integer
language sql
as 
$$

select 
case 
when unidade in ('d','day','days') then (data_final- data_inicial)
when unidade in ('w','week','weeks') then (data_final- data_inicial)/7
when unidade in ('m','month','months') then (data_final- data_inicial)/30
when unidade in ('y','year','years') then (data_final- data_inicial)/365
end as diferenca
$$

select
datediff('day',('2025-01-01'::date),current_date )

select
datediff('week',('2025-01-01'::date),current_date )

select
datediff('month',('2025-01-01'::date),current_date )

select
datediff('year',('2025-01-01'::date),current_date )


-- para deletar é só digitar drop function datediff