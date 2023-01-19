# Student Housing
> *OracleSQL Database  project*

## :inbox_tray: *The purpose of the project*
####  This CRUD project aims to a better management of data from a student private housing.

- The database was created using DataGrip
- The user interface was created using ASP.NET Web Application



### :computer: *This app can perform the following tasks :*

- create a new record
- modify a record
- delete a record
- sort records by a field
- search a record using a filter ( only for rooms )
- select a record ( this task helps the user to enter the data correctly )

## :man_technologist: *User-interface presentation*
> For a detailed presentation, check the documentation from this repository.

**The "MainPage" of this project contains a list of all tables. After selecting the desired table, the associated records will be displayed.**

![image](https://user-images.githubusercontent.com/92024989/213469473-7ab7c454-4476-4a4a-86cb-39ee579d14e9.png)
![image](https://user-images.githubusercontent.com/92024989/213536599-8afbf2e3-16fe-4b45-abee-bce6207ca559.png)

### *1. Sorting the records*

**The user can sort the records, just by clicking on the column's name he want the records to be sorted by**

![image](https://user-images.githubusercontent.com/92024989/213536483-80eb3656-ab47-4eca-a104-1af8eaf2d2b6.png)

**After sorting, the user will be notified about the sorting direction and expression of the records.**

![image](https://user-images.githubusercontent.com/92024989/213491944-52fd71e5-2510-4c23-8102-7bcdbe8f1ae0.png)


### *2. Changing a record*

**The `Edit` button makes the selected record's fields editable. Some of them are locked and non-editable. The `Update` button allows user to set the changes into database.**

![image](https://user-images.githubusercontent.com/92024989/213536832-dc47ddbd-caf2-43c2-a473-becf899dfb09.png)

### *3. Deleting a record*

**The `Delete` button allows user to delete the selected record. In case the record is an important one ( is calling ON DELETE CASCADE constraint ), the user is informed of the changes that are taking place.**  

![image](https://user-images.githubusercontent.com/92024989/213537106-68aec29e-a9cd-4409-85a3-4a8261a575bb.png)

### *4. Creating a record*

**The user can also create a new record . He has to press the button above the table that appears when the desired table is selected.**

![image](https://user-images.githubusercontent.com/92024989/213527497-085ff6c6-80ad-45c1-a673-6f44edae5b8f.png)

**The user is now redirected to the registration page. This page differs depending on the table.**

![image](https://user-images.githubusercontent.com/92024989/213529621-02673545-9d93-4a63-971b-ea3f8e0daf65.png)

### *5. Filtering a record*

Even if this functionality is just for rooms , this is very useful if you want to group rooms by a filter.

![image](https://user-images.githubusercontent.com/92024989/213537404-231e1736-def2-4b02-814a-57182205006a.png)

