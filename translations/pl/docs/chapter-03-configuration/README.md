# Rozdział 3: Konfiguracja i uwierzytelnianie

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 45-60 minut | **⭐ Poziom**: Średniozaawansowany

---

## Przegląd

Ten rozdział omawia konfigurację środowiska, wzorce uwierzytelniania oraz najlepsze praktyki bezpieczeństwa dla wdrożeń Azure Developer CLI.

> Weryfikowano z `azd 1.25.6` w czerwcu 2026.

## Cele nauki

Po ukończeniu tego rozdziału będziesz potrafił:
- Opanować hierarchię konfiguracji AZD
- Zarządzać wieloma środowiskami (dev, staging, prod)
- Wdrażać bezpieczne uwierzytelnianie za pomocą zarządzanych tożsamości
- Konfigurować ustawienia specyficzne dla środowiska

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Przewodnik po konfiguracji](configuration.md) | Ustawienia i zarządzanie środowiskiem | 30 min |
| 2 | [Uwierzytelnianie i bezpieczeństwo](authsecurity.md) | Wzorce zarządzanej tożsamości i RBAC | 30 min |

---

## 🚀 Szybki start

```bash
# Utwórz wiele środowisk
azd env new dev
azd env new staging
azd env new prod

# Przełącz środowiska
azd env select prod

# Ustaw zmienne środowiskowe
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Zobacz konfigurację
azd env get-values
```

---

## 🔧 Hierarchia konfiguracji

AZD stosuje ustawienia w kolejności (późniejsze nadpisują wcześniejsze):

1. **Wartości domyślne** (wbudowane w szablony)
2. **azure.yaml** (konfiguracja projektu)
3. **Zmienne środowiskowe** (`azd env set`)
4. **Flagi wiersza poleceń** (`--location eastus`)

---

## 🔐 Najlepsze praktyki bezpieczeństwa

```bash
# Użyj tożsamości zarządzanej (zalecane)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Sprawdź status uwierzytelniania AZD
azd auth status

# Opcjonalnie: zweryfikuj kontekst Azure CLI, jeśli planujesz uruchamiać polecenia az
az account show

# Ponownie się uwierzytelnij, jeśli to konieczne
azd auth login

# Opcjonalnie: odśwież uwierzytelnianie Azure CLI dla poleceń az
az login
```

---

## 🔗 Nawigacja

| Kierunek | Rozdział |
|-----------|---------|
| **Poprzedni** | [Rozdział 2: Rozwój AI](../chapter-02-ai-development/README.md) |
| **Następny** | [Rozdział 4: Infrastruktura](../chapter-04-infrastructure/README.md) |

---

## 📖 Powiązane zasoby

- [Kontrole przed wdrożeniem](../chapter-06-pre-deployment/README.md)
- [Rozwiązywanie problemów](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->