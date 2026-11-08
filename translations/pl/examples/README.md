# Przykłady — angielski oryginał i przykłady Azure

To są przykłady do nauki, a nie certyfikowane aplikacje produkcyjne. Przeczytaj wymagania wstępne, ograniczenia, koszty i instrukcje dotyczące sprzątania dla każdego
przykładu przed
uruchamianie poleceń. Należy sprawdzić dostępność i limity zasobów Azure w swojej subskrypcji.

- [Strona kursu](../README.md)
- [Instalacja](../docs/chapter-01-foundation/installation.md)
- [Rozwiązywanie problemów](../docs/chapter-07-troubleshooting/common-issues.md)

## Co faktycznie istnieje lokalnie

Istnieją **cztery przykładowe aplikacje** oraz **jeden szkielet infrastruktury**:

| Przykład | Lokalna implementacja | Tematyka nauki | Poziom |
|---|---|---|---|
| [Proste API Flask](../../../examples/container-app/simple-flask-api) | Flask CRUD API, Dockerfile, Bicep, `azure.yaml` | Wdrażanie kontenera, sondy, logi | Początkujący |
| [Mikroserwisy dwusystemowe](../../../examples/container-app/microservices) | Brama Node.js i serwis produktu do odczytu Python, Dockerfiles, Bicep, `azure.yaml` | Wewnętrzna komunikacja HTTPS, niezależne skalowanie | Średnio zaawansowany |
| [Aplikacja bazodanowa](../../../examples/database-app) | API do odczytu Flask, Azure SQL, App Service, Bicep, `azure.yaml` | Łączność SQL, inicjalizacja, logi | Średnio zaawansowany |
| [Czat Azure OpenAI](../../../examples/azure-openai-chat) | Lokalny CLI Python, Azure OpenAI i Key Vault Bicep, tylko infrastruktura `azure.yaml` | Udostępnianie modelu, historia czatu, estymacje tokenów | Średnio zaawansowany |
| [Infrastruktura retailowa](../../../examples/retail-multiagent-arm-template) | Szablon ARM, parametry, skrypt wdrożeniowy Bash; **tylko kontenery hello-world** | Infrastruktura dla przyszłej aplikacji wieloagentowej | Zaawansowany |

Scenariusz [detaliczny](retail-scenario.md) jest **projektem architektury**, a nie
kompletną implementacją wieloagentową. Nie zawiera kodu agenta detalicznego, frontendu czatu,
API routera, pipeline’u danych wyszukiwania, interfejsu CLI do ewaluacji, automatycznego przełączania awaryjnego ani
zabezpieczeń produkcyjnych. Wszystkie te elementy muszą być zaprojektowane, zbudowane i przetestowane osobno.

Przegląd [mikroserwisów](microservices/README.md) wskazuje na przykład działania dwóch serwisów;
nie jest to kolejny katalog wdrożeniowy.

## Zalecana ścieżka nauki

1. Wdróż Flask API i zweryfikuj `/health` oraz operacje CRUD.
2. Wdróż aplikację bazy danych i zweryfikuj jej pięć wczytanych produktów.
3. Wdróż przykład z dwoma serwisami i zweryfikuj żądania bramki do produktu.
4. Przygotuj zasoby czatu i uruchom interaktywny CLI **lokalnie**.
5. Przestudiuj projekt detaliczny po ukończeniu działających przykładów.

Przeznacz około 30–60 minut na każdy przykład aplikacji, uwzględniając wymagania wstępne i
weryfikację. Implementacja detaliczna to oddzielny projekt rozwojowy, nie
30-minutowe warsztaty. Czytanie jej architektury zajmuje około 2–3 godzin; implementacja
i gotowość produkcyjna mogą zająć znacznie więcej czasu niż ilustracyjne
80–120 godzin rozwoju w przewodniku.

## Szybki start

Z katalogu głównego repozytorium, dla pierwszego przykładu kontenera:

```bash
cd examples/container-app/simple-flask-api
azd auth login
azd env new flask-demo
azd up
API_URL=$(azd env get-value API_ENDPOINT)
curl --fail-with-body "${API_URL}/health"
```

Oczekiwane: HTTP 200 oraz JSON zawierający `"status": "healthy"`.
Do lokalnego budowania kontenera potrzebny jest działający Docker.

Aby korzystać z czatu, postępuj zgodnie z [README czatu](azure-openai-chat/README.md): użyj
`azd provision`, załaduj klucz API z Key Vault do obecnej powłoki, zainstaluj
`src/requirements.txt` i uruchom `python src/chat.py`. Nie ma usług czatu hostowanych.

Dla detalicznego użyj [przewodnika ARM](retail-multiagent-arm-template/README.md).
Nie zawiera on `azure.yaml` i **nie** jest wdrażany ani usuwany przez `azd up`/`azd down`.

