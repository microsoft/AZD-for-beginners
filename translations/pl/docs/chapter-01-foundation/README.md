# Rozdział 1: Podstawy i szybki start

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 30-45 minut | **⭐ Poziom trudności**: Początkujący

---

## Przegląd

Ten rozdział wprowadza podstawy Azure Developer CLI (azd). Nauczysz się kluczowych pojęć, zainstalujesz narzędzia i wdrożysz swoją pierwszą aplikację w Azure.

> Sprawdzone na `azd 1.23.12` w marcu 2026.

## Cele nauki

Po ukończeniu tego rozdziału będziesz:
- Rozumieć czym jest Azure Developer CLI i czym różni się od Azure CLI
- Umieć zainstalować i skonfigurować AZD na swojej platformie
- Wdrożyć swoją pierwszą aplikację do Azure za pomocą `azd up`
- Usunąć zasoby za pomocą `azd down`

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Podstawy AZD](azd-basics.md) | Kluczowe pojęcia, terminologia i struktura projektu | 15 min |
| 2 | [Instalacja i konfiguracja](installation.md) | Przewodniki instalacji specyficzne dla platform | 10 min |
| 3 | [Twój pierwszy projekt](first-project.md) | Praktyczne: Wdrożenie aplikacji webowej do Azure | 20 min |

---

## ✅ Zacznij tutaj: Sprawdź swoje środowisko

Zanim zaczniesz, upewnij się, że Twoja lokalna maszyna jest gotowa do szablonu Rozdziału 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jeśli skrypt zgłosi brakujące narzędzia, najpierw je zainstaluj, a następnie kontynuuj rozdział.

---

## 🚀 Szybki start

```bash
# Sprawdź instalację
azd version

# Uwierzytelnij się dla AZD
# Opcjonalnie: az login, jeśli planujesz bezpośrednio uruchamiać polecenia Azure CLI
azd auth login

# Wdróż swoją pierwszą aplikację
azd init --template todo-nodejs-mongo
azd up

# Posprzątaj po zakończeniu pracy
azd down --force --purge
```

---

## ✅ Kryteria sukcesu

Po ukończeniu tego rozdziału powinieneś być w stanie:

```bash
azd version              # Pokazuje zainstalowaną wersję
azd init --template todo-nodejs-mongo  # Inicjalizuje projekt
azd up                   # Wdraża do Azure
azd show                 # Wyświetla URL działającej aplikacji
azd down --force --purge # Sprząta zasoby
```

---

## 🔗 Nawigacja

| Kierunek | Rozdział |
|-----------|---------|
| **Następny** | [Rozdział 2: Rozwój z naciskiem na AI](../chapter-02-ai-development/README.md) |
| **Pomiń do** | [Rozdział 3: Konfiguracja](../chapter-03-configuration/README.md) |

---

## 📖 Powiązane zasoby

- [Karta poleceń](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Słownik pojęć](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony przy użyciu usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym powinien być uznawany za źródło nadrzędne. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->