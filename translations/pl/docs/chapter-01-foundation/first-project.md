# Twój Pierwszy Projekt - Praktyczny Samouczek

**Nawigacja po Rozdziale:**
- **📚 Strona Kursu**: [AZD dla Początkujących](../../README.md)
- **📖 Aktualny Rozdział**: Rozdział 1 - Podstawy i Szybki Start
- **⬅️ Poprzedni**: [Instalacja i Konfiguracja](installation.md)
- **➡️ Następny**: [Konfiguracja](configuration.md)
- **🚀 Następny Rozdział**: [Rozdział 2: Rozwój z AI na Pierwszym Planie](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Wprowadzenie

Witamy w Twoim pierwszym projekcie Azure Developer CLI! Ten kompleksowy, praktyczny samouczek przeprowadzi Cię krok po kroku przez proces tworzenia, wdrażania i zarządzania aplikacją full-stack na platformie Azure z użyciem azd. Będziesz pracować na rzeczywistej aplikacji todo, która zawiera frontend React, backend API w Node.js oraz bazę danych MongoDB.

## Cele Nauki

Po ukończeniu tego samouczka będziesz:
- Mistrzem w inicjalizacji projektów azd za pomocą szablonów
- Rozumieć strukturę projektu Azure Developer CLI i pliki konfiguracyjne
- Umieć wykonać pełne wdrożenie aplikacji na Azure wraz z przygotowaniem infrastruktury
- Potrafić wdrażać aktualizacje aplikacji i strategie ponownego wdrażania
- Zarządzać wieloma środowiskami dla rozwoju i testowania
- Znać praktyki sprzątania zasobów i zarządzania kosztami

## Osiągnięcia

Po ukończeniu będziesz potrafił:
- Samodzielnie inicjalizować i konfigurować projekty azd ze szablonów
- Sprawnie poruszać się i modyfikować strukturę projektu azd
- Wdrażać aplikacje full-stack do Azure za pomocą pojedynczych poleceń
- Rozwiązywać typowe problemy z wdrożeniem i uwierzytelnianiem
- Zarządzać wieloma środowiskami Azure dla różnych etapów wdrażania
- Wdrażać ciągłe procesy wdrażania aplikacji

## Rozpoczęcie

### Lista kontrolna wymagań wstępnych
- ✅ Zainstalowany Azure Developer CLI ([Przewodnik Instalacji](installation.md))
- ✅ Uwierzytelnienie AZD zakończone poleceniem `azd auth login`
- ✅ Git zainstalowany na Twoim systemie
- ✅ Node.js w wersji 16+ (do tego samouczka)
- ✅ Visual Studio Code (zalecane)

Przed kontynuowaniem uruchom walidator ustawień z katalogu głównego repozytorium:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Sprawdź swoje ustawienia
```bash
# Sprawdź instalację azd
azd version

# Sprawdź uwierzytelnianie AZD
azd auth login --check-status
```

### Zweryfikuj opcjonalne uwierzytelnienie Azure CLI

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

# Zainicjuj szablon aplikacji todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Postępuj zgodnie z instrukcjami:
# - Wprowadź nazwę środowiska: "dev"
# - Wybierz subskrypcję (jeśli masz ich kilka)
# - Wybierz region: "East US 2" (lub preferowany region)
```

### Co się właśnie stało?
- Pobierz kod szablonu do lokalnego katalogu
- Utworzono plik `azure.yaml` z definicjami usług
- Skonfigurowano kod infrastruktury w katalogu `infra/`
- Utworzono konfigurację środowiska

## Krok 2: Poznaj strukturę projektu

Przyjrzyjmy się, co azd dla nas utworzył:

```bash
# Zobacz strukturę projektu
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

**azure.yaml** - serce Twojego projektu azd:
```bash
# Wyświetl konfigurację projektu
cat azure.yaml
```

**infra/main.bicep** - definicja infrastruktury:
```bash
# Zobacz kod infrastruktury
head -30 infra/main.bicep
```

## Krok 3: Dostosuj projekt (opcjonalnie)

Przed wdrożeniem możesz dostosować aplikację:

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

## Krok 4: Wdrożenie na Azure

Teraz najciekawsza część – wdrożenie wszystkiego na Azure!

```bash
# Wdrożenie infrastruktury i aplikacji
azd up

# To polecenie wykona:
# 1. Utworzy zasoby Azure (App Service, Cosmos DB, itp.)
# 2. Zbuduje twoją aplikację
# 3. Wdroży na utworzone zasoby
# 4. Wyświetli URL aplikacji
```

### Co się dzieje podczas wdrażania?

Polecenie `azd up` wykonuje następujące kroki:
1. **Provision** (`azd provision`) - tworzy zasoby w Azure
2. **Package** - buduje kod aplikacji
3. **Deploy** (`azd deploy`) - wdraża kod do zasobów Azure

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
Kliknij podany w wyniku wdrożenia URL lub uzyskaj go w dowolnym momencie:
```bash
# Pobierz punkty końcowe aplikacji
azd show

# Otwórz aplikację w swojej przeglądarce
azd show --output json | jq -r '.services.web.endpoint'
```

### Testuj aplikację Todo
1. **Dodaj zadanie** - kliknij "Add Todo" i wpisz zadanie
2. **Oznacz jako wykonane** - zaznacz ukończone pozycje
3. **Usuń zadania** - usuń zadania, które nie są już potrzebne

### Monitoruj aplikację
```bash
# Otwórz portal Azure dla swoich zasobów
azd monitor

# Przeglądaj logi aplikacji
azd monitor --logs

# Przeglądaj metryki na żywo
azd monitor --live
```

## Krok 6: Wprowadź zmiany i ponownie wdroż

Wprowadźmy zmianę i zobaczmy, jak łatwo jest zaktualizować:

### Modyfikuj API
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

# To jest znacznie szybsze niż 'azd up', ponieważ infrastruktura już istnieje
```

## Krok 7: Zarządzaj wieloma środowiskami

Utwórz środowisko testowe (staging) do testowania zmian przed produkcją:

```bash
# Utwórz nowe środowisko staging
azd env new staging

# Wdróż na staging
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

## Krok 8: Posprzątaj zasoby

Po zakończeniu eksperymentów posprzątaj zasoby, aby uniknąć dalszych opłat:

```bash
# Usuń wszystkie zasoby Azure dla bieżącego środowiska
azd down

# Wymuś usunięcie bez potwierdzenia i usuń trwale zasoby miękko usunięte
azd down --force --purge

# Usuń konkretne środowisko
azd env select staging
azd down --force --purge
```

## Klasyczna aplikacja vs. aplikacja AI: ten sam workflow

Właśnie wdrożyłeś tradycyjną aplikację webową. A co, jeśli chcesz wdrożyć aplikację zasilaną AI — na przykład aplikację czatu opartą na Microsoft Foundry Models?

Dobra wiadomość: **procedura jest identyczna.**

| Krok | Klasyczna aplikacja Todo | Aplikacja czatu AI |
|------|-------------------------|--------------------|
| Inicjalizacja | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Uwierzytelnianie | `azd auth login` | `azd auth login` |
| Wdrożenie | `azd up` | `azd up` |
| Monitorowanie | `azd monitor` | `azd monitor` |
| Sprzątanie | `azd down --force --purge` | `azd down --force --purge` |

Jedyną różnicą jest **szablon**, od którego zaczynasz. Szablon AI zawiera dodatkową infrastrukturę (np. zasób Microsoft Foundry Models lub indeks AI Search), ale azd wszystko za Ciebie obsługuje. Nie musisz uczyć się nowych poleceń, używać innych narzędzi ani zmieniać podejścia do wdrożeń.

To jest główna zasada azd: **jeden workflow, dowolne obciążenie.** Umiejętności, które zdobyłeś w tym samouczku — inicjalizacja, wdrożenie, monitorowanie, ponowne wdrażanie i sprzątanie — mają zastosowanie zarówno do aplikacji AI, jak i agentów.

---

## Czego się nauczyłeś

Gratulacje! Udało Ci się:
- ✅ Zainicjalizować projekt azd ze szablonu
- ✅ Poznać strukturę projektu i kluczowe pliki
- ✅ Wdrożyć aplikację full-stack na Azure
- ✅ Wprowadzić zmiany w kodzie i ponownie wdrożyć
- ✅ Zarządzać wieloma środowiskami
- ✅ Posprzątać zasoby

## 🎯 Ćwiczenia sprawdzające umiejętności

### Ćwiczenie 1: Wdróż inny szablon (15 minut)
**Cel**: Pokaż umiejętności inicjalizacji i workflow wdrożenia azd

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
- [ ] Możesz uzyskać dostęp do aplikacji przez przeglądarkę
- [ ] Aplikacja działa poprawnie (dodawanie/usuwanie zadań)
- [ ] Pomyślnie posprzątane wszystkie zasoby

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
- [ ] Utworzone niestandardowe środowisko
- [ ] Zmienne środowiskowe ustawione i dostępne
- [ ] Aplikacja wdrożona z niestandardową konfiguracją
- [ ] Możliwość weryfikacji ustawień w wdrożonej aplikacji

### Ćwiczenie 3: Workflow wielośrodowiskowy (25 minut)
**Cel**: Opanuj zarządzanie środowiskami i strategie wdrożeń

```bash
# Utwórz środowisko deweloperskie
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Zanotuj URL deweloperski
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Utwórz środowisko staging
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Zanotuj URL staging
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Porównaj środowiska
azd env list

# Przetestuj oba środowiska
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Posprzątaj oba
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kryteria sukcesu:**
- [ ] Utworzone dwa środowiska o różnych konfiguracjach
- [ ] Oba środowiska wdrożone pomyślnie
- [ ] Możliwość przełączania się między środowiskami poleceniem `azd env select`
- [ ] Różne zmienne środowiskowe dla obu środowisk
- [ ] Pomyślnie posprzątane oba środowiska

## 📊 Twój postęp

**Czas poświęcony**: ~60-90 minut  
**Nabyte umiejętności**:
- ✅ Inicjalizacja projektów ze szablonów
- ✅ Provisioning zasobów Azure
- ✅ Workflow wdrożenia aplikacji
- ✅ Zarządzanie środowiskami
- ✅ Zarządzanie konfiguracją
- ✅ Sprzątanie zasobów i zarządzanie kosztami

**Kolejny poziom**: Jesteś gotowy na [Przewodnik po Konfiguracji](configuration.md), aby poznać zaawansowane wzorce konfiguracji!

## Rozwiązywanie typowych problemów

### Błędy uwierzytelniania
```bash
# Ponownie uwierzytelnij się w Azure
az login

# Zweryfikuj dostęp do subskrypcji
az account show
```

### Niepowodzenia wdrożenia
```bash
# Włącz debugowanie logów
export AZD_DEBUG=true
azd up --debug

# Przeglądaj logi aplikacji w Azure
azd monitor --logs

# Dla aplikacji kontenerowych użyj Azure CLI:
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

Po ukończeniu pierwszego projektu zapoznaj się z następującymi zaawansowanymi tematami:

### 1. Dostosuj infrastrukturę
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Dodawaj bazy danych, magazyny i inne usługi](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Skonfiguruj CI/CD
- [Przewodnik po wdrożeniu](../chapter-04-infrastructure/deployment-guide.md) - Kompleksowe workflow CI/CD
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfiguracja pipeline

### 3. Dobre praktyki produkcyjne
- [Przewodnik po wdrożeniu](../chapter-04-infrastructure/deployment-guide.md) - Bezpieczeństwo, wydajność i monitoring

### 4. Poznaj więcej szablonów
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

## Dodatkowe materiały

### Materiały szkoleniowe
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Społeczność i wsparcie
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Społeczność Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Szablony i przykłady
- [Oficjalna Galeria Szablonów](https://azure.github.io/awesome-azd/)
- [Szablony Społeczności](https://github.com/Azure-Samples/azd-templates)
- [Wzorce Enterprise](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulacje z okazji ukończenia pierwszego projektu azd!** Teraz możesz z pewnością budować i wdrażać niesamowite aplikacje na Azure.

---

**Nawigacja po Rozdziale:**
- **📚 Strona Kursu**: [AZD dla Początkujących](../../README.md)
- **📖 Aktualny Rozdział**: Rozdział 1 - Podstawy i Szybki Start
- **⬅️ Poprzedni**: [Instalacja i Konfiguracja](installation.md)
- **➡️ Następny**: [Konfiguracja](configuration.md)
- **🚀 Następny Rozdział**: [Rozdział 2: Rozwój z AI na Pierwszym Planie](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Następna Lekcja**: [Przewodnik po wdrożeniu](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w języku źródłowym należy uznać za autorytatywne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->