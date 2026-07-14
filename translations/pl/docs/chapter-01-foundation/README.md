# Rozdział 1: Podstawy i szybki start

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 30-45 minut | **⭐ Poziom**: Początkujący

---

## Przegląd

Ten rozdział wprowadza podstawy Azure Developer CLI (azd). Nauczysz się podstawowych pojęć, zainstalujesz narzędzia i wdrożysz swoją pierwszą aplikację do Azure.

> Potwierdzono na `azd 1.27.1` w lipcu 2026.

## Cele nauki

Po ukończeniu tego rozdziału będziesz:
- Rozumieć, czym jest Azure Developer CLI i jak różni się od Azure CLI
- Instalować i konfigurować AZD na swojej platformie
- Wdrażać swoją pierwszą aplikację do Azure za pomocą `azd up`
- Sprzątać zasoby za pomocą `azd down`

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Podstawy AZD](azd-basics.md) | Podstawowe pojęcia, terminologia i struktura projektu | 15 min |
| 2 | [Instalacja i konfiguracja](installation.md) | Przewodniki instalacji specyficzne dla platformy | 10 min |
| 3 | [Twój pierwszy projekt](first-project.md) | Praktycznie: wdrożenie aplikacji webowej do Azure | 20 min |
| 4 | [Dodaj swoją aplikację](bring-your-own-app.md) | Dodaj azd do istniejącego projektu, który już masz | 15 min |
| 5 | [Dev Containers i Codespaces](dev-containers.md) | Powtarzalne środowiska azd z dev containers | 15 min |

---

## ✅ Zacznij tutaj: Sprawdź swoje środowisko

Zanim zaczniesz, potwierdź, że Twoja lokalna maszyna jest gotowa dla szablonu z Rozdziału 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jeśli skrypt zgłasza brakujące narzędzia, najpierw je zainstaluj, a następnie kontynuuj rozdział.

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
azd down --force --purge # Czyści zasoby
```

---

## 🔗 Nawigacja

| Kierunek | Rozdział |
|-----------|---------|
| **Następny** | [Rozdział 2: AI-Pierwszy rozwój](../chapter-02-ai-development/README.md) |
| **Przejdź do** | [Rozdział 3: Konfiguracja](../chapter-03-configuration/README.md) |

---

## 📖 Powiązane zasoby

- [Polecenia – ściągawka](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Słownik terminów](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->