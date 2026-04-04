# 3. Deconstruct a Template

!!! tip "NA KONIEC TEGO MODUŁU BĘDZIESZ POTRAFIŁ"

    - [ ] Aktywować GitHub Copilot z serwerami MCP do pomocy przy Azure
    - [ ] Zrozumieć strukturę folderów i komponenty szablonu AZD
    - [ ] Poznać wzorce organizacji infrastruktury jako kodu (Bicep)
    - [ ] **Laboratorium 3:** Użyć GitHub Copilot, aby zbadać i zrozumieć architekturę repozytorium 

---


Dzięki szablonom AZD i Azure Developer CLI (`azd`) możemy szybko rozpocząć naszą podróż rozwoju AI, korzystając ze standardowych repozytoriów, które dostarczają przykładowy kod, pliki infrastruktury i konfiguracji - w formie gotowego do wdrożenia projektu _startowego_.

**Ale teraz musimy zrozumieć strukturę projektu i bazę kodu – oraz móc dostosować szablon AZD – bez żadnego wcześniejszego doświadczenia ani wiedzy o AZD!**

---

## 1. Aktywuj GitHub Copilot

### 1.1 Zainstaluj GitHub Copilot Chat

Czas poznać [GitHub Copilot z trybem agenta](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Teraz możemy używać naturalnego języka, aby opisać nasze zadanie na wysokim poziomie i otrzymać pomoc w jego realizacji. Na to laboratorium użyjemy [planu darmowego Copilota](https://github.com/github-copilot/signup), który ma miesięczny limit na wykonania i interakcje w czacie.

Rozszerzenie można zainstalować z marketplace, a często jest ono już dostępne w Codespaces lub środowiskach dev container. _Kliknij `Open Chat` z rozwijanej listy ikony Copilot – i wpisz zapytanie np. `What can you do?`_ – może pojawić się monit o zalogowanie. **GitHub Copilot Chat jest gotowy**.

### 1.2. Zainstaluj serwery MCP

Aby tryb agenta działał skutecznie, potrzebuje dostępu do odpowiednich narzędzi, które pomogą mu pobierać wiedzę lub podejmować działania. Tutaj przydają się serwery MCP. Skonfigurujemy następujące serwery:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Aby je aktywować:

1. Utwórz plik o nazwie `.vscode/mcp.json`, jeśli jeszcze nie istnieje
1. Wklej do tego pliku poniższe dane – i uruchom serwery!
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

??? warning "Możesz dostać błąd, że `npx` nie jest zainstalowany (kliknij, aby rozwinąć rozwiązanie)"

      Aby to naprawić, otwórz plik `.devcontainer/devcontainer.json` i dodaj tę linię do sekcji features. Następnie odbuduj kontener. Powinieneś mieć zainstalowane `npx`.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Przetestuj GitHub Copilot Chat

**Najpierw użyj polecenia `azd auth login`, aby zalogować się do Azure z poziomu terminala VS Code. Użyj także `az login` jeśli zamierzasz wykonywać polecenia Azure CLI bezpośrednio.**

Teraz powinieneś mieć możliwość zapytania o status subskrypcji Azure i zadawania pytań o wdrożone zasoby lub konfigurację. Wypróbuj te zapytania:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Możesz również pytać o dokumentację Azure i otrzymywać odpowiedzi oparte na serwerze Microsoft Docs MCP. Wypróbuj te zapytania:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Lub możesz prosić o fragmenty kodu do wykonania zadania. Wypróbuj to zapytanie:

1. `Give me a Python code example that uses AAD for an interactive chat client`

W trybie `Ask` dostaniesz kod, który możesz skopiować i wypróbować. W trybie `Agent` może to pójść dalej i utworzyć odpowiednie zasoby – włączając skrypty konfiguracji i dokumentację – aby pomóc w wykonaniu zadania.

**Jesteś teraz wyposażony, aby zacząć eksplorować repozytorium ze szablonem**

---

## 2. Deconstruct Architecture

??? prompt "PYTANIE: Wyjaśnij architekturę aplikacji na obrazie docs/images/architecture.png w 1 akapicie"

      Ta aplikacja to oparta na AI aplikacja czatu zbudowana na platformie Azure, która demonstruje nowoczesną architekturę opartą na agentach. Rozwiązanie koncentruje się wokół Azure Container App, które hostuje główny kod aplikacji, przetwarza dane wejściowe użytkownika i generuje inteligentne odpowiedzi za pomocą agenta AI.
      
      Architektura wykorzystuje Microsoft Foundry Project jako bazę możliwości AI, łącząc się z usługami Azure AI, które dostarczają modele językowe (takie jak gpt-4.1-mini) i funkcje agenta.
      
      Interakcje użytkownika przechodzą przez front-end oparty na React do backendu FastAPI, który komunikuje się z usługą agenta AI, generując kontekstowe odpowiedzi.
      
      System zawiera możliwości pobierania wiedzy poprzez wyszukiwanie plików lub usługę Azure AI Search, umożliwiając agentowi dostęp i cytowanie informacji z przesłanych dokumentów.
      
      Dla doskonałości operacyjnej architektura obejmuje kompleksowy monitoring za pomocą Application Insights i Log Analytics Workspace do śledzenia, logowania i optymalizacji wydajności.
      
      Azure Storage zapewnia przechowywanie blobów dla danych aplikacji i przesyłanych plików, podczas gdy Managed Identity zapewnia bezpieczny dostęp pomiędzy zasobami Azure bez przechowywania poświadczeń.
      
      Całe rozwiązanie jest zaprojektowane pod kątem skalowalności i utrzymania, z konteneryzowaną aplikacją automatycznie skalującą się w zależności od zapotrzebowania przy jednoczesnym zapewnieniu wbudowanego bezpieczeństwa, monitoringu i możliwości CI/CD poprzez ekosystem zarządzanych usług Azure.

![Architecture](../../../../../translated_images/pl/architecture.48d94861e6e6cdc0.webp)

---

## 3. Struktura repozytorium

!!! prompt "PYTANIE: Wyjaśnij strukturę folderów szablonu. Zacznij od wizualnego diagramu hierarchicznego."

??? info "ODPOWIEDŹ: Wizualny diagram hierarchiczny"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfiguracja i ustawienia
      │   ├── azure.yaml                    # Konfiguracja Azure Developer CLI
      │   ├── docker-compose.yaml           # Kontenery dla lokalnego developmentu
      │   ├── pyproject.toml                # Konfiguracja projektu Python
      │   ├── requirements-dev.txt          # Zależności developerskie
      │   └── .devcontainer/                # Konfiguracja dev container VS Code
      │
      ├── 🏗️ Infrastruktura (infra/)
      │   ├── main.bicep                    # Główny szablon infrastruktury
      │   ├── api.bicep                     # Zasoby specyficzne dla API
      │   ├── main.parameters.json          # Parametry infrastruktury
      │   └── core/                         # Modularne komponenty infrastruktury
      │       ├── ai/                       # Konfiguracje usług AI
      │       ├── host/                     # Infrastruktura hostingowa
      │       ├── monitor/                  # Monitoring i logowanie
      │       ├── search/                   # Konfiguracja Azure AI Search
      │       ├── security/                 # Bezpieczeństwo i tożsamość
      │       └── storage/                  # Konfiguracje kont magazynu
      │
      ├── 💻 Źródła aplikacji (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # Wejście aplikacji FastAPI
      │   │   ├── routes.py                 # Definicje tras API
      │   │   ├── search_index_manager.py   # Funkcje wyszukiwania
      │   │   ├── data/                     # Obsługa danych API
      │   │   ├── static/                   # Statyczne zasoby web
      │   │   └── templates/                # Szablony HTML
      │   ├── frontend/                     # Frontend React/TypeScript
      │   │   ├── package.json              # Zależności Node.js
      │   │   ├── vite.config.ts            # Konfiguracja budowania Vite
      │   │   └── src/                      # Kod źródłowy frontendu
      │   ├── data/                         # Przykładowe pliki danych
      │   │   └── embeddings.csv            # Wstępnie obliczone osadzenia
      │   ├── files/                        # Pliki bazy wiedzy
      │   │   ├── customer_info_*.json      # Przykłady danych klientów
      │   │   └── product_info_*.md         # Dokumentacja produktu
      │   ├── Dockerfile                    # Konfiguracja kontenera
      │   └── requirements.txt              # Zależności Pythona
      │
      ├── 🔧 Automatyzacja i skrypty (scripts/)
      │   ├── postdeploy.sh/.ps1           # Skrypty po wdrożeniu
      │   ├── setup_credential.sh/.ps1     # Konfiguracja poświadczeń
      │   ├── validate_env_vars.sh/.ps1    # Walidacja zmiennych środowiskowych
      │   └── resolve_model_quota.sh/.ps1  # Zarządzanie limitami modeli
      │
      ├── 🧪 Testowanie i ewaluacja
      │   ├── tests/                        # Testy jednostkowe i integracyjne
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Framework ewaluacji agenta
      │   │   ├── evaluate.py               # Uruchamiacz ewaluacji
      │   │   ├── eval-queries.json         # Zapytania testowe
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Plac zabaw developerski
      │   │   ├── 1-quickstart.py           # Przykłady szybkiego startu
      │   │   └── aad-interactive-chat.py   # Przykłady uwierzytelniania
      │   └── airedteaming/                 # Ewaluacja bezpieczeństwa AI
      │       └── ai_redteaming.py          # Testy Red Team
      │
      ├── 📚 Dokumentacja (docs/)
      │   ├── deployment.md                 # Przewodnik wdrożeniowy
      │   ├── local_development.md          # Instrukcje lokalnego setupu
      │   ├── troubleshooting.md            # Typowe problemy i rozwiązania
      │   ├── azure_account_setup.md        # Wymagania wstępne Azure
      │   └── images/                       # Zasoby dokumentacji
      │
      └── 📄 Metadane projektu
         ├── README.md                     # Przegląd projektu
         ├── CODE_OF_CONDUCT.md           # Zasady społeczności
         ├── CONTRIBUTING.md              # Przewodnik współpracy
         ├── LICENSE                      # Warunki licencji
         └── next-steps.md                # Wskazówki po wdrożeniu
      ```

### 3.1. Podstawowa architektura aplikacji

Ten szablon podąża za wzorcem **pełnostackowej aplikacji webowej** z:

- **Backend**: Python FastAPI z integracją Azure AI
- **Frontend**: TypeScript/React z systemem budowania Vite
- **Infrastruktura**: szablony Azure Bicep dla zasobów chmurowych
- **Konteneryzacja**: Docker dla spójnego wdrożenia

### 3.2 Infra jako kod (bicep)

Warstwa infrastruktury korzysta z modularnych szablonów **Azure Bicep**:

   - **`main.bicep`**: Orkiestruje wszystkie zasoby Azure
   - **Moduły w `core/`**: wielokrotnego użytku komponenty dla różnych usług
      - Usługi AI (modele Microsoft Foundry, AI Search)
      - Hosting kontenerów (Azure Container Apps)
      - Monitoring (Application Insights, Log Analytics)
      - Bezpieczeństwo (Key Vault, Managed Identity)

### 3.3 Źródła aplikacji (`src/`)

**Backend API (`src/api/`)**:

- REST API oparte na FastAPI
- Integracja agentów Foundry
- Zarządzanie indeksami wyszukiwania dla pobierania wiedzy
- Możliwości przesyłania i przetwarzania plików

**Frontend (`src/frontend/`)**:

- Nowoczesna aplikacja SPA React/TypeScript
- Vite do szybkiego developmentu i zoptymalizowanych buildów
- Interfejs czatu do interakcji z agentami

**Baza wiedzy (`src/files/`)**:

- Przykładowe dane klienta i produktu
- Demonstruje pobieranie wiedzy oparte na plikach
- Przykłady formatów JSON i Markdown


### 3.4 DevOps i automatyzacja

**Skrypty (`scripts/`)**:

- Skrypty PowerShell i Bash międzyplatformowe
- Walidacja i konfiguracja środowiska
- Konfiguracja po wdrożeniu
- Zarządzanie limitami modeli

**Integracja Azure Developer CLI**:

- Konfiguracja `azure.yaml` dla workflow `azd`
- Automatyczne provisionowanie i wdrożenie
- Zarządzanie zmiennymi środowiskowymi

### 3.5 Testowanie i zapewnienie jakości

**Framework ewaluacji (`evals/`)**:

- Ewaluacja wydajności agenta
- Testy jakości odpowiedzi na zapytania
- Zautomatyzowany pipeline oceny

**Bezpieczeństwo AI (`airedteaming/`)**:

- Testowanie Red Team pod kątem bezpieczeństwa AI
- Skanowanie podatności bezpieczeństwa
- Odpowiedzialne praktyki AI

---

## 4. Gratulacje 🏆

Skutecznie użyłeś GitHub Copilot Chat z serwerami MCP, aby zbadać repozytorium.

- [X] Aktywowałeś GitHub Copilot dla Azure
- [X] Zrozumiałeś architekturę aplikacji
- [X] Poznałeś strukturę szablonu AZD

Daje ci to obraz zasobów _infrastruktury jako kodu_ dla tego szablonu. Następnie przyjrzymy się plikowi konfiguracyjnemu AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą automatycznej usługi tłumaczeniowej AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mimo że dążymy do dokładności, prosimy pamiętać, że tłumaczenia automatyczne mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym powinien być uznawany za ostateczne i autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->