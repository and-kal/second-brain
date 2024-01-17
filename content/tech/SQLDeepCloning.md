---
title: "SQL: Deep Cloning"
date: "2023-12-20"
draft: true
---

Let's say you have an SQL table called `MyItems` with the following columns: `ID` (Primary Key) and `Item`, and another table `MyItemsDetails` with `ID` (PK), `RefID` (Foreign Key) and `Details`, where `RefID` refers to the former table's `ID`. Now you want to copy all entries from the first table to another existing table like `YourItems` and append them and also copy over the items from `MyItemsDetails` to `YourItemsDetails`. If `YourItems` and `YourItemsDetails` were empty, you could of course just do the following:

```sql
INSERT INTO YourItems
SELECT * FROM MyItems;
INSERT INTO YourItemsDetails
SELECT * FROM MyItemsDetails;
```

The problem here is that the `ID` columns containing the tables' primary keys probably won't allow ›identity insert‹. Thus, you might do the following instead:

```sql
INSERT INTO YourItems
SELECT [Item] FROM MyItems;
INSERT INTO YourItemsDetails
SELECT [RefID], [Details] FROM MyItemsDetails;
```

This would do the trick; however, it will only work if your target tables are empty and start indexing at 1 and if your source tables have no gaps. If somewhere along the way you deleted an entry in `MyItems` and your rows look like this:

```
ID
--
1
2
3
4
6
```

...you will run into a problem, because when not being able to do identity insert the `ID`s and running the command above, the `ID`s in `YourItems` will look like this:

```
ID
--
1
2
3
4
5
```

...which is not good, because you are effectively breaking your foreign key relations from the `YourItemsDetails`' `RefID` column to the `YourItems`' `ID` column. The same problem would arise, if `YourItems` was not empty when you ran your `INSERT` command, because `YourItems`' `ID`s will auto-increment starting at the current index. The references from `RefID`s will again be broken.

What we need is a command that takes into account the current index of your `YourItems` table and set the `RefID` in `YourItems` accordingly. That's not quite straightforward

```sql
DECLARE @YourCurrentIndex INT;
SET @YourCurrentIndex = SELECT IDENT_CURRENT ([YourItems]);
GO;

CREATE TABLE #TemporaryTable (
    ID INT,
    Title NVARCHAR(255),
    Detail NVARCHAR(255)
);
GO;

INSERT INTO #TemporaryTable
SELECT * FROM MyItems
LEFT JOIN MyItemsDetails
ON MyItems.ID = MyItemsDetails.RefID;
GO;

UPDATE #TemporaryTable SET ID = ID + @YourCurrentIndex;

INSERT INTO YourItems ([Title])
SELECT [Title] FROM #TemporaryTable;
GO;

INSERT INTO YourItemsDetails ([RefID], [Detail])
SELECT [ID], [Detail] FROM #TemporaryTable;
```

[...]

<!-- TODO -->
