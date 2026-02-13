# Your First Project - Hands-On Tutorial

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Welcome to your first Azure Developer CLI project! This comprehensive hands-on tutorial provides a complete walkthrough of creating, deploying, and managing a full-stack application on Azure using azd. You'll work with a real todo application that includes a React frontend, Node.js API backend, and MongoDB database.

## Learning Goals

By completing this tutorial, you will:
- Master the azd project initialization workflow using templates
- Understand Azure Developer CLI project structure and configuration files
- Execute complete application deployment to Azure with infrastructure provisioning
- Implement application updates and redeployment strategies
- Manage multiple environments for development and staging
- Apply resource cleanup and cost management practices

## Learning Outcomes

Upon completion, you will be able to:
- Initialize and configure azd projects from templates independently
- Navigate and modify azd project structures effectively
- Deploy full-stack applications to Azure using single commands
- Troubleshoot common deployment issues and authentication problems
- Manage multiple Azure environments for different deployment stages
- Implement continuous deployment workflows for application updates

## Getting Started

### Prerequisites Checklist
- ✅ Azure Developer CLI installed ([Przewodnik instalacji](installation.md))
- ✅ Azure CLI installed and authenticated
- ✅ Git installed on your system
- ✅ Node.js 16+ (dla tego samouczka)
- ✅ Visual Studio Code (zalecane)

### Verify Your Setup
```bash
# Sprawdź instalację azd
azd version
```
### Zweryfikuj uwierzytelnienie w Azure

```bash
az account show
```

### Sprawdź wersję Node.js
```bash
node --version
```

## Krok 1: Wybierz i zainicjalizuj szablon

Zacznijmy od popularnego szablonu aplikacji todo, który zawiera frontend React i backend API w Node.js.

```bash
# Przeglądaj dostępne szablony
azd template list

# Zainicjalizuj szablon aplikacji todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Postępuj zgodnie z instrukcjami:
# - Wprowadź nazwę środowiska: "dev"
# - Wybierz subskrypcję (jeśli masz więcej niż jedną)
# - Wybierz region: "East US 2" (lub preferowany region)
```

### Co się właśnie stało?
- Pobrano kod szablonu do lokalnego katalogu
- Utworzono plik `azure.yaml` z definicjami usług
- Skonfigurowano kod infrastruktury w katalogu `infra/`
- Utworzono konfigurację środowiska

## Krok 2: Zbadaj strukturę projektu

Sprawdźmy, co azd dla nas utworzył:

```bash
# Wyświetl strukturę projektu
tree /f   # Windows
# lub
find . -type f | head -20   # macOS/Linux
```

Powinieneś zobaczyć:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Kluczowe pliki do zrozumienia

**azure.yaml** - Serce Twojego projektu azd:
```bash
# Wyświetl konfigurację projektu
cat azure.yaml
```

**infra/main.bicep** - Definicja infrastruktury:
```bash
# Wyświetl kod infrastruktury
head -30 infra/main.bicep
```

## Krok 3: Dostosuj projekt (opcjonalnie)

Zanim wdrożysz, możesz dostosować aplikację:

### Zmodyfikuj frontend
```bash
# Otwórz komponent aplikacji React
code src/web/src/App.tsx
```

Wprowadź prostą zmianę:
```typescript
// Znajdź tytuł i zmień go
<h1>My Awesome Todo App</h1>
```

### Skonfiguruj zmienne środowiskowe
```bash
# Ustaw niestandardowe zmienne środowiskowe
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Wyświetl wszystkie zmienne środowiskowe
azd env get-values
```

## Krok 4: Wdróż do Azure

A teraz ekscytująca część — wdroż wszystko do Azure!

```bash
# Wdróż infrastrukturę i aplikację
azd up

# To polecenie wykona:
# 1. Utworzy zasoby Azure (App Service, Cosmos DB itp.)
# 2. Zbuduje aplikację
# 3. Wdroży do utworzonych zasobów
# 4. Wyświetli adres URL aplikacji
```

### Co dzieje się podczas wdrażania?

Polecenie `azd up` wykonuje następujące kroki:
1. **Provision** (`azd provision`) - Tworzy zasoby Azure
2. **Package** - Buduje kod Twojej aplikacji
3. **Deploy** (`azd deploy`) - Wdraża kod do zasobów Azure

