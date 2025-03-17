# Database and UX/UI Design Presentation

## 1. Introduction

This presentation provides an overview of the database structure and UX/UI design for the HOMEGIRL application.

## 2. Database Structure

The database consists of the following tables:

*   **products:** Stores information about products, including product ID, name, description, and price.
*   **users:** Stores information about users, including user ID, full name, email address, location, joined date, and membership status.
*   **salesorders:** Stores information about sales orders, including sales order ID, order date, status, and user ID (foreign key referencing the users table).
*   **invoices:** Stores information about invoices, including invoice ID, sales order ID (foreign key referencing the salesorders table), invoice number, invoice date, and total amount.
*   **salesorder\_items:** Stores information about the items in each sales order, including sales order item ID, sales order ID (foreign key referencing the salesorders table), product ID (foreign key referencing the products table), and quantity.
*   **admins:** Stores information about admins, including admin ID, full name, email address, location, joined date, and permission.
*   **shippings:** Stores information about shippings, including shipping ID, salesorder ID (foreign key referencing the salesorders table), full name, email address, order confirmed date, shipped date, out for delivery date, delivered date, and expected delivery date.
*   **reviews:** Stores information about reviews, including review ID, reviewer name, review date, comment, and rating.

The relationships between the tables are as follows:

*   One-to-many relationship between users and salesorders (one user can have multiple sales orders).
*   One-to-one relationship between salesorders and invoices (one sales order has one invoice).
*   One-to-many relationship between salesorders and salesorder\_items (one sales order can have multiple items).
*   One-to-many relationship between products and salesorder\_items (one product can be in multiple sales order items).
*   One-to-many relationship between salesorders and shippings (one sales order can have one shipping).

## 3. UX/UI Design

The UX/UI design of the HOMEGIRL application is based on a grid layout with a sidebar, header, and main content area. The styling is defined in the `web/styles.css` file.

The application includes the following pages:

*   **Dashboard:** Provides an overview of key metrics, such as total sales, total orders, products, users, weekly total sales, reviews, monthly goal, and shipping status.
*   **Products:** Displays a list of products with their details.
*   **Orders:** Displays a list of orders with their details.
*   **Shippings:** Displays a list of shippings with their details.
*   **Reviews:** Displays a list of reviews with their details.
*   **Users:** Displays a list of users with their details.
*   **Admins:** Displays a list of admins with their details.
*   **Login:** Provides a login form for users to authenticate.

The UX/UI design is responsive and adapts to different screen sizes.

## 4. UX/UI and Database Alignment

The UX/UI design is aligned with the database structure as follows:

*   The data displayed on the dashboard page is retrieved from the database tables.
*   The product information displayed on the products page is retrieved from the products table.
*   The order information displayed on the orders page is retrieved from the salesorders and salesorder\_items tables.
*   The shipping information displayed on the shippings page is retrieved from the shippings table.
*   The review information displayed on the reviews page is retrieved from the reviews table.
*   The user information displayed on the users page is retrieved from the users table.
*   The admin information displayed on the admins page is retrieved from the admins table.

## 5. Conclusion

The database structure and UX/UI design of the HOMEGIRL application are well-integrated and provide a clear and logical user experience.

## 6. Next Steps

*   Gather feedback on the presentation from different project groups.
*   Refine and improve the system's usability and data organization based on the feedback.