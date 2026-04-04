# Rozdział 7: Rozwiązywanie problemów i debugowanie

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 1-1,5 godziny | **⭐ Poziom trudności**: Średniozaawansowany

---

## Przegląd

Ten rozdział pomaga diagnozować i rozwiązywać typowe problemy podczas pracy z Azure Developer CLI. Od niepowodzeń wdrożeń po problemy specyficzne dla AI.

> Zweryfikowano na `azd 1.23.12` w marcu 2026.

## Cele nauki

Po ukończeniu tego rozdziału będziesz potrafił:
- Diagnozować typowe błędy wdrożeń AZD
- Debugować problemy z uwierzytelnianiem i uprawnieniami
- Rozwiązywać problemy z łącznością usług AI
- Używać Azure Portal i CLI do rozwiązywania problemów

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Typowe problemy](common-issues.md) | Często napotykane problemy | 30 min |
| 2 | [Przewodnik debugowania](debugging.md) | Strategia debugowania krok po kroku | 45 min |
| 3 | [Rozwiązywanie problemów z AI](ai-troubleshooting.md) | Problemy specyficzne dla AI | 30 min |

---

## 🚨 Szybkie rozwiązania

### Problemy z uwierzytelnianiem
```bash
# Wymagane dla przepływów pracy AZD
azd auth login

# Opcjonalne, jeśli używasz również poleceń Azure CLI bezpośrednio
az login

azd auth status
```

### Niepowodzenia provisioningu
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Konflikty zasobów
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Przekroczono limit kwoty
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Referencja kodów błędów

| Błąd | Przyczyna | Rozwiązanie |
|-------|-------|----------|
| `AuthenticationError` | Brak zalogowania | `azd auth login` |
| `ResourceNotFound` | Brak zasobu | Sprawdź nazwy zasobów |
| `QuotaExceeded` | Limity subskrypcji | Złóż prośbę o zwiększenie kwoty |
| `InvalidTemplate` | Błąd składni Bicep | `az bicep build` |
| `Conflict` | Zasób już istnieje | Użyj nowej nazwy lub usuń istniejący |
| `Forbidden` | Niewystarczające uprawnienia | Sprawdź role RBAC |

---

## 🔄 Resetowanie i odzyskiwanie

```bash
# Reset miękki (zachowaj zasoby, ponownie wdroż kod)
azd deploy --force

# Reset twardy (usuń wszystko, zacznij od nowa)
azd down --force --purge
azd up
```

---

## 🔗 Nawigacja

| Kierunek | Rozdział |
|-----------|---------|
| **Poprzedni** | [Rozdział 6: Przygotowanie przed wdrożeniem](../chapter-06-pre-deployment/README.md) |
| **Następny** | [Rozdział 8: Produkcja](../chapter-08-production/README.md) |

---

## 📖 Powiązane zasoby

- [Kontrole przed wdrożeniem](../chapter-06-pre-deployment/preflight-checks.md)
- [Przewodnik konfiguracyjny](../chapter-03-configuration/configuration.md)
- [Problemy AZD na GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony przy użyciu automatycznej usługi tłumaczeniowej AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do jak największej dokładności, prosimy mieć na uwadze, że tłumaczenia automatyczne mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym należy traktować jako źródło ostateczne. W przypadku istotnych informacji zaleca się skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->