### Oczekiwany wynik
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Krok 5: Przetestuj swoją aplikację

### Uzyskaj dostęp do aplikacji
Kliknij adres URL podany w wyniku wdrożenia lub uzyskaj go w dowolnym momencie:
```bash
# Pobierz punkty końcowe aplikacji
azd show

# Otwórz aplikację w przeglądarce
azd show --output json | jq -r '.services.web.endpoint'
```

### Przetestuj aplikację Todo
1. **Dodaj element todo** - Kliknij "Add Todo" i wpisz zadanie
2. **Oznacz jako ukończone** - Zaznacz ukończone elementy
3. **Usuń elementy** - Usuń zadania todo, których już nie potrzebujesz

### Monitoruj swoją aplikację
```bash
# Otwórz portal Azure dla swoich zasobów
azd monitor

# Wyświetl logi aplikacji
azd monitor --logs

# Wyświetl metryki na żywo
azd monitor --live
```

## Krok 6: Wprowadź zmiany i wdroż ponownie

Wprowadźmy zmianę i zobaczmy, jak łatwo ją zaktualizować:

### Zmodyfikuj API
```bash
# Edytuj kod API
code src/api/src/routes/lists.js
```

Dodaj niestandardowy nagłówek odpowiedzi:
```javascript
// Znajdź obsługę trasy i dodaj:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Wdróż tylko zmiany w kodzie
```bash
# Wdróż tylko kod aplikacji (pomiń infrastrukturę)
azd deploy

# Jest to znacznie szybsze niż 'azd up', ponieważ infrastruktura już istnieje
```

## Krok 7: Zarządzaj wieloma środowiskami

Utwórz środowisko staging, aby przetestować zmiany przed produkcją:

```bash
# Utwórz nowe środowisko stagingowe
azd env new staging

# Wdróż na środowisko stagingowe
azd up

# Przełącz z powrotem na środowisko deweloperskie
azd env select dev

# Wyświetl listę wszystkich środowisk
azd env list
```

### Porównanie środowisk
```bash
# Wyświetl środowisko deweloperskie
azd env select dev
azd show

# Wyświetl środowisko testowe
azd env select staging
azd show
```

## Krok 8: Usuń zasoby

Gdy skończysz eksperymentować, usuń zasoby, aby uniknąć dalszych opłat:

```bash
# Usuń wszystkie zasoby Azure dla bieżącego środowiska
azd down

# Wymuś usunięcie bez potwierdzenia i trwale usuń zasoby objęte miękkim usunięciem
azd down --force --purge

# Usuń określone środowisko
azd env select staging
azd down --force --purge
```

## Czego się nauczyłeś

Gratulacje! Udało Ci się:
- ✅ Zainicjalizować projekt azd z szablonu
- ✅ Zbadać strukturę projektu i kluczowe pliki
- ✅ Wdrożyć aplikację full-stack do Azure
- ✅ Wprowadzić zmiany w kodzie i ponownie je wdrożyć
- ✅ Zarządzać wieloma środowiskami
- ✅ Usunąć zasoby

## 🎯 Ćwiczenia sprawdzające umiejętności

### Ćwiczenie 1: Wdróż inny szablon (15 minut)
**Cel**: Pokaż biegłość w użyciu azd init i procesie wdrażania

```bash
# Wypróbuj stos Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Zweryfikuj wdrożenie
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Posprzątaj
azd down --force --purge
```

**Kryteria sukcesu:**
- [ ] Aplikacja wdraża się bez błędów
- [ ] Można uzyskać dostęp do adresu URL aplikacji w przeglądarce
- [ ] Aplikacja działa prawidłowo (dodawanie/usuwanie zadań)
- [ ] Pomyślnie usunięto wszystkie zasoby

### Ćwiczenie 2: Dostosuj konfigurację (20 minut)
**Cel**: Przećwicz konfigurację zmiennych środowiskowych

```bash
cd my-first-azd-app

# Utwórz niestandardowe środowisko
azd env new custom-config

# Ustaw niestandardowe zmienne
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Zweryfikuj zmienne
azd env get-values | grep APP_TITLE

