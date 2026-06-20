# Twój Pierwszy Projekt - Praktyczny Samouczek

**Nawigacja po rozdziale:**
- **📚 Strona Kursu**: [AZD dla początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 1 - Podstawy i szybki start
- **⬅️ Poprzedni**: [Instalacja i konfiguracja](installation.md)
- **➡️ Następny**: [Konfiguracja](configuration.md)
- **🚀 Następny rozdział**: [Rozdział 2: Rozwój z myślą o AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Wprowadzenie

Witamy w Twoim pierwszym projekcie Azure Developer CLI! Ten kompleksowy, praktyczny samouczek przeprowadzi Cię krok po kroku przez proces tworzenia, wdrażania i zarządzania aplikacją full-stack na Azure przy użyciu azd. Będziesz pracować z prawdziwą aplikacją todo, która zawiera frontend w React, backend API w Node.js oraz bazę danych MongoDB.

## Cele nauki

Po ukończeniu tego samouczka:
- Opanujesz proces inicjalizacji projektu azd za pomocą szablonów
- Zrozumiesz strukturę projektów Azure Developer CLI i pliki konfiguracyjne
- Wykonasz pełne wdrożenie aplikacji na Azure wraz z provisionowaniem infrastruktury
- Zaimplementujesz strategie aktualizacji aplikacji i ponownego wdrażania
- Będziesz zarządzać wieloma środowiskami dla rozwoju i testów
- Zastosujesz praktyki sprzątania zasobów i zarządzania kosztami

## Rezultaty nauki

Po ukończeniu będziesz w stanie:
- Samodzielnie inicjalizować i konfigurować projekty azd ze szablonów
- Sprawnie poruszać się i modyfikować struktury projektów azd
- Wdrażać aplikacje full-stack na Azure za pomocą pojedynczych poleceń
- Rozwiązywać typowe problemy z wdrażaniem i uwierzytelnianiem
- Zarządzać wieloma środowiskami Azure dla różnych etapów wdrożenia
- Wdrażać ciągłe procesy dostarczania aktualizacji aplikacji

## Zaczynamy

### Lista wymagań wstępnych
- ✅ Zainstalowany Azure Developer CLI ([Przewodnik instalacji](installation.md))
- ✅ Zakończona autoryzacja AZD za pomocą `azd auth login`
- ✅ Zainstalowany Git na twoim systemie
- ✅ Node.js 16+ (do tego samouczka)
- ✅ Visual Studio Code (zalecane)

Zanim przejdziesz dalej, uruchom walidator konfiguracji z katalogu głównego repozytorium:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Sprawdź swoją konfigurację
```bash
# Sprawdź instalację azd
azd version

# Sprawdź uwierzytelnianie AZD
azd auth login --check-status
```

### Sprawdź opcjonalną autoryzację Azure CLI

```bash
az account show
```

### Sprawdź wersję Node.js
```bash
node --version
```

## Krok 1: Wybierz i zainicjalizuj szablon

Zacznijmy od popularnego szablonu aplikacji todo, który zawiera frontend w React i backend API w Node.js.

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
# - Wybierz region: "East US 2" (lub wybrany region)
```

### Co się właśnie stało?
- Pobranie kodu szablonu do lokalnego katalogu
- Utworzenie pliku `azure.yaml` z definicjami usług
- Utworzenie kodu infrastruktury w katalogu `infra/`
- Utworzenie konfiguracji środowiska

## Krok 2: Zbadaj strukturę projektu

Zobaczmy, co azd dla nas przygotował:

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

**azure.yaml** - serce twojego projektu azd:
```bash
# Wyświetl konfigurację projektu
cat azure.yaml
```

**infra/main.bicep** - definicja infrastruktury:
```bash
# Wyświetl kod infrastruktury
head -30 infra/main.bicep
```

## Krok 3: Dostosuj projekt (opcjonalnie)

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
# Zobacz wszystkie zmienne środowiskowe
azd env get-values
```

## Krok 4: Wdrażaj na Azure

Teraz ekscytująca część – wdrożenie wszystkiego na Azure!

```bash
# Wdrożenie infrastruktury i aplikacji
azd up

# To polecenie wykona:
# 1. Przygotuje zasoby Azure (App Service, Cosmos DB, itp.)
# 2. Zbuduje twoją aplikację
# 3. Wdroży na przygotowane zasoby
# 4. Wyświetli URL aplikacji
```

### Co się dzieje podczas wdrażania?

Polecenie `azd up` wykonuje następujące kroki:
1. **Provisionowanie** (`azd provision`) - Tworzy zasoby Azure
2. **Pakowanie** - Buduje kod aplikacji
3. **Wdrażanie** (`azd deploy`) - Wdraża kod do zasobów Azure

### Oczekiwany wynik
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Krok 5: Testuj aplikację

### Dostęp do aplikacji
Kliknij na URL podany w wyniku wdrożenia lub pobierz go w dowolnym momencie:
```bash
# Pobierz końcowe punkty aplikacji
azd show

# Otwórz aplikację w przeglądarce
azd show --output json | jq -r '.services.web.endpoint'
```

### Testuj aplikację todo
1. **Dodaj zadanie** - Kliknij „Add Todo” i wpisz zadanie
2. **Oznacz jako ukończone** - Zaznacz wykonane pozycje
3. **Usuń zadania** - Usuń niepotrzebne todos

### Monitoruj aplikację
```bash
# Otwórz portal Azure dla swoich zasobów
azd monitor

# Wyświetl logi aplikacji
azd monitor --logs

# Wyświetl metryki na żywo
azd monitor --live
```

### ✅ Zweryfikuj wdrożenie

Zanim przejdziesz dalej, przejrzyj tę szybką listę kontrolną, aby upewnić się, że wszystko działa – nie zakładaj, że „wdrożenie zakończone sukcesem” oznacza „aplikacja działa”:

```bash
# 1. Potwierdź, że punkt końcowy istnieje i jest dostępny
azd show

# 2. Przeprowadź test dymny punktu końcowego (oczekuje HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Sprawdź punkt końcowy zdrowia, jeśli Twoja aplikacja go udostępnia
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Wdrożenie jest zweryfikowane, gdy:**
- ✅ `azd show` wyświetla dostępny URL endpointu
- ✅ URL otwiera się w przeglądarce bez błędów
- ✅ Kluczowe funkcje działają (dodawanie/ukończenie/usuwanie todo)
- ✅ `azd monitor --logs` pokazuje napływające żądania bez niespodziewanych błędów

Jeśli któreś sprawdzenie zawiedzie, przejdź do [Rozdziału 7: Rozwiązywanie problemów](../chapter-07-troubleshooting/README.md).

## Krok 6: Wprowadzaj zmiany i ponownie wdrażaj

Wprowadźmy zmianę i zobaczmy, jak łatwo ją zaktualizować:

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

### Wdrażaj tylko zmiany w kodzie
```bash
# Wdróż tylko kod aplikacji (pomiń infrastrukturę)
azd deploy

# To jest znacznie szybsze niż 'azd up', ponieważ infrastruktura już istnieje
```

## Krok 7: Zarządzaj wieloma środowiskami

Utwórz środowisko staging do testowania zmian przed produkcją:

```bash
# Utwórz nowe środowisko testowe
azd env new staging

# Wdróż na środowisko testowe
azd up

# Wróć do środowiska deweloperskiego
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

## Krok 8: Sprzątaj zasoby

Gdy zakończysz eksperymenty, oczyść zasoby, aby uniknąć dalszych opłat:

```bash
# Usuń wszystkie zasoby Azure dla bieżącego środowiska
azd down

# Wymuś usunięcie bez potwierdzenia i wyczyść miękko usunięte zasoby
azd down --force --purge

# Usuń określone środowisko
azd env select staging
azd down --force --purge
```

## Klasyczna aplikacja a aplikacja z AI: ten sam workflow

Właśnie wdrożyłeś tradycyjną aplikację webową. A co jeśli chcesz wdrożyć aplikację AI – na przykład chat opartego na Microsoft Foundry Models?

Dobra wiadomość: **workflow jest identyczny.**

| Krok | Klasyczna aplikacja Todo | AI Chat App |
|------|-------------------------|-------------|
| Inicjalizacja | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Autoryzacja | `azd auth login` | `azd auth login` |
| Wdróż | `azd up` | `azd up` |
| Monitoruj | `azd monitor` | `azd monitor` |
| Sprzątaj | `azd down --force --purge` | `azd down --force --purge` |

Jedyną różnicą jest **szablon**, od którego zaczynasz. Szablon AI zawiera dodatkową infrastrukturę (np. zasób Microsoft Foundry Models czy indeks AI Search), ale azd radzi sobie z tym automatycznie. Nie musisz uczyć się nowych poleceń, zmieniać narzędzi ani myśleć inaczej o wdrożeniu.

To podstawowa zasada azd: **jeden workflow, dowolne obciążenie.** Umiejętności, które ćwiczyłeś w tym samouczku — inicjalizacja, wdrażanie, monitorowanie, ponowne wdrażanie i sprzątanie — stosują się równie dobrze do aplikacji i agentów AI.

---

## Czego się nauczyłeś

Gratulacje! Udało Ci się:
- ✅ Zainicjalizować projekt azd ze szablonu
- ✅ Poznać strukturę projektu i kluczowe pliki
- ✅ Wdrożyć aplikację full-stack na Azure
- ✅ Wprowadzić zmiany w kodzie i ponownie wdrożyć
- ✅ Zarządzać wieloma środowiskami
- ✅ Posprzątać zasoby

## 🎯 Ćwiczenia potwierdzające umiejętności

### Ćwiczenie 1: Wdróż inny szablon (15 minut)
**Cel:** Zaprezentować opanowanie procesu `azd init` i wdrażania

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
- [ ] Można uzyskać dostęp do aplikacji przez przeglądarkę
- [ ] Aplikacja działa prawidłowo (dodawanie/usuwanie zadań)
- [ ] Wszystkie zasoby zostały poprawnie posprzątane

### Ćwiczenie 2: Dostosuj konfigurację (20 minut)
**Cel:** Ćwiczenie konfiguracji zmiennych środowiskowych

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
- [ ] Zmienna środowiskowa poprawnie ustawiona i odczytywalna
- [ ] Aplikacja wdraża się z niestandardową konfiguracją
- [ ] Można zweryfikować niestandardowe ustawienia w wdrożonej aplikacji

### Ćwiczenie 3: Workflow wielośrodowiskowy (25 minut)
**Cel:** Opanowanie zarządzania środowiskami i strategii wdrażania

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

# Posprzątaj oba
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kryteria sukcesu:**
- [ ] Utworzone dwa środowiska o różnych konfiguracjach
- [ ] Oba środowiska zostały pomyślnie wdrożone
- [ ] Możliwość przełączania się między środowiskami przez `azd env select`
- [ ] Zmienne środowiskowe różnią się między środowiskami
- [ ] Oba środowiska zostały sprzątnięte poprawnie

## 📊 Twój postęp

**Czas inwestycji**: ~60-90 minut  
**Nabyte umiejętności**:
- ✅ Inicjalizacja projektów na bazie szablonów
- ✅ Provisionowanie zasobów Azure
- ✅ Workflow wdrażania aplikacji
- ✅ Zarządzanie środowiskami
- ✅ Zarządzanie konfiguracją
- ✅ Sprzątanie zasobów i zarządzanie kosztami

**Kolejny poziom**: Jesteś gotowy na [Przewodnik po konfiguracji](configuration.md) by nauczyć się zaawansowanych wzorców konfiguracji!

## Rozwiązywanie typowych problemów

### Błędy uwierzytelniania
```bash
# Ponownie uwierzytelnij się w Azure
az login

# Sprawdź dostęp do subskrypcji
az account show
```

### Niepowodzenia wdrożeń
```bash
# Włącz debugowanie logowania
export AZD_DEBUG=true
azd up --debug

# Wyświetl dzienniki aplikacji w Azure
azd monitor --logs

# Dla aplikacji kontenerowych użyj Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Konflikty nazw zasobów
```bash
# Użyj unikalnej nazwy środowiska
azd env new dev-$(whoami)-$(date +%s)
```

### Problemy z portem/siecią
```bash
# Sprawdź, czy porty są dostępne
netstat -an | grep :3000
netstat -an | grep :3100
```

## Kolejne kroki

Teraz, gdy ukończyłeś pierwszy projekt, zgłębiaj zaawansowane tematy:

### 1. Dostosuj infrastrukturę
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Dodawanie baz danych, storage oraz innych usług](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Skonfiguruj CI/CD
- [Przewodnik wdrożenia](../chapter-04-infrastructure/deployment-guide.md) - Kompleksowe workflow CI/CD
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfiguracja pipeline

### 3. Najlepsze praktyki produkcyjne
- [Przewodnik wdrożenia](../chapter-04-infrastructure/deployment-guide.md) - Bezpieczeństwo, wydajność i monitoring

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

## Dodatkowe zasoby

### Materiały edukacyjne
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centrum Architektury Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Społeczność i wsparcie
- [Azure Developer CLI na GitHub](https://github.com/Azure/azure-dev)
- [Społeczność Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Szablony i przykłady
- [Oficjalna galeria szablonów](https://azure.github.io/awesome-azd/)
- [Szablony społeczności](https://github.com/Azure-Samples/azd-templates)
- [Wzorce Enterprise](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulacje z ukończenia pierwszego projektu azd!** Jesteś teraz gotowy, by budować i wdrażać niesamowite aplikacje na Azure z pewnością siebie.

---

**Nawigacja po rozdziale:**
- **📚 Strona Kursu**: [AZD dla początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 1 - Podstawy i szybki start
- **⬅️ Poprzedni**: [Instalacja i konfiguracja](installation.md)
- **➡️ Następny**: [Wprowadź swoją aplikację](bring-your-own-app.md)
- **🚀 Następny rozdział**: [Rozdział 2: Rozwój z myślą o AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->