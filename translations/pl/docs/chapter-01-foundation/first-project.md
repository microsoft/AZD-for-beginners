# Twój Pierwszy Projekt – Praktyczny Samouczek

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Aktualny rozdział**: Rozdział 1 – Podstawy i szybki start
- **⬅️ Poprzedni**: [Instalacja i konfiguracja](installation.md)
- **➡️ Następny**: [Konfiguracja](configuration.md)
- **🚀 Następny rozdział**: [Rozdział 2: Rozwój AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Wprowadzenie

Witamy w Twoim pierwszym projekcie Azure Developer CLI! Ten kompleksowy, praktyczny samouczek przeprowadzi Cię krok po kroku przez tworzenie, wdrażanie i zarządzanie pełnostackową aplikacją na Azure za pomocą azd. Pracować będziesz na prawdziwej aplikacji todo, która zawiera frontend w React, backend API w Node.js oraz bazę danych MongoDB.

## Cele nauki

Po ukończeniu tego samouczka:
- Opanujesz inicjalizację projektów azd za pomocą szablonów
- Zrozumiesz strukturę projektu Azure Developer CLI i pliki konfiguracyjne
- Wykonasz pełne wdrożenie aplikacji na Azure wraz z provisioningiem infrastruktury
- Zaimplementujesz strategie aktualizacji aplikacji i redeployu
- Zarządzisz wieloma środowiskami dla developmentu i stagingu
- Zastosujesz praktyki sprzątania zasobów i zarządzania kosztami

## Oczekiwane efekty nauki

Po ukończeniu będziesz potrafił/a:
- Samodzielnie inicjalizować i konfigurować projekty azd ze szablonów
- Skutecznie nawigować i modyfikować strukturę projektów azd
- Wdrażać pełnostackowe aplikacje na Azure przy użyciu jednego polecenia
- Rozwiązywać typowe problemy z wdrożeniem i uwierzytelnianiem
- Zarządzać wieloma środowiskami Azure dla różnych etapów wdrożenia
- Realizować ciągłe wdrażanie (CI/CD) dla aktualizacji aplikacji

## Rozpoczęcie pracy

### Lista wymagań wstępnych
- ✅ Zainstalowany Azure Developer CLI ([Przewodnik instalacji](installation.md))
- ✅ Zainstalowany i uwierzytelniony Azure CLI
- ✅ Zainstalowany Git na twoim systemie
- ✅ Node.js 16+ (na potrzeby tego samouczka)
- ✅ Visual Studio Code (zalecane)

### Weryfikacja konfiguracji
```bash
# Sprawdź instalację azd
azd version
```
### Weryfikacja uwierzytelnienia w Azure

```bash
az account show
```

### Sprawdzenie wersji Node.js
```bash
node --version
```

## Krok 1: Wybierz i zainicjalizuj szablon

Zacznijmy od popularnego szablonu aplikacji todo z frontendem w React i backendem API w Node.js.

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

### Co właśnie się stało?
- Pobranie kodu szablonu do lokalnego folderu
- Utworzenie pliku `azure.yaml` z definicjami usług
- Skonfigurowanie kodu infrastruktury w katalogu `infra/`
- Utworzenie konfiguracji środowiska

## Krok 2: Zapoznaj się ze strukturą projektu

Przyjrzyjmy się, co azd dla nas stworzył:

```bash
# Zobacz strukturę projektu
tree /f   # Windows
# lub
find . -type f | head -20   # macOS/Linux
```

Powinieneś/powinnaś zobaczyć:
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

**azure.yaml** – Serce twojego projektu azd:
```bash
# Zobacz konfigurację projektu
cat azure.yaml
```

**infra/main.bicep** – Definicja infrastruktury:
```bash
# Zobacz kod infrastruktury
head -30 infra/main.bicep
```

## Krok 3: Dostosuj swój projekt (opcjonalnie)

Przed wdrożeniem możesz dostosować aplikację:

### Modyfikacja frontendu
```bash
# Otwórz komponent aplikacji React
code src/web/src/App.tsx
```

Wprowadź prostą zmianę:
```typescript
// Znajdź tytuł i zmień go
<h1>My Awesome Todo App</h1>
```

### Konfiguracja zmiennych środowiskowych
```bash
# Ustaw niestandardowe zmienne środowiskowe
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Wyświetl wszystkie zmienne środowiskowe
azd env get-values
```

## Krok 4: Wdrożenie na Azure

Teraz ekscytująca część – wdrożenie wszystkiego na Azure!

```bash
# Wdróż infrastrukturę i aplikację
azd up

# To polecenie wykona:
# 1. Przydzieli zasoby Azure (App Service, Cosmos DB itp.)
# 2. Zbuduje twoją aplikację
# 3. Wdroży na przydzielone zasoby
# 4. Wyświetli adres URL aplikacji
```

### Co dzieje się podczas wdrażania?

Polecenie `azd up` wykonuje te kroki:
1. **Provisioning** (`azd provision`) – Tworzy zasoby Azure
2. **Pakowanie** – Buduje kod aplikacji
3. **Wdrożenie** (`azd deploy`) – Wdraża kod do zasobów Azure

### Oczekiwany wynik
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Krok 5: Testuj swoją aplikację

### Uzyskaj dostęp do aplikacji
Kliknij podany URL w wyniku wdrożenia lub uzyskaj go w dowolnym momencie:
```bash
# Pobierz punkty końcowe aplikacji
azd show

# Otwórz aplikację w swojej przeglądarce
azd show --output json | jq -r '.services.web.endpoint'
```

### Testowanie aplikacji Todo
1. **Dodaj zadanie** – Kliknij „Add Todo” i wpisz zadanie
2. **Oznacz jako ukończone** – Zaznacz wykonane zadania
3. **Usuń elementy** – Usuń niepotrzebne zadania

### Monitorowanie aplikacji
```bash
# Otwórz portal Azure dla Twoich zasobów
azd monitor

# Wyświetl logi aplikacji
azd monitor --logs

# Wyświetl metryki na żywo
azd monitor --live
```

## Krok 6: Wprowadzaj zmiany i redeployuj

Zróbmy zmianę i zobaczmy, jak łatwo ją zaktualizować:

### Modyfikacja API
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

## Krok 7: Zarządzanie wieloma środowiskami

Utwórz środowisko staging, aby testować zmiany przed produkcją:

```bash
# Utwórz nowe środowisko staging
azd env new staging

# Wdróż do środowiska staging
azd up

# Przełącz się z powrotem na środowisko deweloperskie
azd env select dev

# Wyświetl wszystkie środowiska
azd env list
```

### Porównanie środowisk
```bash
# Wyświetl środowisko deweloperskie
azd env select dev
azd show

# Wyświetl środowisko stagingowe
azd env select staging
azd show
```

## Krok 8: Sprzątanie zasobów

Gdy skończysz eksperymentować, posprzątaj zasoby, aby uniknąć dalszych opłat:

```bash
# Usuń wszystkie zasoby Azure dla bieżącego środowiska
azd down

# Wymuś usunięcie bez potwierdzenia i oczyść miękko usunięte zasoby
azd down --force --purge

# Usuń konkretne środowisko
azd env select staging
azd down --force --purge
```

## Klasyczna aplikacja a aplikacja wspierana AI: ten sam workflow

Właśnie wdrożyłeś(aś) tradycyjną aplikację webową. A co, gdybyś chciał(a) wdrożyć aplikację wspieraną przez AI – na przykład aplikację czatu opartą na modelach Microsoft Foundry?

Dobra wiadomość: **workflow jest identyczny.**

| Krok | Klasyczna aplikacja Todo | Aplikacja AI Chat |
|------|--------------------------|-------------------|
| Inicjalizacja | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Uwierzytelnianie | `azd auth login` | `azd auth login` |
| Wdrożenie | `azd up` | `azd up` |
| Monitorowanie | `azd monitor` | `azd monitor` |
| Sprzątanie | `azd down --force --purge` | `azd down --force --purge` |

Jedyne, co się różni, to **szablon**, od którego zaczynasz. Szablon AI zawiera dodatkową infrastrukturę (np. zasób Microsoft Foundry Models lub indeks AI Search), ale azd zajmie się tym za Ciebie. Nie musisz uczyć się nowych poleceń, stosować innych narzędzi ani zmieniać sposobu myślenia o wdrażaniu.

To jest podstawowa zasada azd: **jeden workflow, dowolne obciążenie.** Umiejętności praktykowane w tym samouczku – inicjalizacja, wdrożenie, monitorowanie, redeploy, sprzątanie – mają zastosowanie również do aplikacji i agentów AI.

---

## Czego się nauczyłeś/aś

Gratulacje! Udało Ci się:
- ✅ Zainicjalizować projekt azd ze szablonu
- ✅ Poznać strukturę projektu i kluczowe pliki
- ✅ Wdrożyć pełnostackową aplikację na Azure
- ✅ Wprowadzić zmiany w kodzie i ponownie wdrożyć
- ✅ Zarządzać wieloma środowiskami
- ✅ Posprzątać zasoby

## 🎯 Ćwiczenia na potwierdzenie umiejętności

### Ćwiczenie 1: Wdrożenie innego szablonu (15 minut)
**Cel**: Udowodnij opanowanie inicjalizacji azd i workflow wdrożenia

```bash
# Wypróbuj stack Python + MongoDB
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
- [ ] Można uzyskać dostęp do URL aplikacji w przeglądarce
- [ ] Aplikacja działa poprawnie (dodawanie/usuwanie todo)
- [ ] Wszystkie zasoby zostały skutecznie posprzątane

### Ćwiczenie 2: Dostosowanie konfiguracji (20 minut)
**Cel**: Przećwicz konfigurację zmiennych środowiskowych

```bash
cd my-first-azd-app

# Utwórz niestandardowe środowisko
azd env new custom-config

# Ustaw niestandardowe zmienne
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Sprawdź zmienne
azd env get-values | grep APP_TITLE

# Wdróż z niestandardową konfiguracją
azd up
```

**Kryteria sukcesu:**
- [ ] Utworzono niestandardowe środowisko pomyślnie
- [ ] Zmiennymi środowiskowymi można zarządzać i je odczytać
- [ ] Aplikacja wdraża się z niestandardową konfiguracją
- [ ] Można zweryfikować niestandardowe ustawienia w wdrożonej aplikacji

### Ćwiczenie 3: Workflow wielośrodowiskowy (25 minut)
**Cel**: Opanuj zarządzanie środowiskami oraz strategie wdrożeń

```bash
# Utwórz środowisko deweloperskie
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Zanotuj URL środowiska deweloperskiego
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Utwórz środowisko testowe
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Zanotuj URL środowiska testowego
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Porównaj środowiska
azd env list

# Przetestuj oba środowiska
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Wyczyść oba
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kryteria sukcesu:**
- [ ] Utworzone dwa środowiska z różną konfiguracją
- [ ] Oba środowiska wdrożone pomyślnie
- [ ] Można przełączać się między środowiskami za pomocą `azd env select`
- [ ] Zmienne środowiskowe różnią się między środowiskami
- [ ] Oba środowiska zostały skutecznie posprzątane

## 📊 Twój postęp

**Czas poświęcony**: ~60-90 minut  
**Nabyte umiejętności**:
- ✅ Inicjalizacja projektu z szablonu
- ✅ Provisioning zasobów Azure
- ✅ Workflow wdrażania aplikacji
- ✅ Zarządzanie środowiskami
- ✅ Zarządzanie konfiguracją
- ✅ Sprzątanie zasobów i zarządzanie kosztami

**Następny poziom**: Jesteś gotowy/a na [Przewodnik po konfiguracji](configuration.md), aby poznać zaawansowane wzorce konfiguracji!

## Rozwiązywanie typowych problemów

### Błędy uwierzytelniania
```bash
# Ponownie uwierzytelnij się w Azure
az login

# Zweryfikuj dostęp do subskrypcji
az account show
```

### Problemy z wdrożeniem
```bash
# Włącz rejestrowanie debugowania
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

## Kolejne kroki

Skoro ukończyłeś/aś pierwszy projekt, zapoznaj się z tymi zaawansowanymi tematami:

### 1. Dostosowanie infrastruktury
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Dodawanie baz danych, magazynów i innych usług](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Konfiguracja CI/CD
- [Przewodnik wdrożeń](../chapter-04-infrastructure/deployment-guide.md) – Kompleksowe workflow CI/CD
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) – Konfiguracja pipeline’ów

### 3. Najlepsze praktyki produkcyjne
- [Przewodnik wdrożeń](../chapter-04-infrastructure/deployment-guide.md) – Bezpieczeństwo, wydajność i monitorowanie

### 4. Eksploruj więcej szablonów
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

## Dodatkowe źródła informacji

### Materiały edukacyjne
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Społeczność i wsparcie
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow – azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Szablony i przykłady
- [Oficjalna galeria szablonów](https://azure.github.io/awesome-azd/)
- [Szablony społecznościowe](https://github.com/Azure-Samples/azd-templates)
- [Wzorce dla przedsiębiorstw](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulacje z ukończenia pierwszego projektu azd!** Teraz jesteś gotowy/a, aby z pewnością budować i wdrażać niesamowite aplikacje na Azure.

---

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Aktualny rozdział**: Rozdział 1 – Podstawy i szybki start
- **⬅️ Poprzedni**: [Instalacja i konfiguracja](installation.md)
- **➡️ Następny**: [Konfiguracja](configuration.md)
- **🚀 Następny rozdział**: [Rozdział 2: Rozwój AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Następna lekcja**: [Przewodnik wdrożeń](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się o dokładność, należy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w języku źródłowym powinien być uważany za autorytatywne źródło. Dla informacji krytycznych zaleca się profesjonalne tłumaczenie wykonane przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->