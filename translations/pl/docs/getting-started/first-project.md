<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ba67ea0b26574a03ffcade6c98a9af60",
  "translation_date": "2025-11-20T00:43:15+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "pl"
}
-->
# Twój Pierwszy Projekt - Praktyczny Samouczek

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 1 - Podstawy i szybki start
- **⬅️ Poprzedni**: [Instalacja i konfiguracja](installation.md)
- **➡️ Następny**: [Konfiguracja](configuration.md)
- **🚀 Następny rozdział**: [Rozdział 2: Rozwój oparty na AI](../microsoft-foundry/microsoft-foundry-integration.md)

## Wprowadzenie

Witaj w swoim pierwszym projekcie Azure Developer CLI! Ten kompleksowy praktyczny samouczek przeprowadzi Cię przez proces tworzenia, wdrażania i zarządzania aplikacją full-stack na platformie Azure za pomocą azd. Będziesz pracować z rzeczywistą aplikacją typu todo, która zawiera frontend React, backend API Node.js oraz bazę danych MongoDB.

## Cele nauki

Po ukończeniu tego samouczka:
- Opanujesz proces inicjalizacji projektu azd za pomocą szablonów
- Zrozumiesz strukturę projektu Azure Developer CLI oraz pliki konfiguracyjne
- Wykonasz pełne wdrożenie aplikacji na Azure wraz z przygotowaniem infrastruktury
- Wprowadzisz aktualizacje aplikacji i strategie ponownego wdrażania
- Zarządzisz wieloma środowiskami dla rozwoju i testów
- Zastosujesz praktyki czyszczenia zasobów i zarządzania kosztami

## Efekty nauki

Po ukończeniu będziesz w stanie:
- Samodzielnie inicjalizować i konfigurować projekty azd z szablonów
- Skutecznie nawigować i modyfikować struktury projektów azd
- Wdrażać aplikacje full-stack na Azure za pomocą pojedynczych poleceń
- Rozwiązywać typowe problemy z wdrożeniem i uwierzytelnianiem
- Zarządzać wieloma środowiskami Azure dla różnych etapów wdrożenia
- Wdrażać ciągłe procesy wdrożeniowe dla aktualizacji aplikacji

## Rozpoczęcie

### Lista kontrolna wymagań wstępnych
- ✅ Zainstalowany Azure Developer CLI ([Przewodnik instalacji](installation.md))
- ✅ Zainstalowany i uwierzytelniony Azure CLI
- ✅ Zainstalowany Git na Twoim systemie
- ✅ Node.js 16+ (dla tego samouczka)
- ✅ Visual Studio Code (zalecane)

### Sprawdź konfigurację
```bash
# Sprawdź instalację azd
azd version
```
### Sprawdź uwierzytelnienie Azure

```bash
az account show
```

### Sprawdź wersję Node.js
```bash
node --version
```

## Krok 1: Wybierz i zainicjalizuj szablon

Zacznijmy od popularnego szablonu aplikacji typu todo, który zawiera frontend React i backend API Node.js.

```bash
# Przeglądaj dostępne szablony
azd template list

# Zainicjuj szablon aplikacji todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Postępuj zgodnie z instrukcjami:
# - Wprowadź nazwę środowiska: "dev"
# - Wybierz subskrypcję (jeśli masz ich wiele)
# - Wybierz region: "East US 2" (lub preferowany region)
```

### Co się właśnie wydarzyło?
- Pobranie kodu szablonu do lokalnego katalogu
- Utworzenie pliku `azure.yaml` z definicjami usług
- Przygotowanie kodu infrastruktury w katalogu `infra/`
- Utworzenie konfiguracji środowiska

## Krok 2: Zbadaj strukturę projektu

Przyjrzyjmy się, co azd dla nas stworzył:

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
# Zobacz kod infrastruktury
head -30 infra/main.bicep
```

## Krok 3: Dostosuj swój projekt (opcjonalnie)

Przed wdrożeniem możesz dostosować aplikację:

### Zmień frontend
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

## Krok 4: Wdróż na Azure

Teraz najciekawsza część - wdrożenie wszystkiego na Azure!

```bash
# Wdróż infrastrukturę i aplikację
azd up

# To polecenie wykona:
# 1. Udostępnienie zasobów Azure (App Service, Cosmos DB, itp.)
# 2. Zbudowanie aplikacji
# 3. Wdrożenie na udostępnione zasoby
# 4. Wyświetlenie URL aplikacji
```

### Co się dzieje podczas wdrożenia?

Polecenie `azd up` wykonuje następujące kroki:
1. **Provision** (`azd provision`) - Tworzy zasoby Azure
2. **Package** - Buduje kod aplikacji
3. **Deploy** (`azd deploy`) - Wdraża kod na zasoby Azure

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
Kliknij na URL podany w wynikach wdrożenia lub uzyskaj go w dowolnym momencie:
```bash
# Pobierz punkty końcowe aplikacji
azd show

# Otwórz aplikację w przeglądarce
azd show --output json | jq -r '.services.web.endpoint'
```

### Przetestuj aplikację typu todo
1. **Dodaj element todo** - Kliknij "Add Todo" i wpisz zadanie
2. **Oznacz jako ukończone** - Zaznacz ukończone elementy
3. **Usuń elementy** - Usuń zadania, których już nie potrzebujesz

### Monitoruj swoją aplikację
```bash
# Otwórz portal Azure dla swoich zasobów
azd monitor

