<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fc2d5d2f2f572c99876be92d82680e22",
  "translation_date": "2025-11-20T02:23:29+00:00",
  "source_file": "examples/azure-openai-chat/README.md",
  "language_code": "pl"
}
-->
# Aplikacja Chat Azure OpenAI

**Ścieżka nauki:** Średniozaawansowana ⭐⭐ | **Czas:** 35-45 minut | **Koszt:** $50-200/miesiąc

Kompletna aplikacja chatowa Azure OpenAI wdrożona za pomocą Azure Developer CLI (azd). Ten przykład pokazuje wdrożenie GPT-4, bezpieczny dostęp do API oraz prosty interfejs chatowy.

## 🎯 Czego się nauczysz

- Wdrożenie usługi Azure OpenAI z modelem GPT-4
- Zabezpieczenie kluczy API OpenAI za pomocą Key Vault
- Budowa prostego interfejsu chatowego w Pythonie
- Monitorowanie użycia tokenów i kosztów
- Implementacja limitów zapytań i obsługi błędów

## 📦 Co jest zawarte

✅ **Usługa Azure OpenAI** - Wdrożenie modelu GPT-4  
✅ **Aplikacja chatowa w Pythonie** - Prosty interfejs wiersza poleceń  
✅ **Integracja z Key Vault** - Bezpieczne przechowywanie kluczy API  
✅ **Szablony ARM** - Kompletny kod infrastruktury  
✅ **Monitorowanie kosztów** - Śledzenie użycia tokenów  
✅ **Limity zapytań** - Zapobieganie wyczerpaniu limitów  

## Architektura

```
┌─────────────────────────────────────────────┐
│   Python Chat Application (Local/Cloud)    │
│   - Command-line interface                 │
│   - Conversation history                   │
│   - Token usage tracking                   │
└──────────────────┬──────────────────────────┘
                   │ HTTPS (API Key)
                   ▼
┌─────────────────────────────────────────────┐
│   Azure OpenAI Service                      │
│   ┌───────────────────────────────────────┐ │
│   │   GPT-4 Model                         │ │
│   │   - 20K tokens/min capacity           │ │
│   │   - Multi-region failover (optional)  │ │
│   └───────────────────────────────────────┘ │
│                                             │
│   Managed Identity ───────────────────────┐ │
└────────────────────────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────┐
│   Azure Key Vault                           │
│   - OpenAI API Key (secret)                 │
│   - Endpoint URL (secret)                   │
└─────────────────────────────────────────────┘
```

## Wymagania wstępne

### Wymagane

