This is a [Next.js](https://nextjs.org) project bootstrapped with [`create-next-app`](https://nextjs.org/docs/app/api-reference/cli/create-next-app).

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
# or
bun dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `app/page.tsx`. The page auto-updates as you edit the file.

This project uses [`next/font`](https://nextjs.org/docs/app/building-your-application/optimizing/fonts) to automatically optimize and load [Geist](https://vercel.com/font), a new font family for Vercel.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/app/building-your-application/deploying) for more details.

# NutriApp - Entorno de Desarrollo Local

## Levantar el entorno completo

1. **Usa el script automático de setup**
   - **Windows (PowerShell):**
     ```powershell
     ./setup-dev.ps1
     ```
   - **Linux/Mac (bash):**
     ```sh
     bash setup-dev.sh
     ```

   Esto instalará dependencias, levantará los servicios y verificará que todo esté funcionando.

2. **(Alternativa manual)**
   - Construir imágenes:
     ```sh
     docker-compose build
     ```
   - Levantar servicios:
     ```sh
     docker-compose up -d
     ```

3. **Ver el estado de los contenedores:**
   ```sh
   docker-compose ps
   ```

4. **Ver logs en tiempo real:**
   ```sh
   docker-compose logs -f
   ```

## Servicios disponibles

- **Frontend (Next.js):** [http://localhost:3000](http://localhost:3000)
- **Backend (Node.js):** [http://localhost:3001/health](http://localhost:3001/health)
- **PostgreSQL:** localhost:5432 (usuario: postgres, password: postgres, db: nutriapp)
- **Redis:** localhost:6379

## Hot-reload

- Cualquier cambio en el código fuente de `frontend/` o `backend/` se reflejará automáticamente en los contenedores.
- Si agregas nuevas dependencias, reconstruye la imagen correspondiente:
  ```sh
  docker-compose build frontend
  # o
  docker-compose build backend
  ```

## Conexión a la base de datos y Redis desde tu máquina

- Puedes usar herramientas como DBeaver, TablePlus o psql para conectarte a PostgreSQL:
  - **Host:** localhost
  - **Puerto:** 5432
  - **Usuario:** postgres
  - **Contraseña:** postgres
  - **Base de datos:** nutriapp

- Para Redis, puedes usar RedisInsight, TablePlus o la CLI de redis:
  - **Host:** localhost
  - **Puerto:** 6379

## Apagar todos los servicios

```sh
docker-compose down
```

---

¿Dudas? Consulta este README o pregunta al equipo.
