# Rozdział 2: Rozwój z podejściem AI-First

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 1-2 godziny | **⭐ Poziom**: Średniozaawansowany

---

## Przegląd

Ten rozdział koncentruje się na wdrażaniu aplikacji zasilanych sztuczną inteligencją przy użyciu Azure Developer CLI i usług Microsoft Foundry. Od prostych aplikacji czatu AI po inteligentnych agentów z narzędziami.

> **Uwaga dotycząca walidacji (2026-07-13):** Przepływ poleceń i wskazówki dotyczące rozszerzeń w tym rozdziale zostały zweryfikowane pod kątem `azd` `1.27.1` oraz obecnego podglądowego wydania rozszerzenia AI agent `azure.ai.agents` `1.0.0-beta.5`. Jeśli używasz starszej wersji AZD, najpierw zaktualizuj, a następnie kontynuuj ćwiczenia.

## Cele nauki

Po ukończeniu tego rozdziału będziesz potrafił:
- Wdrażać aplikacje AI za pomocą gotowych szablonów AZD
- Zrozumieć integrację Microsoft Foundry z AZD
- Konfigurować i dostosowywać agentów AI z narzędziami
- Wdrażać aplikacje RAG (Retrieval-Augmented Generation)

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Integracja Microsoft Foundry](microsoft-foundry-integration.md) | Połączenie AZD z usługami Foundry | 30 min |
| 2 | [Przewodnik po agentach AI](agents.md) | Wdrażanie inteligentnych agentów z narzędziami | 45 min |
| 3 | [Wdrażanie modelu AI](ai-model-deployment.md) | Wdrażanie i konfigurowanie modeli AI | 30 min |
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
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Czat RAG z cytowaniami | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agent AI z narzędziami | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Podstawowy czat AI | OpenAI + Container Apps |

---

## 💰 Świadomość kosztów

| Środowisko | Szacowany miesięczny koszt |
|-------------|----------------------|
| Development | 80-150 $ |
| Staging | 150-300 $ |
| Produkcja | 300-3500+ $ |

**Wskazówka:** Uruchom `azd down` po testach, aby uniknąć opłat.

---

## 🔗 Nawigacja

| Kierunek | Rozdział |
|-----------|---------|
| **Poprzedni** | [Rozdział 1: Podstawy](../chapter-01-foundation/README.md) |
| **Następny** | [Rozdział 3: Konfiguracja](../chapter-03-configuration/README.md) |
| **Przejdź do** | [Rozdział 8: Wzorce produkcyjne](../chapter-08-production/README.md) |

---

## 📖 Powiązane materiały

- [Rozwiązywanie problemów z AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Praktyki produkcyjnego AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->