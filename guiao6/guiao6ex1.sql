
--1.a)
Select * from authors;
---------------------------------

--1.b)
Select au_fname,au_lname, phone from authors;
--------------------------------

--1.c)
Select au_fname,au_lname, phone from authors order by au_fname asc, au_lname asc;
--------------------------------

--1.d)

Select au_fname as first_name,au_lname as last_name,phone as telephone from authors order by au_fname asc, au_lname asc;
-----------------------------
--1.e)

Select au_fname as first_name,au_lname as last_name,phone as telephone from authors where au_lname!='Ringer' AND state='CA' order by au_fname asc, au_lname asc;
-----------------------------
--1.f)
Select * from publishers where pub_name like '%Bo%';
-----------------------------
--1.g)
Select distinct publishers.pub_id, publishers.pub_name from publishers inner join titles on titles.pub_id=publishers.pub_id AND type='business';
---------------------------------
--1.h)
Select pub_name, sum(qty) as sale from sales inner join titles on titles.title_id=sales.title_id  inner join publishers on publishers.pub_id=titles.pub_id group by pub_name;
--------------------------------
--1.i)
Select pub_name, title, sum(qty) as sale from sales inner join titles on titles.title_id=sales.title_id  inner join publishers on publishers.pub_id=titles.pub_id group by pub_name,title;
--------------------------------
--1.j)
Select titles.title from stores inner join sales on stores.stor_id=sales.stor_id and stores.stor_name='Bookbeat' inner join titles on titles.title_id=sales.title_id;
--------------------------------
--1.k)
Select distinct titles.title_id, authors.au_fname from authors inner join titleauthor on authors.au_id=titleauthor.au_id inner join titles on titleauthor.title_id=titles.title_id;
--------------------------------
--1.l)
Select titles.type,titles.pub_id, count(ytd_sales) as salesCount , avg(price) as Avgprice from titles inner join publishers on titles.pub_id=publishers.pub_id group by titles.type,titles.pub_id;
--------------------------------
--1.m)
select titles.type, avg(advance) as AveragePrice from titles group by titles.type having max(advance)>avg(advance)*1.5;

--------------------------------
--1.n)
select authors.au_fname, sum(royaltyper / ytd_sales) as faturation from titles inner join titleauthor on titles.title_id=titleauthor.title_id inner join authors on titleauthor.au_id=authors.au_id group by authors.au_fname;
--------------------------------
--1.o)
select ytd_sales,title,ytd_sales*price as facturacao, ytd_sales*0.01*royalty*price as authors_money,ytd_sales*0.01*(100-royalty)*price as publisher_money from titles order by ytd_sales desc;
--------------------------------
--1.p)
select ytd_sales,title,ytd_sales*price as facturacao, ytd_sales*0.01*royalty*price as authors_money,ytd_sales*0.01*(100-royalty)*price as publisher_money from titles inner join titleauthor on titles.title_id=titleauthor.title_id inner join authors on titleauthor.au_id=authors.au_id order by ytd_sales desc;
--------------------------------
--1.q)
select stor_name, sum(qty) as totalQty from stores inner join sales on stores.stor_id=sales.stor_id inner join  titles on sales.title_id=titles.title_id group by stores.stor_name;
--------------------------------
--1.r)
select stor_name, sum(qty) as totalQty from stores inner join sales on stores.stor_id=sales.stor_id  group by stores.stor_name having sum(qty) > (select avg(qty) as AverageQty from sales);
--------------------------------
--1.s)
Select titles.title from titles where title_id not in( select titles.title_id from titles inner join sales on titles.title_id=sales.title_id inner join stores on sales.stor_id=stores.stor_id where stores.stor_name='Bookbeat') order by titles.title;
--1.t)
-- dont know how !! 



