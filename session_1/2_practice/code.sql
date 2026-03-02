-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 library.db
-- 2. Load this script: .read code.sql
-- 3. Exit SQLite: .exit


-- write your sql code here
select books.title, members.name, loans.loan_date from loans join books on books.id = loans.book_id join members on members.id = loans.member_id;
select books.title, loans.loan_date, loans.return_date from books left join loans on books.id = loans.book_id;
select librarybranch.name, books.title from librarybranch left join books on books.branch_id = librarybranch.id;
select librarybranch.name, COUNT(books.id) from librarybranch left join books on books.branch_id = librarybranch.id group by librarybranch.id, librarybranch.name;
select librarybranch.name, COUNT(books.id) from librarybranch left join books on librarybranch.id = books.branch_id group by librarybranch.id, librarybranch.name having COUNT(books.id) > 7;
select members.name, COUNT(loans.id) from members left join loans on members.id = loans.member_id group by members.name, members.id;
select members.name, loans.member_id from members left join loans on members.id = loans.member_id group by members.id, members.name having COUNT(loans.id) = 0;
select librarybranch.name, COUNT(loans.id) from librarybranch left join books on librarybranch.id = books.branch_id left join loans on loans.book_id = books.id group by librarybranch.name, librarybranch.id;
