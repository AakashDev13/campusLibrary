# Campus Library — CS543 GraphQL Assignment

This project follows the CS543_T07 tutorial: HTML/CSS frontend → GraphQL API (Node.js/Apollo) → MySQL.

## Files
- `schema.sql`: creates `gqldemo`, `authors`, `books`, and sample data.
- `db.js`: MySQL connection pool. Replace `YOUR_MYSQL_PASSWORD`.
- `server.js`: GraphQL schema, queries, mutations, and resolvers.
- `public/index.html`: frontend, GraphQL query, and add-book mutation.
- `public/style.css`: frontend styling.

## Setup (Windows / VS Code)

### Prerequisites
- Node.js and npm
- MySQL Server
- MySQL Workbench (recommended)
- Visual Studio Code with Live Server extension

### 1. Open the project
Open the `campus-library` folder in VS Code.

### 2. Set up the database
Open MySQL Workbench and execute the complete `schema.sql` file.

This creates the `gqldemo` database, the `authors` and `books` tables, and the sample data.

### 3. Configure the database connection
Open `db.js` and configure the MySQL connection using your local database credentials.

Do not commit real database passwords or other secrets to GitHub.

### 4. Install dependencies
Open the VS Code terminal in the project folder and run:

```bash
npm install
```

If dependencies have not been installed and are not listed in `package.json`, install the required packages:

```bash
npm install @apollo/server graphql mysql2
```

### 5. Start the GraphQL server
Run:

```bash
node server.js
```

Keep the terminal open. The server should display its GraphQL endpoint, typically:

`http://localhost:4000/`

### 6. Test the GraphQL API
Open the GraphQL endpoint in your browser and execute:

```graphql
query {
  authors {
    name
    country
    books {
      title
      year
    }
  }
}
```

This query requests each author's name, country, and associated books.

### 7. Start the frontend
In VS Code, right-click `public/index.html` and select **Open with Live Server**.

### 8. Test the application
Use the form on the Campus Library webpage to add a book.

Verify that the new book appears under the selected author and that the record is saved in MySQL.

## Troubleshooting
- Start MySQL before starting the GraphQL server.
- Keep the backend terminal running while using the frontend.
- Check the MySQL host, port, username, password, and database name if the connection fails.
- If MySQL uses a non-default port, configure the actual port in `db.js`.

## Important
- Start MySQL before running `node server.js`.
- Keep the backend terminal running while using the webpage.
- If your MySQL uses a different port, add `port: 3306` (or your actual port) to the pool config in `db.js`.
- Do not upload your real database password to GitHub.
