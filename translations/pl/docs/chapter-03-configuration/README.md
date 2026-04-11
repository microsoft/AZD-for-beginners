# Rozdział 3: Konfiguracja i uwierzytelnianie

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 45-60 minut | **⭐ Poziom trudności**: Średniozaawansowany

---

## Przegląd

Ten rozdział obejmuje konfigurację środowiska, wzorce uwierzytelniania oraz najlepsze praktyki bezpieczeństwa dla wdrożeń Azure Developer CLI.

> Zweryfikowano na `azd 1.23.12` w marcu 2026.

## Cele nauki

Po ukończeniu tego rozdziału będziesz potrafić:
- Opanować hierarchię konfiguracji AZD
- Zarządzać wieloma środowiskami (dev, staging, prod)
- Wdrażać bezpieczne uwierzytelnianie za pomocą zarządzanych tożsamości
- Konfigurować ustawienia specyficzne dla środowiska

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Przewodnik po konfiguracji](configuration.md) | Ustawianie i zarządzanie środowiskiem | 30 min |
| 2 | [Uwierzytelnianie i bezpieczeństwo](authsecurity.md) | Zarządzane tożsamości i wzorce RBAC | 30 min |

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

# Wyświetl konfigurację
azd env get-values
```

---

## 🔧 Hierarchia konfiguracji

AZD stosuje ustawienia w następującej kolejności (późniejsze nadpisuje wcześniejsze):

1. **Wartości domyślne** (wbudowane w szablony)
2. **azure.yaml** (konfiguracja projektu)
3. **Zmienne środowiskowe** (`azd env set`)
4. **Przełączniki wiersza poleceń** (`--location eastus`)

---

## 🔐 Najlepsze praktyki bezpieczeństwa

```bash
# Użyj zarządzanej tożsamości (zalecane)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Sprawdź status uwierzytelniania AZD
azd auth status

# Opcjonalnie: zweryfikuj kontekst Azure CLI, jeśli planujesz uruchamiać polecenia az
az account show

# Ponownie się uwierzytelnij w razie potrzeby
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
Niniejszy dokument został przetłumaczony za pomocą automatycznej usługi tłumaczeniowej AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mimo że dążymy do dokładności, prosimy mieć na uwadze, że tłumaczenia automatyczne mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym powinien być traktowany jako wiarygodne źródło. W przypadku informacji krytycznych zaleca się profesjonalne tłumaczenie wykonane przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->