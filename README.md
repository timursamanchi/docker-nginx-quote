# 🌐 nginx-quote

A demo project that showcases inter-container communication using Docker Compose and Kubernetes. It consists of:

- A **frontend** served by NGINX that dynamically fetches and displays a quote
- A **backend** powered by a quote-generating service (`datawire/quote:0.5.0`)

Ideal for learning Docker networking, reverse proxying, and container orchestration with Kubernetes (k0s).

---

## 📁 Project Structure

```
nginx-quote/
├── backend
│   └── Dockerfile         # Builds the quote backend image
├── docker-compose.yml     # Runs both services together
└── frontend
    ├── Dockerfile         # Builds the NGINX frontend image
    ├── default.conf       # NGINX config with reverse proxy to backend
    └── index.html         # Frontend UI with JavaScript fetch to backend
```

---

## 🚀 Getting Started (Docker Compose)

### 1. Build & Run
```bash
docker compose up --build
```

### 2. Open in Browser
Visit: [http://localhost:8080](http://localhost:8080)

You should see:
- A static welcome message
- A dynamically loaded **quote of the day** from the backend

---

## 🔧 How It Works

### Frontend (`nginx`)
- Serves static `index.html`
- Proxies `/quote` requests to the backend via Docker network
- Uses JavaScript to fetch and inject quotes into the HTML

### Backend (`datawire/quote`)
- Returns a random quote as JSON at `GET /`
- Lightweight and stateless

---

## 🐳 Docker Hub Images

You can also pull and run the images directly:

- **Frontend**: [`timursamanchi/nginx-quote-frontend`](https://hub.docker.com/r/timursamanchi/nginx-quote-frontend)
- **Backend**: [`timursamanchi/nginx-quote-backend`](https://hub.docker.com/r/timursamanchi/nginx-quote-backend)

```bash
docker run -p 8080:80 timursamanchi/nginx-quote-frontend
docker run -p 8081:8080 timursamanchi/nginx-quote-backend
```

---

## ☸️ Deploying to Kubernetes (k0s Ready)

This project is also Kubernetes-compatible. See the `k8s/` folder for:

- `backend-deployment.yaml`
- `frontend-deployment.yaml`
- `ingress.yaml` (optional)

To deploy:
```bash
kubectl apply -f k8s/
```

Access via:
- NodePort: `http://<node-ip>:30080`
- Ingress: `http://quote.local` (with `/etc/hosts` entry)

---

## 📦 Built With

- [Docker Compose](https://docs.docker.com/compose/)
- [NGINX](https://www.nginx.com/)
- [datawire/quote](https://hub.docker.com/r/datawire/quote)
- [k0s](https://k0sproject.io/)

---

## 🧠 Next Steps

- Add TLS support with Let's Encrypt
- Package as a Helm chart
- Setup CI/CD with GitHub Actions
- Deploy on cloud (e.g., EKS, GKE, k3s)

---

## 🤝 Contributing

Feel free to fork, raise issues, or contribute improvements via pull requests!

---

## 📄 License

This project is for educational and demo purposes.
