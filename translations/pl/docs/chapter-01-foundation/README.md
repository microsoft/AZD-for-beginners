# Rozdział 1: Podstawy i szybki start

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 75-120 minut, łącznie z pierwszym wdrożeniem; dodatkowe ćwiczenia zajmują więcej czasu | **⭐ Stopień trudności**: Początkujący

---

## Przegląd

Ten rozdział wprowadza podstawy Azure Developer CLI (azd). Poznasz podstawowe koncepcje, zainstalujesz narzędzia i wdrożysz swoją pierwszą aplikację w Azure.

> Cel przeglądu poleceń i konfiguracji: `azd 1.37.2` (listopad 2026). Podczas przeglądu nie przeprowadzono rzeczywistego uruchamiania Azure.

## Cele nauki

Po ukończeniu tego rozdziału będziesz:
- Rozumieć, czym jest Azure Developer CLI i jak różni się od Azure CLI
- Zainstalujesz i skonfigurujesz AZD na swojej platformie
- Wdrożysz swoją pierwszą aplikację w Azure za pomocą `azd up`
- Posprzątasz zasoby za pomocą `azd down`

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Podstawy AZD](azd-basics.md) | Podstawowe koncepcje, terminologia i struktura projektu | 15 min |
| 2 | [Instalacja i konfiguracja](installation.md) | Poradniki instalacji specyficzne dla platform | 10 min |
| 3 | [Twój pierwszy projekt](first-project.md) | Praktyczne: Wdrożenie aplikacji webowej do Azure | 20 min |
| 4 | [Dodaj własną aplikację](bring-your-own-app.md) | Dodaj azd do istniejącego projektu, który już posiadasz | 15 min |
| 5 | [Kontenery deweloperskie i Codespaces](dev-containers.md) | Powtarzalne środowiska azd z kontenerami deweloperskimi | 15 min |

---

## ✅ Zaczynaj tutaj: Sprawdź swoje środowisko

Przed rozpoczęciem upewnij się, że twój lokalny komputer jest gotowy na szablon Rozdział 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jeśli skrypt zgłasza brakujące narzędzia, najpierw je napraw, a następnie kontynuuj rozdział.

---

## 🚀 Szybki Start

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ Kryteria sukcesu

Po ukończeniu tego rozdziału powinieneś być w stanie:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 Nawigacja

| Kierunek | Rozdział |
|-----------|---------|
| **Dalej** | [Rozdział 2: Rozwój AI-First](../chapter-02-ai-development/README.md) |
| **Przejdź do** | [Rozdział 3: Konfiguracja](../chapter-03-configuration/README.md) |

---

## 📖 Powiązane zasoby

- [Karta ściągawki poleceń](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Słownik pojęć](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->