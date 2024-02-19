## using the sakila database

use sakila;

## 1. Select all the actors with the first name ‘Scarlett’.
select * from actor;
select * from actor where first_name = "SCARLETT";

## 2. Select all the actors with the last name ‘Johansson’.
select * from actor where last_name = "JOHANSSON";

## 3. How many films (movies) are available for rent?
select * from rental;
select count(*) from rental; ## There are 16044 movies for rent

## 4. How many films have been rented?
select * from film;
select * from film where rental_duration  > 0;

## 5. What is the shortest and longest rental period?
select * from film;
select min(rental_duration) as shorter_period from film;
select max(rental_duration) as longer_period from film;

## 6.What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select * from film;
select min(length) as max_duration from film;
select max(length) as min_duration from film;

## 7. What's the average movie duration?
select round(avg(length), 2) as average_duration from film;

## 8- What's the average movie duration expressed in format (hours, minutes)?
select cast(length as time) as hours,length from film;
select round(avg(concat(floor(length / 60), ' Hour ', length % 60, ' Minutes')),2 ) as AverageMovieDuration  from film;

## 9.How many movies longer than 3 hours?
select count(*) as movies_longer_than_3_hours
from (
    select concat(floor(length / 60), ' hour ', length % 60, ' minutes') as movie_duration 
    from film
    where length > 180
) as movies_longer_than_3_hours;

## 10. Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
select * from customer;
select *,
	lower(first_name) as first_name_lower,
	lower(last_name) as last_name_lower,
    lower(email) as email_lower
from customer;

## 11. What's the length of the longest film title?
select max(length) as max_length from film; ## one option
select max(concat(floor(length / 60), ' hours ', length % 60, ' minutes')) as max_length from film; ## other option in hours and minutes




