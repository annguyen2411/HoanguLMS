# HoANGU LMS - Deploy Script for VPS

## Cấu hình trước khi deploy

```bash
# 1. Copy và chỉnh sửa .env
cp .env.example .env
nano .env

# 2. Build và chạy
docker-compose up -d --build
```

## Các lệnh cơ bản

### Development (local)
```bash
# Frontend
npm run dev

# Backend  
cd src/backend && npm start
```

### Production (VPS)
```bash
# Build và chạy tất cả
docker-compose up -d --build

# Build riêng frontend
docker-compose build frontend
docker-compose up -d frontend

# Build riêng backend
docker-compose build backend
docker-compose up -d backend

# Xem logs
docker-compose logs -f
docker-compose logs -f backend

# Restart services
docker-compose restart

# Stop all
docker-compose down
```

## Cấu trúc thư mục trên VPS

```
/var/www/hoangu-lms/
├── .env                    # Environment variables
├── docker-compose.yml       # Docker compose config
├── Dockerfile.frontend    # Frontend Dockerfile
├── Dockerfile.backend    # Backend Dockerfile
├── nginx.conf          # Nginx config
├── dist/             # Built frontend (auto tạo)
└── src/
    ├── app/            # React source
    ├── backend/        # Express API
    └── styles/        # CSS
```

## Setup VPS ban đầu

```bash
# 1. Cài Docker
curl -fsSL https://get.docker.com | sh
systemctl enable docker
systemctl start docker

# 2. Cài Docker Compose
curl -L "https://github.com/docker/compose/releases/download/v2.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# 3. Clone project
cd /var/www
git clone https://github.com/annguyen2411/HoanguLMS.git hoangu-lms
cd hoangu-lms

# 4. Setup .env
cp .env.example .env
nano .env

# 5. Build và chạy
docker-compose up -d --build

# 6. Mở port firewall
ufw allow 80/tcp
ufw allow 443/tcp
ufw allow 3000/tcp
```

## Nginx Reverse Proxy (nếu cần)

Nếu chạy Backend trên port khác hoặc cần HTTPS, cấu hình nginx làm reverse proxy.

## Database Setup

```bash
# PostgreSQL đã được include trong docker-compose
# Hoặc dùng external PostgreSQL:
# UPDATE .env with external DB credentials
```