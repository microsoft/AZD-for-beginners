# Rozdział 8: Wzorce produkcyjne i korporacyjne

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 2-3 godziny | **⭐ Złożoność**: Zaawansowany

---

## Przegląd

Ten rozdział obejmuje wzorce wdrożeń gotowych dla przedsiębiorstw, wzmacnianie bezpieczeństwa, monitorowanie oraz optymalizację kosztów dla produkcyjnych obciążeń AI.

## Cele nauki

Po ukończeniu tego rozdziału będziesz potrafił:
- Wdrażać odporne aplikacje w wielu regionach
- Wdrażać wzorce bezpieczeństwa dla przedsiębiorstw
- Konfigurować kompleksowe monitorowanie
- Optymalizować koszty na dużą skalę
- Skonfigurować potoki CI/CD z AZD

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Praktyki AI w produkcji](production-ai-practices.md) | Wzorce wdrożeń dla przedsiębiorstw | 90 min |

---

## 🚀 Lista kontrolna produkcji

- [ ] Wdrażanie wieloregionowe dla odporności
- [ ] Zarządzana tożsamość do uwierzytelniania (bez kluczy)
- [ ] Application Insights do monitorowania
- [ ] Skonfigurowane budżety kosztów i alerty
- [ ] Włączone skanowanie bezpieczeństwa
- [ ] Integracja potoków CI/CD
- [ ] Plan odtwarzania po awarii

---

## 🏗️ Wzorce architektoniczne

### Wzorzec 1: Mikroserwisowe AI

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   API Gateway   │───▶│   AI Service    │───▶│   Azure OpenAI  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                      │
         ▼                      ▼
┌─────────────────┐    ┌─────────────────┐
│   Auth Service  │    │   Data Store    │
└─────────────────┘    └─────────────────┘
```

### Wzorzec 2: AI sterowane zdarzeniami

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Event Grid    │───▶│  Functions      │───▶│   AI Pipeline   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 🔐 Najlepsze praktyki bezpieczeństwa

```bicep
// Use managed identity
identity: {
  type: 'SystemAssigned'
}

// Private endpoints for AI services
properties: {
  publicNetworkAccess: 'Disabled'
  networkAcls: {
    defaultAction: 'Deny'
  }
}
```

---

## 💰 Optymalizacja kosztów

| Strategia | Oszczędności |
|----------|---------|
| Skalowanie do zera (Container Apps) | 60-80% |
| Użycie warstw konsumpcyjnych dla środowiska deweloperskiego | 50-70% |
| Skalowanie według harmonogramu | 30-50% |
| Zarezerwowana pojemność | 20-40% |

```bash
# Ustaw alerty budżetowe
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Konfiguracja monitoringu

```bash
# Strumieniuj logi
azd monitor --logs

# Sprawdź Application Insights
azd monitor

# Wyświetl metryki
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Nawigacja

| Kierunek | Rozdział |
|-----------|---------|
| **Poprzedni** | [Rozdział 7: Rozwiązywanie problemów](../chapter-07-troubleshooting/README.md) |
| **Kurs ukończony** | [Strona główna kursu](../../README.md) |

---

## 📖 Powiązane zasoby

- [Przewodnik po agentach AI](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Rozwiązania wieloagentowe](../chapter-05-multi-agent/README.md)
- [Przykład mikroserwisów](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony przy użyciu usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy starań, aby tłumaczenie było precyzyjne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym należy traktować jako źródło wiążące. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->