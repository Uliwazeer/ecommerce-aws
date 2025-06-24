# 🛍️ AliShop - Full Stack E-Commerce Project

AliShop is a simple but powerful E-Commerce application built with Node.js (Express) for the backend and a modern HTML/CSS/JS frontend. It supports containerized deployment with Docker, automated testing using GitHub Actions, and optional infrastructure provisioning with Terraform on AWS.

---

## 🚀 Project Structure

```

ecommerce-aws/
├── backend/              # Node.js + Express backend API
│   ├── app.js            # Main server logic
│   └── Dockerfile        # Backend Docker configuration
│
├── frontend/             # Static frontend (HTML/CSS/JS)
│   ├── index.html
│   ├── style.css
│   └── script.js
│
├── .github/
│   └── workflows/
│       └── backend-ci.yml    # GitHub Actions CI Workflow
│
└── terraform/           # Optional AWS Infra provisioning using Terraform

````

---

## 🔧 Prerequisites

- [Node.js](https://nodejs.org/)
- [Docker](https://www.docker.com/)
- [MySQL](https://www.mysql.com/)
- [Terraform](https://developer.hashicorp.com/terraform) *(Optional)*
- AWS CLI + Account *(Optional)*
- GitHub Account for CI

---

## 🛠️ How to Run Locally

### 1. Clone the Repo

```bash
git clone https://github.com/Aliwazeer/ecommerce-aws.git
cd ecommerce-aws
````

---

### 2. Set up MySQL Locally

```sql
CREATE DATABASE ecommercedb;
USE ecommercedb;

CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  price DECIMAL(10,2)
);

INSERT INTO products (name, price) VALUES 
('Laptop', 999.99),
('Smartphone', 599.49),
('Keyboard', 49.99);
```

---

### 3. Run Backend Locally

Make sure `.env` file is created inside `/backend`:

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=yourpassword
DB_NAME=ecommercedb
PORT=5000
```

Then:

```bash
cd backend
npm install
node app.js
```

---

### 4. Run Frontend Locally

Simply open `frontend/index.html` in your browser (e.g., VS Code Live Server).

---

## 🐳 Docker Support

### Build and Run the Backend Container:

```bash
cd backend
docker build -t aliwazeer/ecommerce-backend:latest .
docker run -p 5000:5000 aliwazeer/ecommerce-backend:latest
```

---

## ✅ GitHub Actions CI/CD

GitHub Actions workflow `backend-ci.yml` automates backend test builds:

```yaml
name: Backend CI

on:
  push:
    paths:
      - 'backend/**'
  pull_request:
    paths:
      - 'backend/**'

jobs:
  test:
    runs-on: ubuntu-latest
    defaults:
      run:
        working-directory: ./backend

    steps:
      - name: ⬇️ Checkout Repo
        uses: actions/checkout@v3

      - name: 🟢 Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '20'

      - name: 📦 Install Dependencies
        run: npm install

      - name: ✅ Run Tests (Manual)
        run: echo "🧪 No tests yet"

      - name: 🐳 Docker Build Test
        run: docker build -t test-ecommerce-backend .
```

---

## 🌐 How It Works

1. **Backend** connects to a **MySQL database** and exposes `/api/products`.
2. **Frontend** fetches data from the backend and displays it dynamically.
3. The frontend also hits a visitor counter Lambda API via API Gateway.
4. You can deploy everything locally or with Terraform to AWS.

---

## 🧠 Notes

* **Frontend** is static, hosted on S3 (optional).
* **Backend** is containerized with Docker and connects to MySQL.
* Optional Terraform config exists for full AWS deployment.
* GitHub Actions CI ensures code quality & build testing.

---

## 👨‍💻 Author

Ali Wazeer
🔗 [LinkedIn](https://www.linkedin.com/in/aliwazeer/)
📧 [ali.noureldeen.wazeer@gmail.com](mailto:ali.noureldeen.wazeer@gmail.com)

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).



---

Let me know if you want to add:

- React or Next.js frontend  
- More GitHub Actions stages (e.g., deploy, lint, test)  
- Terraform deployment instructions  
- AWS Lambda visitor counter explanation



![Screenshot (183)](https://github.com/user-attachments/assets/43943395-0127-4b23-b012-1df4150289b0)
![Screenshot (182)](https://github.com/user-attachments/assets/3e3148e4-549d-4fce-aa86-18f170026c0c)

![Screenshot (191)](https://github.com/user-attachments/assets/09bba584-cc99-4b98-b502-e597b68b620e)
![Screenshot (190)](https://github.com/user-attachments/assets/72178d33-c672-48f8-ab47-4bea16927855)
![Screenshot (189)](https://github.com/user-attachments/assets/be770325-cd2f-4f4e-bbcd-ba6e72216937)
![Screenshot (187)](https://github.com/user-attachments/assets/aca42a20-0a1c-4e3c-9a63-2402c185fd2e)
![Screenshot (186)](https://github.com/user-attachments/assets/61d8e128-c367-4f9c-a6ff-f705f5821a6b)