- **Azure Developer CLI (azd)** - [Przewodnik instalacji](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Subskrypcja Azure** z dostępem do OpenAI - [Złóż wniosek o dostęp](https://aka.ms/oai/access)
- **Python 3.9+** - [Pobierz Python](https://www.python.org/downloads/)

### Weryfikacja wymagań wstępnych

```bash
# Sprawdź wersję azd (wymagana 1.5.0 lub wyższa)
azd version

# Zweryfikuj logowanie do Azure
azd auth login

# Sprawdź wersję Pythona
python --version  # lub python3 --version

# Zweryfikuj dostęp do OpenAI (sprawdź w Azure Portal)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Ważne:** Azure OpenAI wymaga zatwierdzenia aplikacji. Jeśli jeszcze nie złożyłeś wniosku, odwiedź [aka.ms/oai/access](https://aka.ms/oai/access). Zatwierdzenie zazwyczaj trwa 1-2 dni robocze.

## ⏱️ Harmonogram wdrożenia

| Faza | Czas trwania | Co się dzieje |
|------|--------------|---------------|
| Weryfikacja wymagań wstępnych | 2-3 minuty | Sprawdzenie dostępności limitów OpenAI |
| Wdrożenie infrastruktury | 8-12 minut | Tworzenie OpenAI, Key Vault, wdrożenie modelu |
| Konfiguracja aplikacji | 2-3 minuty | Ustawienie środowiska i zależności |
| **Razem** | **12-18 minut** | Gotowe do rozmowy z GPT-4 |

**Uwaga:** Pierwsze wdrożenie OpenAI może potrwać dłużej z powodu provisioning modelu.

## Szybki start

```bash
# Przejdź do przykładu
cd examples/azure-openai-chat

# Zainicjalizuj środowisko
azd env new myopenai

# Wdróż wszystko (infrastrukturę + konfigurację)
azd up
# Zostaniesz poproszony o:
# 1. Wybranie subskrypcji Azure
# 2. Wybranie lokalizacji z dostępnością OpenAI (np. eastus, eastus2, westus)
# 3. Poczekanie 12-18 minut na wdrożenie

# Zainstaluj zależności Pythona
pip install -r requirements.txt

# Rozpocznij rozmowę!
python chat.py
```

**Oczekiwany wynik:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Weryfikacja wdrożenia

### Krok 1: Sprawdź zasoby Azure

```bash
# Wyświetl wdrożone zasoby
azd show

# Oczekiwany wynik pokazuje:
# - Usługa OpenAI: (nazwa zasobu)
# - Key Vault: (nazwa zasobu)
# - Wdrożenie: gpt-4
# - Lokalizacja: eastus (lub wybrany region)
```

### Krok 2: Przetestuj API OpenAI

```bash
# Pobierz punkt końcowy OpenAI i klucz
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Przetestuj wywołanie API
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Oczekiwana odpowiedź:**
```json
{
  "choices": [
    {
      "message": {
        "role": "assistant",
        "content": "Hello! How can I assist you today?"
      }
    }
  ],
  "usage": {
    "prompt_tokens": 8,
    "completion_tokens": 9,
    "total_tokens": 17
  }
}
```

### Krok 3: Zweryfikuj dostęp do Key Vault

```bash
# Wyświetl sekrety w Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Oczekiwane sekrety:**
- `openai-api-key`
- `openai-endpoint`

**Kryteria sukcesu:**
- ✅ Usługa OpenAI wdrożona z GPT-4
- ✅ Wywołanie API zwraca poprawne wyniki
- ✅ Sekrety przechowywane w Key Vault
- ✅ Śledzenie użycia tokenów działa

## Struktura projektu

```
azure-openai-chat/
├── README.md                   ✅ This guide
├── azure.yaml                  ✅ AZD configuration
├── infra/                      ✅ Infrastructure as Code
│   ├── main.bicep             ✅ Main Bicep template
│   ├── main.parameters.json   ✅ Parameters
│   └── openai.bicep           ✅ OpenAI resource definition
├── src/                        ✅ Application code
│   ├── chat.py                ✅ Chat interface
│   ├── config.py              ✅ Configuration loader
│   └── requirements.txt       ✅ Python dependencies
└── .gitignore                  ✅ Git ignore rules
```

## Funkcje aplikacji

### Interfejs chatowy (`chat.py`)

Aplikacja chatowa zawiera:

- **Historia rozmów** - Utrzymuje kontekst między wiadomościami
- **Liczenie tokenów** - Śledzi użycie i szacuje koszty
- **Obsługa błędów** - Łagodne radzenie sobie z limitami zapytań i błędami API
- **Szacowanie kosztów** - Obliczanie kosztów w czasie rzeczywistym dla każdej wiadomości
- **Obsługa strumieniowania** - Opcjonalne odpowiedzi strumieniowe

### Komendy

Podczas rozmowy możesz używać:
- `quit` lub `exit` - Zakończenie sesji
- `clear` - Wyczyść historię rozmów
- `tokens` - Pokaż całkowite użycie tokenów
- `cost` - Pokaż szacowany całkowity koszt

### Konfiguracja (`config.py`)

Ładuje konfigurację z zmiennych środowiskowych:
```python
AZURE_OPENAI_ENDPOINT  # Z Key Vault
AZURE_OPENAI_API_KEY   # Z Key Vault
AZURE_OPENAI_MODEL     # Domyślnie: gpt-4
AZURE_OPENAI_MAX_TOKENS # Domyślnie: 800
```

## Przykłady użycia

### Podstawowy chat

```bash
python chat.py
```

### Chat z niestandardowym modelem

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Chat ze strumieniowaniem

```bash
python chat.py --stream
```

### Przykładowa rozmowa

```
You: Explain Azure OpenAI Service in 3 sentences.
Assistant: Azure OpenAI Service is Microsoft Azure's cloud platform offering 
that provides access to OpenAI's powerful language models. It enables developers 
to integrate capabilities like GPT-4 into their applications with enterprise-grade 
security and compliance. The service includes features for content filtering, 
abuse monitoring, and responsible AI practices.

[Tokens used: 89 | Estimated cost: $0.0027]

You: What models are available?
Assistant: Azure OpenAI Service offers several model families including GPT-4 
(most capable), GPT-3.5-Turbo (faster and cost-effective), and Embeddings models 
for vector search. Each model has different capabilities, pricing, and token limits.

[Tokens used: 67 | Estimated cost: $0.0020]

Total session: 156 tokens | $0.0047
```

## Zarządzanie kosztami

### Ceny tokenów (GPT-4)

| Model | Wejście (za 1K tokenów) | Wyjście (za 1K tokenów) |
|-------|-------------------------|-------------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### Szacowane miesięczne koszty

Na podstawie wzorców użycia:

| Poziom użycia | Wiadomości/dzień | Tokeny/dzień | Miesięczny koszt |
|---------------|------------------|--------------|------------------|
| **Lekki** | 20 wiadomości | 3,000 tokenów | $3-5 |
| **Średni** | 100 wiadomości | 15,000 tokenów | $15-25 |
| **Duży** | 500 wiadomości | 75,000 tokenów | $75-125 |

**Podstawowy koszt infrastruktury:** $1-2/miesiąc (Key Vault + minimalna moc obliczeniowa)

### Wskazówki dotyczące optymalizacji kosztów

```bash
# 1. Użyj GPT-3.5-Turbo do prostszych zadań (20x tańszy)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Zmniejsz maksymalną liczbę tokenów dla krótszych odpowiedzi
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Monitoruj użycie tokenów
python chat.py --show-tokens

# 4. Ustaw alerty budżetowe
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Monitorowanie

### Wyświetl użycie tokenów

```bash
# W Azure Portal:
# Zasób OpenAI → Metryki → Wybierz "Transakcja Tokenów"

# Lub za pomocą Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Wyświetl logi API

```bash
# Strumień dzienników diagnostycznych
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Zapytania dzienników
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Rozwiązywanie problemów

### Problem: Błąd "Access Denied"

**Objawy:** 403 Forbidden podczas wywołania API

**Rozwiązania:**
```bash
# 1. Zweryfikuj, czy dostęp do OpenAI został zatwierdzony
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Sprawdź, czy klucz API jest poprawny
azd env get-value AZURE_OPENAI_API_KEY

# 3. Zweryfikuj format URL punktu końcowego
azd env get-value AZURE_OPENAI_ENDPOINT
# Powinno być: https://[name].openai.azure.com/
```

### Problem: Przekroczony limit zapytań

**Objawy:** 429 Too Many Requests

**Rozwiązania:**
```bash
# 1. Sprawdź bieżący limit
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Poproś o zwiększenie limitu (jeśli potrzebne)
# Przejdź do Azure Portal → Zasób OpenAI → Limity → Poproś o zwiększenie

# 3. Zaimplementuj logikę ponawiania (już w chat.py)
# Aplikacja automatycznie ponawia próby z wykładniczym opóźnieniem
```

### Problem: "Model Not Found"

**Objawy:** Błąd 404 dla wdrożenia

**Rozwiązania:**
```bash
# 1. Wymień dostępne wdrożenia
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Zweryfikuj nazwę modelu w środowisku
echo $AZURE_OPENAI_MODEL

# 3. Zaktualizuj do poprawnej nazwy wdrożenia
export AZURE_OPENAI_MODEL=gpt-4  # lub gpt-35-turbo
```

### Problem: Wysoka latencja

**Objawy:** Wolne czasy odpowiedzi (>5 sekund)

**Rozwiązania:**
```bash
# 1. Sprawdź opóźnienie regionalne
# Wdróż do regionu najbliższego użytkownikom

# 2. Zmniejsz max_tokens dla szybszych odpowiedzi
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Użyj strumieniowania dla lepszego UX
python chat.py --stream
```

## Najlepsze praktyki bezpieczeństwa

### 1. Zabezpiecz klucze API

```bash
# Nigdy nie zapisuj kluczy w systemie kontroli wersji
# Użyj Key Vault (już skonfigurowany)

# Regularnie rotuj klucze
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Implementacja filtrowania treści

```python
# Azure OpenAI zawiera wbudowane filtrowanie treści
# Skonfiguruj w Azure Portal:
# Zasób OpenAI → Filtry treści → Utwórz niestandardowy filtr

# Kategorie: Nienawiść, Seksualność, Przemoc, Samookaleczenie
# Poziomy: Niskie, Średnie, Wysokie filtrowanie
```

### 3. Użycie zarządzanej tożsamości (produkcja)

```bash
# Dla wdrożeń produkcyjnych używaj zarządzanej tożsamości
# zamiast kluczy API (wymaga hostowania aplikacji na Azure)

# Zaktualizuj infra/openai.bicep, aby zawierało:
# identity: { type: 'SystemAssigned' }
```

## Rozwój

### Uruchom lokalnie

```bash
# Zainstaluj zależności
pip install -r src/requirements.txt

# Ustaw zmienne środowiskowe
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# Uruchom aplikację
python src/chat.py
```

### Uruchom testy

```bash
# Zainstaluj zależności testowe
pip install pytest pytest-cov

# Uruchom testy
pytest tests/ -v

# Z pokryciem
pytest tests/ --cov=src --cov-report=html
```

### Aktualizacja wdrożenia modelu

```bash
# Wdrażaj różne wersje modelu
az cognitiveservices account deployment create \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-35-turbo \
  --model-name gpt-35-turbo \
  --model-version "0613" \
  --model-format OpenAI \
  --sku-capacity 20 \
  --sku-name "Standard"
```

## Czyszczenie

```bash
# Usuń wszystkie zasoby Azure
azd down --force --purge

# To usuwa:
# - Usługę OpenAI
# - Key Vault (z 90-dniowym miękkim usunięciem)
# - Grupę zasobów
# - Wszystkie wdrożenia i konfiguracje
```

## Kolejne kroki

### Rozszerz ten przykład

1. **Dodaj interfejs webowy** - Zbuduj frontend w React/Vue
   ```bash
   # Dodaj usługę frontendową do azure.yaml
   # Wdróż do Azure Static Web Apps
   ```

2. **Implementacja RAG** - Dodaj wyszukiwanie dokumentów z Azure AI Search
   ```python
   # Zintegruj Azure Cognitive Search
   # Prześlij dokumenty i utwórz indeks wektorowy
   ```

3. **Dodaj wywoływanie funkcji** - Włącz użycie narzędzi
   ```python
   # Zdefiniuj funkcje w chat.py
   # Pozwól GPT-4 wywoływać zewnętrzne API
   ```

4. **Obsługa wielu modeli** - Wdróż wiele modeli
   ```bash
   # Dodaj gpt-35-turbo, modele osadzania
   # Zaimplementuj logikę trasowania modelu
   ```

### Powiązane przykłady

- **[Retail Multi-Agent](../retail-scenario.md)** - Zaawansowana architektura multi-agentowa
- **[Aplikacja bazodanowa](../../../../examples/database-app)** - Dodaj trwałe przechowywanie danych
- **[Aplikacje kontenerowe](../../../../examples/container-app)** - Wdróż jako usługę kontenerową

### Zasoby edukacyjne

- 📚 [Kurs AZD dla początkujących](../../README.md) - Główna strona kursu
- 📚 [Dokumentacja Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/) - Oficjalne dokumenty
- 📚 [Referencja API OpenAI](https://platform.openai.com/docs/api-reference) - Szczegóły API
- 📚 [Odpowiedzialna AI](https://www.microsoft.com/ai/responsible-ai) - Najlepsze praktyki

## Dodatkowe zasoby

### Dokumentacja
- **[Usługa Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/)** - Kompletny przewodnik
- **[Modele GPT-4](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Możliwości modeli
- **[Filtrowanie treści](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Funkcje bezpieczeństwa
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referencja azd

### Samouczki
- **[Szybki start OpenAI](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Pierwsze wdrożenie
- **[Kompletacje chatowe](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Budowa aplikacji chatowych
- **[Wywoływanie funkcji](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Zaawansowane funkcje

### Narzędzia
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Webowy playground
- **[Przewodnik inżynierii promptów](https://platform.openai.com/docs/guides/prompt-engineering)** - Pisanie lepszych promptów
- **[Kalkulator tokenów](https://platform.openai.com/tokenizer)** - Szacowanie użycia tokenów

### Społeczność
- **[Discord Azure AI](https://discord.gg/azure)** - Pomoc od społeczności
- **[Dyskusje GitHub](https://github.com/Azure-Samples/openai/discussions)** - Forum Q&A
- **[Blog Azure](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Najnowsze aktualizacje

---

**🎉 Sukces!** Wdrożyłeś Azure OpenAI i zbudowałeś działającą aplikację chatową. Zacznij eksplorować możliwości GPT-4 i eksperymentować z różnymi promptami i przypadkami użycia.

**Pytania?** [Otwórz zgłoszenie](https://github.com/microsoft/AZD-for-beginners/issues) lub sprawdź [FAQ](../../resources/faq.md)

**Alert kosztów:** Pamiętaj, aby uruchomić `azd down` po zakończeniu testów, aby uniknąć dalszych opłat (~$50-100/miesiąc za aktywne użycie).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się zapewnić dokładność, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->