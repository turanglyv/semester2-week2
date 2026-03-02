# Library SQL Exercises

## Datetime in SQL

Some of these tasks use datetimes - you can convert a date into the right format using:
```sql
DATE('20-01-2026') /* convert a specific date to a datetime */
DATE('now') /* convert the current time to a datetime */
DATE('now', '-14 days') /* you can add or subtract days */
```


1. **List all loans**  
Show book title, member name, and loan date.
select books.title, members.name, loans.loan_date from loans join books on books.id = loans.book_id join members on members.id = loans.member_id;
2. **Books and loans**  
List all books and any loans associated with them.
select books.title, loans.loan_date, loans.return_date from books left join loans on books.id = loans.book_id;
3. **Branches and books**  
List all library branches and the books they hold.
select librarybranch.name, books.name from librarybranch left join books on books.branch_id = librarybranch.id;
4. **Branch book counts**  
Show each library branch and the number of books it holds.
select librarybranch.name, COUNT(books.id) from librarybranch left join books on books.branch_id = librarybranch.id group by librarybranch.id, librarybranch.name;
5. **Branches with more than 7 books**  
Show branches that hold more than 7 books.
select librarybranch.name, COUNT(books.id) from librarybranch left join books on librarybranch.id = books.branch_id group by librarybranchname having COUNT(books.id) > 7;
6. **Members and loans**  
List all members and the number of loans they have made.
select members.name, COUNT(loans.id) from members left join loans on members.id = loans.member_id group by members.name, members.id;
7. **Members who never borrowed**  
Identify members who have never borrowed a book.
select members.name, loans.member_id from members left join loans on members.id = loans.member_id group by members.id, members.name having COUNT(loans.id) = 0;
8. **Branch loan totals**  
For each library branch, show the total number of loans for books in that branch.
select librarybranch.name, COUNT(loans.id) from librarybranch left join books on librarybranch.id = books.branch_id left join loans on loans.book_id = books.id group by librarybranch.name, librarybranch.id;
9. **Members with active loans**  
List members who currently have at least one active loan.

10. **Books and loans report**  
Show all books and all loans, including books that were never loaned. Include a column classifying each row as “Loaned book” or “Unloaned book.”. You will need to look up how to do this (hint: a case statement would work).
