# 3. Rozkładanie szablonu na części

!!! tip "NA KONIEC TEGO MODUŁU BĘDZIESZ UMIAŁ"

    - [ ] Aktywować GitHub Copilot z serwerami MCP dla pomocy w Azure
    - [ ] Zrozumieć strukturę folderów i składniki szablonu AZD
    - [ ] Poznać wzorce organizacyjne infrastruktury jako kodu (Bicep)
    - [ ] **Laboratorium 3:** Korzystać z GitHub Copilot, aby poznać i zrozumieć architekturę repozytorium

---

Dzięki szablonom AZD i Azure Developer CLI (`azd`) możemy szybko rozpocząć naszą podróż rozwoju AI z ustandaryzowanymi repozytoriami, które dostarczają przykładowy kod, infrastrukturę i pliki konfiguracyjne - w formie gotowego do wdrożenia _projektu startowego_.

**Ale teraz musimy zrozumieć strukturę projektu i bazę kodu - oraz móc dostosować szablon AZD - bez wcześniejszego doświadczenia ani znajomości AZD!**

---

## 1. Aktywuj GitHub Copilot

### 1.1 Zainstaluj GitHub Copilot Chat

Czas poznać [GitHub Copilot w trybie Agenta](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Teraz możemy naturalnym językiem opisać nasze zadanie na wysokim poziomie i otrzymać pomoc w jego realizacji. Do tego laboratorium użyjemy [planu Copilot Free](https://github.com/github-copilot/signup), który ma miesięczne limity na zakończenia i interakcje na czacie.

Rozszerzenie można zainstalować z marketplace, ale powinno być już dostępne w twoim środowisku Codespaces. _Kliknij `Open Chat` z rozwijanego menu ikony Copilot i wpisz polecenie takie jak `What can you do?`_ - może pojawić się monit o zalogowanie. **GitHub Copilot Chat jest gotowy**.

### 1.2. Zainstaluj serwery MCP

Aby tryb Agenta był skuteczny, potrzebuje dostępu do właściwych narzędzi, które pomogą mu pobierać wiedzę lub podejmować działania. Tutaj mogą pomóc serwery MCP. Skonfigurujemy następujące serwery:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Aby je aktywować:

1. Utwórz plik o nazwie `.vscode/mcp.json`, jeśli nie istnieje
1. Skopiuj do niego poniższe - i uruchom serwery!
   ```json title=".vscode/mcp.json"
   {
      "servers": {
         "Azure MCP Server": {
            "command": "npx",
            "args": [
            "-y",
            "@azure/mcp@latest",
            "server",
            "start"
            ]
         },
         "microsoft.docs.mcp": {
            "type": "http",
            "url": "https://learn.microsoft.com/api/mcp"
         }
      }
   }
   ```

??? warning "Może pojawić się błąd, że `npx` nie jest zainstalowany (kliknij, aby rozwinąć rozwiązanie)"

      Aby naprawić, otwórz plik `.devcontainer/devcontainer.json` i dodaj tę linię do sekcji features. Następnie odbuduj kontener. Powinieneś mieć teraz zainstalowany `npx`.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Przetestuj GitHub Copilot Chat

**Najpierw użyj `az login`, aby uwierzytelnić się w Azure z wiersza poleceń VS Code.**

Teraz powinieneś móc zapytać o status swojej subskrypcji Azure oraz o zasoby lub konfigurację. Wypróbuj takie polecenia:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Możesz też zadawać pytania o dokumentację Azure i otrzymywać odpowiedzi pochodzące z serwera Microsoft Docs MCP. Wypróbuj:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Albo poprosić o fragmenty kodu do wykonania zadania. Wypróbuj to polecenie:

1. `Give me a Python code example that uses AAD for an interactive chat client`

W trybie `Ask` otrzymasz kod do skopiowania i wypróbowania. W trybie `Agent` może to pójść krok dalej i stworzyć odpowiednie zasoby - włącznie ze skryptami konfiguracyjnymi i dokumentacją - aby pomóc ci wykonać zadanie.

**Jesteś teraz gotowy, by zacząć eksplorować repozytorium szablonu**

---

## 2. Rozkład architektury

??? prompt "PYTANIE: Wyjaśnij architekturę aplikacji na docs/images/architecture.png w 1 akapicie"

      Ta aplikacja to aplikacja czatu oparta na AI zbudowana na Azure, która demonstruje nowoczesną architekturę opartą na agentach. Rozwiązanie koncentruje się na Azure Container App, która hostuje główny kod aplikacji, przetwarzający dane wejściowe użytkownika i generujący inteligentne odpowiedzi za pomocą agenta AI.
      
      Architektura wykorzystuje Microsoft Foundry Project jako fundament możliwości AI, łącząc się z usługami Azure AI, które dostarczają modele językowe (takie jak gpt-4.1-mini) oraz funkcjonalność agenta. Interakcje użytkownika przepływają przez frontend oparty na React do backendu FastAPI, który komunikuje się z usługą agenta AI w celu generowania kontekstowych odpowiedzi.
      
      System zawiera możliwości wyszukiwania wiedzy poprzez wyszukiwanie plików lub usługę Azure AI Search, umożliwiając agentowi dostęp i cytowanie informacji z przesłanych dokumentów.
      
      Dla wysokiej jakości działania architektura zawiera kompleksowy monitoring przez Application Insights i Log Analytics Workspace do śledzenia, logowania i optymalizacji wydajności.
      
      Azure Storage zapewnia przechowywanie blobów dla danych aplikacji oraz przesyłania plików, podczas gdy Managed Identity gwarantuje bezpieczny dostęp między zasobami Azure bez przechowywania poświadczeń.
      
      Całe rozwiązanie jest zaprojektowane z myślą o skalowalności i łatwości utrzymania, z konteneryzowaną aplikacją, która automatycznie skaluje się w zależności od zapotrzebowania, zapewniając wbudowane zabezpieczenia, monitorowanie i możliwości CI/CD w ekosystemie zarządzanych usług Azure.

![Architecture](../../../../../translated_images/pl/architecture.48d94861e6e6cdc0.webp)

---

## 3. Struktura repozytorium

!!! prompt "PYTANIE: Wyjaśnij strukturę folderów szablonu. Zacznij od wizualnego diagramu hierarchicznego."

??? info "ODPOWIEDŹ: Wizualny diagram hierarchiczny"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfiguracja i ustawienia
      │   ├── azure.yaml                    # Konfiguracja Azure Developer CLI
      │   ├── docker-compose.yaml           # Kontenery do lokalnego rozwoju
      │   ├── pyproject.toml                # Konfiguracja projektu Python
      │   ├── requirements-dev.txt          # Zależności do rozwoju
      │   └── .devcontainer/                # Ustawienia kontenera dla VS Code
      │
      ├── 🏗️ Infrastruktura (infra/)
      │   ├── main.bicep                    # Główny szablon infrastruktury
      │   ├── api.bicep                     # Zasoby specyficzne dla API
      │   ├── main.parameters.json          # Parametry infrastruktury
      │   └── core/                         # Modularne składniki infrastruktury
      │       ├── ai/                       # Konfiguracje usług AI
      │       ├── host/                     # Infrastruktura hostingu
      │       ├── monitor/                  # Monitorowanie i logowanie
      │       ├── search/                   # Konfiguracja Azure AI Search
      │       ├── security/                 # Bezpieczeństwo i tożsamość
      │       └── storage/                  # Konfiguracje kont magazynu
      │
      ├── 💻 Kod aplikacji (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # Punkt wejścia aplikacji FastAPI
      │   │   ├── routes.py                 # Definicje ścieżek API
      │   │   ├── search_index_manager.py   # Funkcje wyszukiwania
      │   │   ├── data/                     # Obsługa danych API
      │   │   ├── static/                   # Statyczne zasoby webowe
      │   │   └── templates/                # Szablony HTML
      │   ├── frontend/                     # Frontend React/TypeScript
      │   │   ├── package.json              # Zależności Node.js
      │   │   ├── vite.config.ts            # Konfiguracja budowania Vite
      │   │   └── src/                      # Kod źródłowy frontendu
      │   ├── data/                         # Przykładowe pliki danych
      │   │   └── embeddings.csv            # Wstępnie obliczone osadzenia
      │   ├── files/                        # Pliki bazy wiedzy
      │   │   ├── customer_info_*.json      # Przykłady danych klientów
      │   │   └── product_info_*.md         # Dokumentacja produktów
      │   ├── Dockerfile                    # Konfiguracja kontenera
      │   └── requirements.txt              # Zależności Pythona
      │
      ├── 🔧 Automatyzacja i skrypty (scripts/)
      │   ├── postdeploy.sh/.ps1           # Ustawienia po wdrożeniu
      │   ├── setup_credential.sh/.ps1     # Konfiguracja poświadczeń
      │   ├── validate_env_vars.sh/.ps1    # Walidacja środowiska
      │   └── resolve_model_quota.sh/.ps1  # Zarządzanie limitami modeli
      │
      ├── 🧪 Testy i ocena jakości
      │   ├── tests/                        # Testy jednostkowe i integracyjne
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Framework oceny agentów
      │   │   ├── evaluate.py               # Uruchamianie oceny
      │   │   ├── eval-queries.json         # Zapytania testowe
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Plac zabaw developerski
      │   │   ├── 1-quickstart.py           # Przykłady startowe
      │   │   └── aad-interactive-chat.py   # Przykłady uwierzytelniania
      │   └── airedteaming/                 # Ocena bezpieczeństwa AI
      │       └── ai_redteaming.py          # Testy red teamu
      │
      ├── 📚 Dokumentacja (docs/)
      │   ├── deployment.md                 # Przewodnik wdrożeniowy
      │   ├── local_development.md          # Instrukcje ustawienia lokalnego
      │   ├── troubleshooting.md            # Typowe problemy i rozwiązania
      │   ├── azure_account_setup.md        # Wymagania wstępne Azure
      │   └── images/                       # Zasoby dokumentacji
      │
      └── 📄 Metadane projektu
         ├── README.md                     # Przegląd projektu
         ├── CODE_OF_CONDUCT.md           # Zasady społeczności
         ├── CONTRIBUTING.md              # Przewodnik po wkładach
         ├── LICENSE                      # Warunki licencji
         └── next-steps.md                # Wskazówki po wdrożeniu
      ```

### 3.1. Główna architektura aplikacji

Ten szablon stosuje wzorzec **aplikacji webowej full-stack** z:

- **Backend**: Python FastAPI z integracją Azure AI
- **Frontend**: TypeScript/React z systemem budowy Vite
- **Infrastruktura**: szablony Azure Bicep dla zasobów cloudowych
- **Konteneryzacja**: Docker dla spójnego wdrożenia

### 3.2 Infra jako kod (bicep)

Warstwa infrastruktury używa modularnych szablonów **Azure Bicep**:

   - **`main.bicep`**: Orkiestruje wszystkie zasoby Azure
   - **moduły `core/`**: Wielokrotnego użytku komponenty dla różnych usług
      - Usługi AI (Microsoft Foundry Models, AI Search)
      - Hosting kontenerów (Azure Container Apps)
      - Monitorowanie (Application Insights, Log Analytics)
      - Bezpieczeństwo (Key Vault, Managed Identity)

### 3.3 Kod aplikacji (`src/`)

**Backend API (`src/api/`)**:

- REST API oparte na FastAPI
- Integracja agentów Foundry
- Zarządzanie indeksami wyszukiwania dla pobierania wiedzy
- Możliwości przesyłania i przetwarzania plików

**Frontend (`src/frontend/`)**:

- Nowoczesne SPA React/TypeScript
- Vite do szybkiego rozwoju i zoptymalizowanych buildów
- Interfejs czatu dla interakcji z agentem

**Baza wiedzy (`src/files/`)**:

- Przykładowe dane klientów i produktów
- Pokazuje pobieranie wiedzy oparte na plikach
- Przykłady w formatach JSON i Markdown

### 3.4 DevOps i automatyzacja

**Skrypty (`scripts/`)**:

- Skrypty PowerShell i Bash działające na wielu platformach
- Walidacja i konfiguracja środowiska
- Konfiguracja po wdrożeniu
- Zarządzanie limitami modeli

**Integracja Azure Developer CLI**:

- Konfiguracja `azure.yaml` dla workflow `azd`
- Automatyczne tworzenie i wdrożenie zasobów
- Zarządzanie zmiennymi środowiskowymi

### 3.5 Testowanie i zapewnianie jakości

**Framework oceny (`evals/`)**:

- Ocena wydajności agentów
- Testowanie jakości zapytań i odpowiedzi
- Automatyczna rura oceny

**Bezpieczeństwo AI (`airedteaming/`)**:

- Testy red team dla bezpieczeństwa AI
- Skanowanie podatności bezpieczeństwa
- Praktyki odpowiedzialnego AI

---

## 4. Gratulacje 🏆

Skutecznie użyłeś GitHub Copilot Chat z serwerami MCP, aby poznać struktury repozytorium.

- [X] Aktywowano GitHub Copilot dla Azure
- [X] Zrozumiano architekturę aplikacji
- [X] Poznano strukturę szablonu AZD

To daje ci obraz zasobów _infrastruktury jako kodu_ dla tego szablonu. Następnie przyjrzymy się plikowi konfiguracyjnemu dla AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Dokument ten został przetłumaczony przy użyciu usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dążymy do dokładności, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być traktowany jako źródło autorytatywne. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia dokonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->