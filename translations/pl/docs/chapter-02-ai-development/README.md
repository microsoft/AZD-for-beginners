# Rozdział 2: Rozwój z priorytetem AI

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Czas trwania**: 1-2 godziny | **⭐ Złożoność**: Średniozaawansowany

---

## Przegląd

Ten rozdział koncentruje się na wdrażaniu aplikacji zasilanych AI przy użyciu Azure Developer CLI i usług Microsoft Foundry. Od prostych aplikacji czatowych AI po inteligentne agenty z narzędziami.

## Cele nauki

Po ukończeniu tego rozdziału, będziesz:
- Wdrażać aplikacje AI korzystając z gotowych szablonów AZD
- Zrozumieć integrację Microsoft Foundry z AZD
- Konfigurować i dostosowywać agentów AI wraz z narzędziami
- Wdrażać aplikacje RAG (Retrieval-Augmented Generation)

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Połącz AZD z usługami Foundry | 30 min |
| 2 | [AI Agents Guide](agents.md) | Wdrażaj inteligentnych agentów z narzędziami | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Wdrażaj i konfiguruj modele AI | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Praktycznie: Przygotuj swoje rozwiązanie AI do AZD | 60 min |

---

## 🚀 Szybki start

```bash
# Opcja 1: Aplikacja czatu RAG
azd init --template azure-search-openai-demo
azd up

# Opcja 2: Agenci SI
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
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Czat RAG z cytatami | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agent AI z narzędziami | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Podstawowy czat AI | OpenAI + Container Apps |

---

## 💰 Świadomość kosztów

| Środowisko | Szacunkowy miesięczny koszt |
|-------------|----------------------|
| Środowisko deweloperskie | $80-150 |
| Testowe | $150-300 |
| Produkcja | $300-3,500+ |

**Wskazówka:** Uruchom `azd down` po testach, aby uniknąć opłat.

---

## 🔗 Nawigacja

| Direction | Chapter |
|-----------|---------|
| **Poprzedni** | [Rozdział 1: Podstawy](../chapter-01-foundation/README.md) |
| **Następny** | [Rozdział 3: Konfiguracja](../chapter-03-configuration/README.md) |
| **Przejdź do** | [Rozdział 8: Wzorce produkcyjne](../chapter-08-production/README.md) |

---

## 📖 Powiązane zasoby

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Praktyki AI w produkcji](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Zastrzeżenie:
Ten dokument został przetłumaczony przy użyciu usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mimo że dążymy do jak największej dokładności, prosimy pamiętać, że tłumaczenia automatyczne mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym należy uznać za wersję wiążącą. W przypadku informacji istotnych zalecamy skorzystanie z usług profesjonalnego tłumacza. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->