# Wyświetl dzienniki aplikacji
azd logs
```

## Krok 6: Wprowadź zmiany i ponownie wdroż

Wprowadźmy zmianę i zobaczmy, jak łatwo jest zaktualizować:

### Zmień API
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

Utwórz środowisko testowe, aby sprawdzić zmiany przed produkcją:

```bash
# Utwórz nowe środowisko stagingowe
azd env new staging

# Wdróż do środowiska stagingowego
azd up

# Przełącz z powrotem na środowisko deweloperskie
azd env select dev

# Wyświetl wszystkie środowiska
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

## Krok 8: Wyczyść zasoby

Gdy skończysz eksperymentować, wyczyść zasoby, aby uniknąć dalszych opłat:

```bash
# Usuń wszystkie zasoby Azure dla bieżącego środowiska
azd down

# Wymuś usunięcie bez potwierdzenia i wyczyść miękko usunięte zasoby
azd down --force --purge

# Usuń określone środowisko
azd env select staging
azd down --force --purge
```

## Czego się nauczyłeś

Gratulacje! Udało Ci się:
- ✅ Zainicjalizować projekt azd z szablonu
- ✅ Zbadać strukturę projektu i kluczowe pliki
- ✅ Wdrożyć aplikację full-stack na Azure
- ✅ Wprowadzić zmiany w kodzie i ponownie wdrożyć
- ✅ Zarządzać wieloma środowiskami
- ✅ Wyczyścić zasoby

## 🎯 Ćwiczenia weryfikujące umiejętności

### Ćwiczenie 1: Wdróż inny szablon (15 minut)
**Cel**: Zademonstruj opanowanie procesu inicjalizacji i wdrożenia azd

```bash
# Wypróbuj stos Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Zweryfikuj wdrożenie
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Wyczyść
azd down --force --purge
```

**Kryteria sukcesu:**
- [ ] Aplikacja wdrożona bez błędów
- [ ] Można uzyskać dostęp do URL aplikacji w przeglądarce
- [ ] Aplikacja działa poprawnie (dodawanie/usuwanie zadań)
- [ ] Wszystkie zasoby zostały skutecznie wyczyszczone

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
- [ ] Zmienne środowiskowe ustawione i dostępne
- [ ] Aplikacja wdrożona z niestandardową konfiguracją
- [ ] Można zweryfikować niestandardowe ustawienia w wdrożonej aplikacji

### Ćwiczenie 3: Praca z wieloma środowiskami (25 minut)
**Cel**: Opanuj zarządzanie środowiskami i strategie wdrożeniowe

```bash
# Utwórz środowisko deweloperskie
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Zanotuj URL środowiska deweloperskiego
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Utwórz środowisko stagingowe
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Zanotuj URL środowiska stagingowego
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
- [ ] Utworzono dwa środowiska z różnymi konfiguracjami
- [ ] Oba środowiska wdrożone pomyślnie
- [ ] Można przełączać się między środowiskami za pomocą `azd env select`
- [ ] Zmienne środowiskowe różnią się między środowiskami
- [ ] Oba środowiska zostały skutecznie wyczyszczone

## 📊 Twój postęp

**Czas inwestycji**: ~60-90 minut  
**Nabyte umiejętności**:
- ✅ Inicjalizacja projektu na podstawie szablonu
- ✅ Przygotowanie zasobów Azure
- ✅ Procesy wdrożeniowe aplikacji
- ✅ Zarządzanie środowiskami
- ✅ Zarządzanie konfiguracją
- ✅ Czyszczenie zasobów i zarządzanie kosztami

**Następny poziom**: Jesteś gotowy na [Przewodnik konfiguracji](configuration.md), aby poznać zaawansowane wzorce konfiguracji!

## Rozwiązywanie typowych problemów

### Błędy uwierzytelnienia
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

# Wyświetl szczegółowe logi
azd logs --service api
azd logs --service web
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

Po ukończeniu pierwszego projektu, odkryj te zaawansowane tematy:

### 1. Dostosowanie infrastruktury
- [Infrastruktura jako kod](../deployment/provisioning.md)
- [Dodawanie baz danych, magazynów i innych usług](../deployment/provisioning.md#adding-services)

### 2. Konfiguracja CI/CD
- [Integracja z GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Najlepsze praktyki produkcyjne
- [Konfiguracje bezpieczeństwa](../deployment/best-practices.md#security)
- [Optymalizacja wydajności](../deployment/best-practices.md#performance)
- [Monitorowanie i logowanie](../deployment/best-practices.md#monitoring)

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

### Materiały edukacyjne
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centrum architektury Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Framework Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Społeczność i wsparcie
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Społeczność Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Szablony i przykłady
- [Oficjalna galeria szablonów](https://azure.github.io/awesome-azd/)
- [Szablony społeczności](https://github.com/Azure-Samples/azd-templates)
- [Wzorce dla przedsiębiorstw](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulacje za ukończenie swojego pierwszego projektu azd!** Teraz jesteś gotowy, aby budować i wdrażać niesamowite aplikacje na Azure z pewnością siebie.

---

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 1 - Podstawy i szybki start
- **⬅️ Poprzedni**: [Instalacja i konfiguracja](installation.md)
- **➡️ Następny**: [Konfiguracja](configuration.md)
- **🚀 Następny rozdział**: [Rozdział 2: Rozwój oparty na AI](../microsoft-foundry/microsoft-foundry-integration.md)
- **Następna lekcja**: [Przewodnik wdrożeniowy](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się zapewnić dokładność, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->