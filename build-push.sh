# Frontend
docker build -t timursamanchi/nginx-quote-frontend ./frontend
docker push timursamanchi/nginx-quote-frontend

# Backend
docker build -t timursamanchi/nginx-quote-backend ./backend
docker push timursamanchi/nginx-quote-backend
