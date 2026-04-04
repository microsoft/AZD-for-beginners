# Rozdział 6: Planowanie i weryfikacja przed wdrożeniem

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 1 godzina | **⭐ Poziom trudności**: Średniozaawansowany

---

## Przegląd

Ten rozdział obejmuje kluczowe etapy planowania i weryfikacji przed wdrożeniem aplikacji. Naucz się unikać kosztownych błędów dzięki odpowiedniemu planowaniu pojemności, wyborowi SKU oraz kontrolom przed wdrożeniem.

> Zweryfikowano z użyciem `azd 1.23.12` w marcu 2026.

## Cele nauki

Po ukończeniu tego rozdziału będziesz potrafił:
- Wykonywać kontrole przed wdrożeniem
- Planować pojemność i szacować wymagania zasobów
- Wybierać odpowiednie SKU w celu optymalizacji kosztów
- Konfigurować Application Insights do monitorowania
- Zrozumieć wzorce koordynacji zespołów

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Kontrole przed wdrożeniem](preflight-checks.md) | Weryfikacja konfiguracji przed wdrożeniem | 15 min |
| 2 | [Planowanie pojemności](capacity-planning.md) | Szacowanie wymagań zasobów | 20 min |
| 3 | [Wybór SKU](sku-selection.md) | Dobór odpowiednich poziomów cenowych | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfiguracja monitoringu | 20 min |
| 5 | [Wzorce koordynacji](coordination-patterns.md) | Przepływy pracy zespołu przy wdrożeniu | 15 min |

---

## 🚀 Szybki start

```bash
# Sprawdź limity subskrypcji
az vm list-usage --location eastus --output table

# Podgląd wdrożenia (brak tworzenia zasobów)
azd provision --preview

# Waliduj składnię Bicep
az bicep build --file infra/main.bicep

# Sprawdź konfigurację środowiska
azd env get-values
```

---

## ☑️ Lista kontrolna przed wdrożeniem

### Przed `azd provision`

- [ ] Zweryfikowano limity zasobów dla regionu
- [ ] Odpowiednio dobrano SKU
- [ ] Przejrzano szacowany koszt
- [ ] Sprawdzono spójność konwencji nazewnictwa
- [ ] Skonfigurowano zabezpieczenia/RBAC

### Przed `azd deploy`

- [ ] Ustawiono zmienne środowiskowe
- [ ] Sekrety w Key Vault
- [ ] Zweryfikowano ciągi połączeń
- [ ] Skonfigurowano kontrole stanu zdrowia

---

## 💰 Przewodnik po wyborze SKU

| Obciążenie | Development | Produkcja |
|------------|-------------|-----------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Nawigacja

| Kierunek | Rozdział |
|----------|----------|
| **Poprzedni** | [Rozdział 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Następny** | [Rozdział 7: Rozwiązywanie problemów](../chapter-07-troubleshooting/README.md) |

---

## 📖 Powiązane zasoby

- [Przewodnik konfiguracji](../chapter-03-configuration/configuration.md)
- [Przewodnik wdrożeń](../chapter-04-infrastructure/deployment-guide.md)
- [Typowe problemy](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczeń AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dbamy o dokładność, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w języku źródłowym powinien być traktowany jako wiarygodne źródło. W przypadku informacji o krytycznym znaczeniu zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanych przez człowieka. Nie ponosimy odpowiedzialności za wszelkie nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->