# Wdróż z niestandardową konfiguracją
azd up
```

**Kryteria sukcesu:**
- [ ] Niestandardowe środowisko utworzone pomyślnie
- [ ] Zmienne środowiskowe ustawione i możliwe do pobrania
- [ ] Aplikacja wdraża się z niestandardową konfiguracją
- [ ] Można zweryfikować niestandardowe ustawienia w wdrożonej aplikacji

### Ćwiczenie 3: Przepływ pracy z wieloma środowiskami (25 minut)
**Cel**: Opanuj zarządzanie środowiskami i strategie wdrażania

```bash
# Utwórz środowisko deweloperskie
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Zanotuj URL środowiska deweloperskiego
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Utwórz środowisko przedprodukcyjne
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Zanotuj URL środowiska przedprodukcyjnego
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Porównaj środowiska
azd env list

# Przetestuj oba środowiska
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Wyczyść oba środowiska
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kryteria sukcesu:**
- [ ] Utworzono dwa środowiska z różnymi konfiguracjami
- [ ] Oba środowiska wdrożone pomyślnie
- [ ] Można przełączać się między środowiskami za pomocą `azd env select`
- [ ] Zmienne środowiskowe różnią się między środowiskami
- [ ] Pomyślnie usunięto oba środowiska

## 📊 Twój postęp

**Zainwestowany czas**: ~60-90 minut  
**Nabyte umiejętności**:
- ✅ Inicjalizacja projektów na podstawie szablonów
- ✅ Provisioning zasobów Azure
- ✅ Workflowy wdrażania aplikacji
- ✅ Zarządzanie środowiskami
- ✅ Zarządzanie konfiguracją
- ✅ Czyszczenie zasobów i kontrola kosztów

**Następny poziom**: Jesteś gotowy na [Przewodnik po konfiguracji](configuration.md), aby poznać zaawansowane wzorce konfiguracyjne!

## Rozwiązywanie typowych problemów

### Błędy uwierzytelniania
```bash
# Ponownie uwierzytelnij się w Azure
az login

# Zweryfikuj dostęp do subskrypcji
az account show
```

### Błędy wdrożenia
```bash
# Włącz logowanie debugowe
export AZD_DEBUG=true
azd up --debug

# Wyświetl logi aplikacji w Azure
azd monitor --logs

# Dla Container Apps użyj Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Konflikty nazw zasobów
```bash
# Użyj unikalnej nazwy środowiska
azd env new dev-$(whoami)-$(date +%s)
```

### Problemy z portami/siecią
```bash
# Sprawdź, czy porty są dostępne
netstat -an | grep :3000
netstat -an | grep :3100
```

## Następne kroki

Po ukończeniu pierwszego projektu zapoznaj się z tymi zaawansowanymi tematami:

### 1. Dostosuj infrastrukturę
- [Infrastruktura jako kod](../chapter-04-infrastructure/provisioning.md)
- [Dodaj bazy danych, magazyn i inne usługi](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Skonfiguruj CI/CD
- [Przewodnik wdrożeń](../chapter-04-infrastructure/deployment-guide.md) - Kompleksowe workflowy CI/CD
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfiguracja pipeline'ów

### 3. Najlepsze praktyki produkcyjne
- [Przewodnik wdrożeń](../chapter-04-infrastructure/deployment-guide.md) - Bezpieczeństwo, wydajność i monitorowanie

### 4. Odkryj więcej szablonów
```bash
# Przeglądaj szablony według kategorii
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Wypróbuj różne stosy technologiczne
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Dodatkowe zasoby

### Materiały szkoleniowe
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Społeczność i wsparcie
- [Azure Developer CLI na GitHubie](https://github.com/Azure/azure-dev)
- [Społeczność Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Szablony i przykłady
- [Oficjalna galeria szablonów](https://azure.github.io/awesome-azd/)
- [Szablony społeczności](https://github.com/Azure-Samples/azd-templates)
- [Wzorce dla przedsiębiorstw](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulacje z ukończenia pierwszego projektu azd!** Teraz jesteś gotowy, by z pewnością budować i wdrażać niesamowite aplikacje w Azure.

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony przy użyciu usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Dokładamy starań, aby tłumaczenie było rzetelne, jednak prosimy pamiętać, że automatyczne przekłady mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym należy traktować jako wersję wiążącą. W przypadku informacji o krytycznym znaczeniu zalecane jest skorzystanie z usług profesjonalnego tłumacza. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->