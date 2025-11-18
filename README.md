# 📱 Mini Panel de Clientes

Aplicación Flutter desarrollada como prueba técnica que implementa un panel de administración de clientes con autenticación, consumo de API REST y navegación fluida.

## 📋 Descripción

Mini Panel de Clientes es una aplicación móvil que permite visualizar y gestionar información de clientes obtenida desde una API pública. La aplicación cuenta con un sistema de autenticación local, lista de clientes con información resumida y vista detallada de cada cliente.

## ✨ Características

- 🔐 **Autenticación Local**: Sistema de login con validación de email y contraseña
- 📊 **Lista de Clientes**: Visualización de clientes con nombre, email y empresa
- 👤 **Detalle de Cliente**: Información completa incluyendo teléfono, dirección y sitio web
- 🔄 **Pull to Refresh**: Actualización de datos deslizando hacia abajo
- ⚡ **Indicadores de Carga**: Feedback visual durante las peticiones HTTP
- ❌ **Manejo de Errores**: Mensajes claros y opción de reintentar
- 📋 **Copiar al Portapapeles**: Funcionalidad para copiar información de contacto
- 🎨 **Material Design 3**: Interfaz moderna y responsiva

## 🏗️ Enfoque de Desarrollo

### Arquitectura

El proyecto utiliza una arquitectura limpia separando las responsabilidades en capas:

```
lib/
├── models/          # Modelos de datos (User, Address, Company)
├── services/        # Lógica de negocio y consumo de API
├── providers/       # Manejo de estado con Provider
├── screens/         # Pantallas de la aplicación
├── widgets/         # Componentes reutilizables
└── main.dart        # Punto de entrada
```

### Tecnologías y Patrones

- **Manejo de Estado**: Provider para gestión reactiva del estado
- **Consumo de API**: Paquete HTTP con manejo de timeouts y errores
- **Arquitectura**: Separación de responsabilidades (Models, Services, Providers, UI)
- **Diseño**: Material Design 3 con tema personalizado
- **Navegación**: Navigator de Flutter para transiciones entre pantallas

### Decisiones Técnicas

1. **Provider vs Bloc/Riverpod**: Se eligió Provider por su simplicidad y curva de aprendizaje suave
2. **HTTP vs Dio**: Se utilizó el paquete HTTP nativo por ser suficiente para este caso de uso
3. **Validación Local**: Implementada en el cliente para simular autenticación sin backend
4. **Error Handling**: Manejo robusto con try-catch, timeouts y mensajes al usuario
5. **UI/UX**: Enfoque en feedback visual (loaders, mensajes, animaciones)

## 🚀 Requisitos Previos

- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Android Studio / VS Code
- Dispositivo físico o emulador Android/iOS

## 📦 Instalación

### 1. Clonar el repositorio

```bash
git clone https://github.com/tu-usuario/mini_panel_clientes.git
cd mini_panel_clientes
```

### 2. Instalar dependencias

```bash
flutter pub get
```

### 3. Verificar instalación

```bash
flutter doctor
```

## ▶️ Ejecución

### Ejecutar en modo debug

```bash
flutter run
```

### Ejecutar en dispositivo específico

```bash
# Listar dispositivos disponibles
flutter devices

# Ejecutar en dispositivo específico
flutter run -d <device_id>
```

### Ejecutar en Chrome (Web)

```bash
flutter run -d chrome
```

### Compilar para producción

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release
```

## 🔑 Credenciales de Prueba

Para acceder a la aplicación, utiliza las siguientes credenciales:

- **Email**: `admin@test.com`
- **Contraseña**: `123456`

## 🌐 API Utilizada

La aplicación consume datos de la API pública:

```
https://jsonplaceholder.typicode.com/users
```

Esta API REST retorna información de 10 usuarios de prueba con datos completos.

## 📁 Estructura del Proyecto

```
mini_panel_clientes/
│
├── lib/
│   ├── main.dart                    # Punto de entrada de la app
│   │
│   ├── models/
│   │   └── user_model.dart          # Modelos: User, Address, Company, Geo
│   │
│   ├── services/
│   │   └── api_service.dart         # Servicio HTTP para consumo de API
│   │
│   ├── providers/
│   │   └── user_provider.dart       # Provider para manejo de estado
│   │
│   ├── screens/
│   │   ├── login_screen.dart        # Pantalla de autenticación
│   │   ├── home_screen.dart         # Pantalla principal con lista
│   │   └── user_detail_screen.dart  # Pantalla de detalle del usuario
│   │
│   └── widgets/
│       └── user_card.dart           # Componente de tarjeta de usuario
│
├── pubspec.yaml                     # Dependencias del proyecto
└── README.md                        # Este archivo
```

## 📦 Dependencias Principales

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0        # Consumo de API REST
  provider: ^6.1.1    # Manejo de estado
```
## 📱 Capturas de Pantalla y video

### Pantalla de Login
- Validación de email y contraseña
- Credenciales de prueba visibles
<img width="403" height="740" alt="image" src="https://github.com/user-attachments/assets/3bc63cb9-a279-4f03-b065-35fc1a2c0133" />

### Pantalla Principal
- Lista de clientes con avatar, nombre, email y empresa
- Pull to refresh
- Indicador de carga
<img width="413" height="747" alt="image" src="https://github.com/user-attachments/assets/02b9a271-15ae-4209-9055-f2bae14a91b7" />

### Pantalla de Detalle
- Información completa del cliente
- Dirección detallada
- Información de la empresa
- Funcionalidad de copiar al portapapeles
<img width="426" height="757" alt="image" src="https://github.com/user-attachments/assets/5f045984-ccf6-4515-874d-bc52081141c5" />
<img width="421" height="751" alt="image" src="https://github.com/user-attachments/assets/9548fb54-75a8-48dd-8234-8eb84bcbc71f" />

### Video de Funcionamiento
![Funcionalidad](https://github.com/user-attachments/assets/ad55a998-8a4b-4462-8974-698616145b81)
