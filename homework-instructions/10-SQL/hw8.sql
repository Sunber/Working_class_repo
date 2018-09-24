-- homework 8 sql
use sakila;

-- 1a
select actor_id, first_name, last_name
from actor;
-- where first_name = "Groucho";

-- 1b
ALTER TABLE actor ADD COLUMN ActorName VARCHAR(70);
update actor set ActorName = concat(first_name, ' ',last_name); 
Select ActorName
from actor;

-- 2a
select actor_id, first_name, last_name
from actor 
Where first_name = "Joe";

-- 2b
select actor_id, first_name, last_name
from actor
where last_name like "%GEN%"; 

-- 2c
select last_name, first_name
from actor 
where last_name like "%LI%";

-- 2d
select country_id, country
from country where country in ('Afghanistan','Bangladesh','China');

-- 3a
alter table actor add column description Blob;

-- 3b
alter table actor
drop column description;

-- 4a
select last_name, count(*) as count from actor Group By last_name order by count desc; 

-- 4b
select last_name, count(*) as count from actor group by last_name having count > 2;

-- 4c
update actor
set first_name = "Harpo"
where actor_id = 172;
select first_name
from actor
where actor_id = 172;

-- 4d
update actor
set first_name = "Groucho"
where first_name = "Harpo";

-- 5a
show create table address;

-- 6a
select staff.first_name, staff.last_name, address.address
from staff inner join address on staff.address_id=address.address_id;

-- 6b
 select staff.first_name, staff.last_name, sum(payment.amount)
 from staff 
 inner join payment 
 on staff.staff_id=payment.staff_id
 where month(payment.payment_date) = 08 and year(payment.payment_date) = 2005
 group by staff.staff_id;
 
-- 6c
select title, count(actor_id) as numActors
from film inner join film_actor on film.film_id = film_actor.film_id
group by title;

-- 6d
select title, count(inventory_id) as numCopies
from film inner join inventory on film.film_id = inventory.film_id
where title = 'Hunchback Impossible';

-- 6e
select last_name, first_name, sum(amount) as total
from payment inner join customer on payment.customer_id = customer.customer_id
group by payment.customer_id order by last_name asc;

-- 7a
select title from film
where language_id in (select language_id from language where name = 'English')
and (title like "k%") or (title like "Q%");

-- 7b 
select last_name, first_name
from actor where actor_id 
in(select actor_id from film_actor where film_id in (select film_id from film where title = 'Alone Trip'));

-- 7c
select customer.last_name, customer.first_name, customer.email
from customer inner join customer_list on customer.customer_id = customer_list.ID
where customer_list.country = "Canada";

-- 7d
select title 
from film
where film_id in (select film_id from film_category where category_id in (select category_id from category where name = "Family"));

-- 7e
 -- select title.film, count() as 'rent' if not null
-- where film.film_id = inventory.film_id
-- and rental.inventory_id = inventory.inventory_id 
-- group by inventory.film_id;

-- 7f
select store.store_id, sum(amount) as revenue
from store inner join staff on store.store_id = staff.store_id
inner join payment on payment.staff_id = staff.staff_id
group by store.store_id;

-- 7g
select store.store_id, city.city_id, country.country
from store inner join address on store.address_id = address.address_id
inner join city on address.city_id = city.city_id
inner join country on city.country_id = country.country_id;

-- 7h

 
