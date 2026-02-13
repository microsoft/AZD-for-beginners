# Rozdział 1: Podstawy & Szybki start

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 30-45 minut | **⭐ Poziom**: Początkujący

---

## Przegląd

Ten rozdział wprowadza podstawy Azure Developer CLI (azd). Nauczysz się kluczowych pojęć, zainstalujesz narzędzia i wdrożysz swoją pierwszą aplikację do Azure.

## Cele nauki

Po ukończeniu tego rozdziału będziesz:

- Zrozumieć, czym jest Azure Developer CLI i czym różni się od Azure CLI
- Zainstalować i skonfigurować AZD na swojej platformie
- Wdróż swoją pierwszą aplikację do Azure za pomocą `azd up`
- Usunąć zasoby za pomocą `azd down`

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Podstawy AZD](azd-basics.md) | Podstawowe pojęcia, terminologia i struktura projektu | 15 min |
| 2 | [Instalacja & konfiguracja](installation.md) | Instrukcje instalacji specyficzne dla platformy | 10 min |
| 3 | [Twój pierwszy projekt](first-project.md) | Praktycznie: Wdróż aplikację webową do Azure | 20 min |

---

## 🚀 Szybki start

```bash
# Sprawdź instalację
azd version

# Zaloguj się do Azure
azd auth login

# Wdróż swoją pierwszą aplikację
azd init --template todo-nodejs-mongo
azd up

# Posprzątaj po zakończeniu
azd down --force --purge
```

---

## ✅ Kryteria sukcesu

Po ukończeniu tego rozdziału będziesz w stanie:

```bash
azd version              # Wyświetla zainstalowaną wersję
azd init --template todo-nodejs-mongo  # Inicjalizuje projekt
azd up                   # Wdraża do Azure
azd show                 # Wyświetla adres URL działającej aplikacji
azd down --force --purge # Czyści zasoby
```

---

## 🔗 Nawigacja

| Kierunek | Rozdział |
|-----------|---------|
| **Następny** | [Rozdział 2: Rozwój z naciskiem na AI](../chapter-02-ai-development/README.md) |
| **Przejdź do** | [Rozdział 3: Konfiguracja](../chapter-03-configuration/README.md) |

---

## 📖 Powiązane zasoby

- [Skrót poleceń](../../resources/cheat-sheet.md)
- [Najczęściej zadawane pytania (FAQ)](../../resources/faq.md)
- [Słownik](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Zastrzeżenie:
Niniejszy dokument został przetłumaczony przy użyciu usługi tłumaczenia AI Co‑op Translator (https://github.com/Azure/co-op-translator). Chociaż dokładamy starań, aby tłumaczenia były jak najdokładniejsze, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym powinien być uznany za dokument wiążący. W przypadku informacji krytycznych zalecane jest skorzystanie z usług profesjonalnego tłumacza. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->