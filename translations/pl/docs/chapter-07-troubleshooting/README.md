# Rozdział 7: Rozwiązywanie problemów i debugowanie

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 1-1.5 godziny | **⭐ Trudność**: Średniozaawansowana

---

## Przegląd

Ten rozdział pomaga diagnozować i rozwiązywać typowe problemy przy pracy z Azure Developer CLI. Od niepowodzeń wdrożeń po kwestie specyficzne dla AI.

> Zweryfikowano na `azd 1.27.1` w lipcu 2026 roku.

## Cele nauki

Po ukończeniu tego rozdziału będziesz potrafić:
- Diagnozować typowe błędy wdrożeń AZD
- Debugować problemy z uwierzytelnianiem i uprawnieniami
- Rozwiązywać problemy z łącznością usług AI
- Korzystać z Azure Portal i CLI do rozwiązywania problemów

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Typowe problemy](common-issues.md) | Często napotykane problemy | 30 min |
| 2 | [Przewodnik po debugowaniu](debugging.md) | Strategie debugowania krok po kroku | 45 min |
| 3 | [Rozwiązywanie problemów AI](ai-troubleshooting.md) | Problemy specyficzne dla AI | 30 min |

---

## 🚨 Szybkie poprawki

### Problemy z uwierzytelnianiem
```bash
# Wymagane dla przepływów pracy AZD
azd auth login

# Opcjonalne, jeśli używasz również poleceń Azure CLI bezpośrednio
az login

azd auth status
```

### Niepowodzenia w provisioningu
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

## 📋 Odniesienie kodów błędów

| Błąd | Przyczyna | Rozwiązanie |
|-------|-------|----------|
| `AuthenticationError` | Nie zalogowany | `azd auth login` |
| `ResourceNotFound` | Brak zasobu | Sprawdź nazwy zasobów |
| `QuotaExceeded` | Limity subskrypcji | Poproś o zwiększenie kwoty |
| `InvalidTemplate` | Błąd składni Bicep | `az bicep build` |
| `Conflict` | Zasób istnieje | Użyj nowej nazwy lub usuń |
| `Forbidden` | Niewystarczające uprawnienia | Sprawdź role RBAC |

---

## 🔄 Resetowanie i odzyskiwanie

```bash
# Miękki reset (zachowaj zasoby, ponownie wdrażaj kod)
azd deploy --force

# Twardy reset (usuń wszystko, zacznij od nowa)
azd down --force --purge
azd up
```

---

## 🔗 Nawigacja

| Kierunek | Rozdział |
|-----------|---------|
| **Poprzedni** | [Rozdział 6: Przed wdrożeniem](../chapter-06-pre-deployment/README.md) |
| **Następny** | [Rozdział 8: Produkcja](../chapter-08-production/README.md) |

---

## 📖 Powiązane zasoby

- [Sprawdzanie przed wdrożeniem](../chapter-06-pre-deployment/preflight-checks.md)
- [Przewodnik konfiguracji](../chapter-03-configuration/configuration.md)
- [Problemy AZD na GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->