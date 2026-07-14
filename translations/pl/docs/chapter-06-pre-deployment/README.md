# Rozdział 6: Planowanie i walidacja przed wdrożeniem

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 1 godzina | **⭐ Poziom trudności**: Średniozaawansowany

---

## Przegląd

Ten rozdział obejmuje niezbędne kroki planowania i walidacji przed wdrożeniem aplikacji. Naucz się unikać kosztownych błędów dzięki właściwemu planowaniu pojemności, doborowi SKU oraz kontrolom przed wdrożeniem.

> Zweryfikowano z `azd 1.27.1` w lipcu 2026.

## Cele nauki

Po ukończeniu tego rozdziału będziesz potrafił:
- Przeprowadzać kontrole przed wdrożeniem
- Planować pojemność i szacować wymagania dotyczące zasobów
- Wybierać odpowiednie SKU dla optymalizacji kosztów
- Konfigurować Application Insights dla monitoringu
- Rozumieć wzorce koordynacji zespołowej

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Kontrole przed wdrożeniem](preflight-checks.md) | Walidacja konfiguracji przed wdrożeniem | 15 min |
| 2 | [Planowanie pojemności](capacity-planning.md) | Szacowanie wymagań zasobów | 20 min |
| 3 | [Dobór SKU](sku-selection.md) | Wybór odpowiednich poziomów cenowych | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfiguracja monitoringu | 20 min |
| 5 | [Wzorce koordynacji](coordination-patterns.md) | Procesy wdrożeniowe zespołu | 15 min |

---

## 🚀 Szybki start

```bash
# Sprawdź limity subskrypcji
az vm list-usage --location eastus --output table

# Podgląd wdrożenia (nie tworzono zasobów)
azd provision --preview

# Zweryfikuj składnię Bicep
az bicep build --file infra/main.bicep

# Sprawdź konfigurację środowiska
azd env get-values
```

---

## ☑️ Lista kontrolna przed wdrożeniem

### Przed `azd provision`

- [ ] Zweryfikowano limit dla regionu
- [ ] Odpowiednio wybrane SKU
- [ ] Przejrzano szacunkowe koszty
- [ ] Spójna konwencja nazewnictwa
- [ ] Skonfigurowano zabezpieczenia/RBAC

### Przed `azd deploy`

- [ ] Ustawione zmienne środowiskowe
- [ ] Sekrety w Key Vault
- [ ] Zweryfikowane łańcuchy połączeń
- [ ] Skonfigurowane testy zdrowotności

---

## 💰 Przewodnik po doborze SKU

| Obciążenie | Rozwój | Produkcja |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Nawigacja

| Kierunek | Rozdział |
|-----------|---------|
| **Poprzedni** | [Rozdział 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Następny** | [Rozdział 7: Rozwiązywanie problemów](../chapter-07-troubleshooting/README.md) |

---

## 📖 Powiązane zasoby

- [Przewodnik konfiguracji](../chapter-03-configuration/configuration.md)
- [Przewodnik wdrażania](../chapter-04-infrastructure/deployment-guide.md)
- [Typowe problemy](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->