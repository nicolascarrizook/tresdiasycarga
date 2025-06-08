#!/bin/bash
set -e

# Instalar dependencias frontend
if [ -d "frontend" ]; then
  echo "Instalando dependencias del frontend..."
  cd frontend && npm install && cd ..
fi

# Instalar dependencias backend
if [ -d "backend" ]; then
  echo "Instalando dependencias del backend..."
  cd backend && npm install && cd ..
fi

# Levantar contenedores
echo "Levantando servicios con Docker Compose..."
docker-compose up -d --build

# Esperar a que los servicios estén arriba
sleep 5

echo "Verificando servicios..."
if curl -s http://localhost:3000 > /dev/null; then
  echo "✅ Frontend OK en http://localhost:3000"
else
  echo "❌ Frontend no responde en http://localhost:3000"
fi
if curl -s http://localhost:3001/health > /dev/null; then
  echo "✅ Backend OK en http://localhost:3001/health"
else
  echo "❌ Backend no responde en http://localhost:3001/health"
fi

echo "Setup completo. ¡Listo para desarrollar!" 