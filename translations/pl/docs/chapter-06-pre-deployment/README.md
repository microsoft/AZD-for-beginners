# Rozdział 6: Planowanie i Walidacja Przed Wdrożeniem

**📚 Kurs**: [AZD dla Początkujących](../../README.md) | **⏱️ Czas trwania**: 1 godzina | **⭐ Poziom**: Średniozaawansowany

---

## Przegląd

Ten rozdział obejmuje kluczowe kroki planowania i walidacji przed wdrożeniem aplikacji. Naucz się unikać kosztownych błędów dzięki właściwemu planowaniu zasobów, wyborowi SKU oraz kontrolom przedwdrożeniowym.

## Cele Nauki

Po ukończeniu tego rozdziału będziesz potrafił:
- Przeprowadzać kontrole przedwdrożeniowe
- Planować pojemność i szacować wymagania zasobów
- Dobierać odpowiednie SKU dla optymalizacji kosztów
- Konfigurować Application Insights do monitoringu
- Rozumieć wzorce współpracy zespołowej

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Kontrole przedwdrożeniowe](preflight-checks.md) | Walidacja konfiguracji przed wdrożeniem | 15 min |
| 2 | [Planowanie pojemności](capacity-planning.md) | Szacowanie wymagań zasobów | 20 min |
| 3 | [Wybór SKU](sku-selection.md) | Dobór odpowiednich poziomów cenowych | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfiguracja monitoringu | 20 min |
| 5 | [Wzorce współpracy](coordination-patterns.md) | Procesy wdrożeniowe zespołu | 15 min |

---

## 🚀 Szybki Start

```bash
# Sprawdź limity subskrypcji
az vm list-usage --location eastus --output table

# Podgląd wdrożenia (żadne zasoby nie zostaną utworzone)
azd provision --preview

# Sprawdź składnię Bicep
az bicep build --file infra/main.bicep

# Sprawdź konfigurację środowiska
azd env get-values
```

---

## ☑️ Lista Kontrolna Przed Wdrożeniem

### Przed `azd provision`

- [ ] Zweryfikowana kwota przydziału dla regionu
- [ ] Odpowiednio dobrane SKU
- [ ] Przejrzana wycena kosztów
- [ ] Spójność konwencji nazewnictwa
- [ ] Skonfigurowane zabezpieczenia/RBAC

### Przed `azd deploy`

- [ ] Ustawione zmienne środowiskowe
- [ ] Tajne dane w Key Vault
- [ ] Zweryfikowane ciągi połączeń
- [ ] Skonfigurowane kontrole zdrowia

---

## 💰 Przewodnik po Wyborze SKU

| Obciążenie | Środowisko developerskie | Produkcyjne |
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
| **Następny** | [Rozdział 7: Rozwiązywanie Problemów](../chapter-07-troubleshooting/README.md) |

---

## 📖 Powiązane Materiały

- [Przewodnik Konfiguracji](../chapter-03-configuration/configuration.md)
- [Przewodnik Wdrożeniowy](../chapter-04-infrastructure/deployment-guide.md)
- [Typowe Problemy](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dążymy do dokładności, prosimy mieć na uwadze, że tłumaczenia automatyczne mogą zawierać błędy lub niedokładności. Oryginalny dokument w języku źródłowym powinien być uznawany za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->