# Rozdział 5: Rozwiązania AI wieloagentowe

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 2-3 hours | **⭐ Złożoność**: Zaawansowany

---

## Przegląd

Ten rozdział obejmuje zaawansowane wzorce architektury wieloagentowej, orkiestrację agentów oraz gotowe do produkcji wdrożenia AI dla złożonych scenariuszy.

## Cele nauki

Po ukończeniu tego rozdziału będziesz:
- Rozumieć wzorce architektury wieloagentowej
- Wdrażać skoordynowane systemy agentów AI
- Implementować komunikację agent–agent
- Budować rozwiązania wieloagentowe gotowe do produkcji

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Rozwiązanie wieloagentowe dla handlu detalicznego](../../examples/retail-scenario.md) | Pełne omówienie implementacji | 90 min |
| 2 | [Wzorce koordynacji](../chapter-06-pre-deployment/coordination-patterns.md) | Strategie orkiestracji agentów | 30 min |
| 3 | [Wdrożenie szablonu ARM](../../examples/retail-multiagent-arm-template/README.md) | Wdrożenie jednym kliknięciem | 30 min |

---

## 🚀 Szybki start

```bash
# Wdróż wieloagentowe rozwiązanie dla handlu detalicznego
cd examples/retail-multiagent-arm-template
./deploy.sh

# Lub użyj szablonu bezpośrednio
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 Architektura wieloagentowa

```
┌──────────────────────────────────────────────────────────────┐
│                    Orchestrator Agent                         │
│              (Routes requests, manages workflow)              │
└────────────────────┬─────────────────┬───────────────────────┘
                     │                 │
         ┌───────────▼───────┐ ┌───────▼───────────┐
         │  Customer Agent   │ │  Inventory Agent  │
         │  (User queries,   │ │  (Stock levels,   │
         │   preferences)    │ │   orders)         │
         └───────────────────┘ └───────────────────┘
```

---

## 🎯 Wyróżnione rozwiązanie: Rozwiązanie wieloagentowe dla handlu detalicznego

Rozwiązanie [wieloagentowe dla handlu detalicznego](../../examples/retail-scenario.md) demonstruje:

- **Agent klienta**: Obsługuje interakcje z użytkownikiem i preferencje
- **Agent magazynowy**: Zarządza stanami magazynowymi i przetwarzaniem zamówień
- **Orkiestrator**: Koordynuje działanie agentów
- **Wspólna pamięć**: Zarządzanie kontekstem między agentami

### Używane usługi

| Usługa | Zastosowanie |
|---------|---------|
| Azure OpenAI | Rozumienie języka |
| Azure AI Search | Katalog produktów |
| Cosmos DB | Stan i pamięć agenta |
| Container Apps | Hostowanie agentów |
| Application Insights | Monitorowanie |

---

## 🔗 Nawigacja

| Kierunek | Rozdział |
|-----------|---------|
| **Poprzedni** | [Rozdział 4: Infrastruktura](../chapter-04-infrastructure/README.md) |
| **Następny** | [Rozdział 6: Przygotowanie do wdrożenia](../chapter-06-pre-deployment/README.md) |

---

## 📖 Powiązane zasoby

- [Przewodnik po agentach AI](../chapter-02-ai-development/agents.md)
- [Praktyki AI w produkcji](../chapter-08-production/production-ai-practices.md)
- [Rozwiązywanie problemów z AI](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Zastrzeżenie:
Niniejszy dokument został przetłumaczony przy użyciu usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dążymy do jak największej dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego języku źródłowym należy uznać za źródło wiążące. W przypadku informacji o krytycznym znaczeniu zaleca się skorzystanie z usług profesjonalnego tłumacza. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->