# Rozdział 7: Rozwiązywanie problemów i debugowanie

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 1–1,5 godziny | **⭐ Poziom trudności**: Średniozaawansowany

---

## Przegląd

Ten rozdział pomoże Ci diagnozować i rozwiązywać typowe problemy podczas pracy z Azure Developer CLI. Od błędów wdrożenia po problemy specyficzne dla AI.

## Cele nauki

Po ukończeniu tego rozdziału będziesz:
- Diagnozować typowe błędy wdrożeń AZD
- Debugować problemy z uwierzytelnianiem i uprawnieniami
- Rozwiązywać problemy z łącznością usług AI
- Korzystać z Azure Portal i CLI do rozwiązywania problemów

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Typowe problemy](common-issues.md) | Często napotykane problemy | 30 min |
| 2 | [Przewodnik debugowania](debugging.md) | Strategie debugowania krok po kroku | 45 min |
| 3 | [Rozwiązywanie problemów AI](ai-troubleshooting.md) | Problemy specyficzne dla AI | 30 min |

---

## 🚨 Szybkie naprawy

### Problemy z uwierzytelnianiem
```bash
azd auth login
az login
azd auth whoami
```

### Błędy provisioningu
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

### Przekroczono limit
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Odniesienie kodów błędów

| Błąd | Przyczyna | Rozwiązanie |
|-------|-------|----------|
| `AuthenticationError` | Not logged in | `azd auth login` |
| `ResourceNotFound` | Missing resource | Sprawdź nazwy zasobów |
| `QuotaExceeded` | Subscription limits | Poproś o zwiększenie limitu |
| `InvalidTemplate` | Bicep syntax error | `az bicep build` |
| `Conflict` | Resource exists | Użyj nowej nazwy lub usuń istniejący zasób |
| `Forbidden` | Insufficient permissions | Sprawdź role RBAC |

---

## 🔄 Reset i odzyskiwanie

```bash
# Miękki reset (zachować zasoby, ponownie wdrożyć kod)
azd deploy --force

# Twardy reset (usunąć wszystko, zacząć od nowa)
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
- [Przewodnik po konfiguracji](../chapter-03-configuration/configuration.md)
- [Zgłoszenia AZD na GitHubie](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Zastrzeżenie:
Ten dokument został przetłumaczony przy użyciu usługi tłumaczeń opartych na sztucznej inteligencji [Co-op Translator](https://github.com/Azure/co-op-translator). Mimo że dokładamy starań, aby tłumaczenia były jak najbardziej precyzyjne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Za autorytatywną wersję należy uznać oryginalny dokument w jego języku źródłowym. W przypadku informacji istotnych lub krytycznych zalecane jest skorzystanie z profesjonalnego, ludzkiego tłumaczenia. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->