## Koszty i ograniczenia

- Wszystkie wdrożenia tworzą płatne zasoby Azure. Skalowanie do zera dotyczy tylko
  obliczeń aplikacji; nie eliminuje kosztów rejestru, bazy danych, pamięci, wyszukiwania ani logów.
- Dokładne ceny zależą od regionu, waluty, ruchu, modelu/SKU oraz przechowywania danych.
  Użyj [kalkulatora cen Azure](https://azure.microsoft.com/pricing/calculator/)
  przed wdrożeniem i skonfiguruj budżet w Azure Cost Management.
- Dane CRUD Flask są w pamięci, ograniczone do jednego worker i maksymalnie jednej repliki domyślnie.
  Znikają po restarcie lub skalowaniu do zera. To nie jest trwała pamięć.
- Mikrousługa produktów udostępnia tylko endpointy GET. Nie zawiera usługi zamówień, użytkowników,
  bazy danych, Service Bus, implementacji C# ani Go.
- Zasoby Application Insights nie instrumentują automatycznie każdej aplikacji.
  Sprawdź każdy przykład pod kątem rzeczywiście emitowanej telemetrii.
- Przykłady nie implementują uwierzytelniania aplikacji. Dodaj tożsamość, autoryzację,
  trwałą pamięć, kontrolę sieci, testy i procedury operacyjne przed produkcją.

## Zewnętrzne przykłady Azure — klonuj osobno

Te linki to odwołania do osobnych repozytoriów, **a nie lokalne przykłady**.
Ich opiekunowie odpowiadają za instrukcje konfiguracji, implementację, zależności i koszty.

| Przykład | Temat |
|---|---|
| [Node.js + MongoDB todo](https://github.com/Azure-Samples/todo-nodejs-mongo) | Aplikacja Node.js z bazą danych |
| [C# + SQL todo](https://github.com/Azure-Samples/todo-csharp-sql) | C# i Azure SQL |
| [Static Web Apps + Functions](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | Statyczny frontend z funkcjami C# i SQL |
| [Python Functions + MongoDB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | Bezserwerowa aplikacja Python |
| [Container Apps store API](https://github.com/Azure-Samples/container-apps-store-api-microservice) | Konteneryzowany backend sklepu |
| [AI chat quickstart](https://github.com/Azure-Samples/get-started-with-ai-chat) | Aplikacja czatu AI |
| [AI agents quickstart](https://github.com/Azure-Samples/get-started-with-ai-agents) | Aplikacja agentów |
| [Search + OpenAI demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG z wyszukiwaniem i cytatami |
| [Contoso Chat](https://github.com/Azure-Samples/contoso-chat) | Przykład konwersacyjnej AI |
| [Java on Container Apps](https://github.com/Azure-Samples/java-on-aca) | Mikrousługi Java |

Odkryj więcej projektów w [galerii szablonów AZD](https://azure.github.io/awesome-azd/).
Nie zakładaj, że zewnętrzny projekt obsługuje `azd` bez sprawdzenia aktualnego README.

## Struktura repozytorium

```text
examples/
├── azure-openai-chat/               # Local CLI + model infrastructure
├── container-app/
│   ├── simple-flask-api/            # Single Flask API
│   └── microservices/               # Gateway + read-only product service
├── database-app/                    # Flask + Azure SQL on App Service
├── microservices/README.md          # Navigation to the canonical example
├── retail-multiagent-arm-template/  # Infrastructure scaffold only
└── retail-scenario.md               # Architecture blueprint
```

To indeks nie obiecuje wspólnego katalogu `configurations/`, `scripts/` ani testów.
Faktyczne pliki i opcjonalne pomysły na rozszerzenia są określone w każdym przewodniku.

## Czyszczenie

Dla czterech przykładów AZD uruchom to **z katalogu wybranego przykładu**:

```bash
azd down
```

Przejrzyj monit usuwania. W przypadku retail usuń tylko dedykowaną grupę zasobów,
którą utworzyłeś, korzystając z instrukcji w przewodniku ARM. Sprawdź Azure Cost Management
po oczyszczeniu; dane rozliczeniowe mogą nadejść później.

## Wkład w projekt

Dołącz źródło, infrastrukturę, konfigurację wdrożenia, praktyczne kroki konfiguracji i
weryfikacji, ograniczenia oraz instrukcje sprzątania do każdego przykładu aplikacji.
Wyraźnie oznacz materiały dotyczące wyłącznie architektury oraz niekompletne fragmenty kodu.
Nie twierdź, że gotowe do produkcji bez testów wdrożeniowych, funkcjonalnych i operacyjnych.

[FAQ](../resources/faq.md) · [Przewodnik nauki](../resources/study-guide.md) ·
[Zgłoś problem](https://github.com/microsoft/AZD-for-beginners/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->