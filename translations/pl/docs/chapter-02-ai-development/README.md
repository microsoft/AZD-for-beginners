# Rozdział 2: Rozwój z Podejściem AI-First

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 1-2 godziny | **⭐ Poziom trudności**: Średniozaawansowany

---

## Przegląd

Ten rozdział skupia się na wdrażaniu aplikacji zasilanych AI za pomocą Azure Developer CLI i usług Microsoft Foundry. Od prostych aplikacji czatowych AI po inteligentnych agentów z narzędziami.

> **Uwaga dotycząca weryfikacji (2026-03-25):** Przepływ poleceń i wskazówki dotyczące rozszerzeń w tym rozdziale zostały zweryfikowane z wersją `azd` `1.23.12` oraz bieżącą wersją podglądową rozszerzenia agenta AI `azure.ai.agents` `0.1.18-preview`. Jeśli korzystasz ze starszej wersji AZD, najpierw zaktualizuj, a następnie kontynuuj ćwiczenia.

## Cele nauki

Po ukończeniu tego rozdziału będziesz potrafił:
- Wdrażać aplikacje AI używając gotowych szablonów AZD
- Zrozumieć integrację Microsoft Foundry z AZD
- Konfigurować i dostosowywać agentów AI z narzędziami
- Wdrażać aplikacje RAG (Retrieval-Augmented Generation)

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Integracja Microsoft Foundry](microsoft-foundry-integration.md) | Połączenie AZD z usługami Foundry | 30 min |
| 2 | [Przewodnik po agentach AI](agents.md) | Wdrażanie inteligentnych agentów z narzędziami | 45 min |
| 3 | [Wdrażanie modeli AI](ai-model-deployment.md) | Wdrażanie i konfiguracja modeli AI | 30 min |
| 4 | [Laboratorium warsztatowe AI](ai-workshop-lab.md) | Praktycznie: Przygotuj swoje rozwiązanie AI do AZD | 60 min |

---

## 🚀 Szybki start

```bash
# Opcja 1: Aplikacja czatu RAG
azd init --template azure-search-openai-demo
azd up

# Opcja 2: Agenci AI
azd init --template get-started-with-ai-agents
azd up

# Opcja 3: Szybka aplikacja czatu
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Polecane szablony AI

| Szablon | Opis | Usługi |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Czatuj RAG z cytowaniami | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agent AI z narzędziami | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Podstawowy czat AI | OpenAI + Container Apps |

---

## 💰 Świadomość kosztów

| Środowisko | Szacowany miesięczny koszt |
|-------------|----------------------|
| Development | 80-150 USD |
| Staging | 150-300 USD |
| Produkcja | 300-3 500+ USD |

**Wskazówka:** Po testach uruchom `azd down`, aby uniknąć opłat.

---

## 🔗 Nawigacja

| Kierunek | Rozdział |
|-----------|---------|
| **Poprzedni** | [Rozdział 1: Fundamenty](../chapter-01-foundation/README.md) |
| **Następny** | [Rozdział 3: Konfiguracja](../chapter-03-configuration/README.md) |
| **Pomiń do** | [Rozdział 8: Wzorce produkcyjne](../chapter-08-production/README.md) |

---

## 📖 Powiązane zasoby

- [Rozwiązywanie problemów z AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Praktyki AI w produkcji](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą automatycznej usługi tłumaczeniowej [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dążymy do dokładności, prosimy mieć na uwadze, że tłumaczenia automatyczne mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym należy uznać za źródło nadrzędne. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->