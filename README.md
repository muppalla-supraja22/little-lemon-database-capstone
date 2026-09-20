# Little Lemon Database Capstone Project

## Project Overview

This project presents a complete database and analytics solution for **Little Lemon**, a restaurant business. It includes a relational MySQL database, an entity relationship model, stored procedures for managing bookings, and an interactive Tableau dashboard for analyzing customer sales and profits.

## Technologies Used

* MySQL
* MySQL Workbench
* SQL
* Tableau Desktop
* Microsoft Excel

## Database Schema

The `LittleLemonDB` database contains the following tables:

* **Customers** – Stores customer information.
* **Staff** – Stores employee details and salaries.
* **MenuItems** – Stores individual menu item information.
* **Menus** – Stores cuisine, menu, and pricing information.
* **Bookings** – Stores customer table reservations.
* **Orders** – Stores order dates, quantities, costs, bookings, and menu details.

Primary and foreign keys establish relationships between the tables and maintain data integrity.

## Stored Procedures

The project includes the following MySQL stored procedures:

* `GetMaxQuantity()` – Returns the maximum quantity ordered.
* `ManageBooking()` – Checks whether a requested booking is available.
* `UpdateBooking()` – Updates the date of an existing booking.
* `AddBooking()` – Adds a new booking to the database.
* `CancelBooking()` – Cancels an existing booking.

## Tableau Analysis

The packaged Tableau workbook contains the following worksheets:

### Customer Sales

* Displays total sales for each customer.
* Includes customers with sales of at least $70.
* Sorts customers by total sales.

### Profit Chart

* Displays the sales trend by year.
* Covers the years 2019–2022.

### Sales Bubble Chart

* Displays customer sales using packed bubbles.
* Shows customer name, sales, and profit in the tooltip.

### Cuisine Sales and Profits

* Compares sales for Greek, Italian, and Turkish cuisines.
* Filters the results to 2020, 2021, and 2022.
* Displays profit values on the bars.

### Interactive Dashboard

The dashboard combines the **Customer Sales** and **Sales Bubble Chart** worksheets. Selecting a customer in the bar chart dynamically filters the bubble chart.

## Project Files

| File                         | Description                                                           |
| ---------------------------- | --------------------------------------------------------------------- |
| `LittleLemonDB.sql`          | Database schema, tables, relationships, and sample data               |
| `LittleLemon_Procedures.sql` | Stored procedures for booking and order operations                    |
| `LittleLemonDB.mwb`          | MySQL Workbench database model and EER diagram                        |
| `LittleLemon_Tableau.twbx`   | Packaged Tableau workbook containing all worksheets and the dashboard |

## How to Use the Project

1. Open MySQL Workbench.
2. Run `LittleLemonDB.sql` to create the database and tables.
3. Run `LittleLemon_Procedures.sql` to create the stored procedures.
4. Open `LittleLemonDB.mwb` to inspect the database model and relationships.
5. Open `LittleLemon_Tableau.twbx` in Tableau Desktop to view the worksheets and interactive dashboard.

## Author

**Supraja Muppalla**
