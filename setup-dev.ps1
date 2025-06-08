#requires -Version 5.0
$ErrorActionPreference = 'Stop'

# Instalar dependencias frontend
if (Test-Path './frontend/package.json') {
  Write-Host 'Instalando dependencias del frontend...'
  Push-Location frontend
  npm install
  Pop-Location
}

# Instalar dependencias backend
if (Test-Path './backend/package.json') {
  Write-Host 'Instalando dependencias del backend...'
  Push-Location backend
  npm install
  Pop-Location
}

# Levantar contenedores
Write-Host 'Levantando servicios con Docker Compose...'
docker-compose up -d --build

Start-Sleep -Seconds 5

Write-Host 'Verificando servicios...'
try {
  Invoke-WebRequest http://localhost:3000 -UseBasicParsing | Out-Null
  Write-Host '✅ Frontend OK en http://localhost:3000'
} catch {
  Write-Host '❌ Frontend no responde en http://localhost:3000'
}
try {
  Invoke-WebRequest http://localhost:3001/health -UseBasicParsing | Out-Null
  Write-Host '✅ Backend OK en http://localhost:3001/health'
} catch {
  Write-Host '❌ Backend no responde en http://localhost:3001/health'
}

Write-Host 'Setup completo. ¡Listo para desarrollar!' 