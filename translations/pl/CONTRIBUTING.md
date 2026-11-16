# Wkład w AZD For Beginners

Dziękujemy za zainteresowanie wkładem w kurs AZD For Beginners! Ten dokument zawiera wytyczne i informacje dla współtwórców.

## Jak Wkładać Swój Wkład

### Zgłaszanie Problemów

Jeśli znajdziesz błędy, pomyłki lub masz sugestie dotyczące usprawnień:

1. **Sprawdź Istniejące Problemy**: Przeszukaj [istniejące problemy](https://github.com/microsoft/azd-for-beginners/issues), aby uniknąć duplikatów
2. **Utwórz Nowy Problem**: Użyj odpowiedniego szablonu problemu
3. **Podaj Szczegóły**: Dołącz kroki pozwalające odtworzyć problem, oczekiwane zachowanie oraz zrzuty ekranu jeśli to możliwe

### Proponowanie Zmian

1. **Utwórz Fork Repozytorium**: Stwórz własny fork projektu
2. **Utwórz Gałąź**: Stwórz gałąź funkcjonalności dla swoich zmian
3. **Wprowadź Zmiany**: Przestrzegaj naszych standardów kodowania i dokumentacji
4. **Przetestuj Zmiany**: Sprawdź, czy wszystkie linki działają, a treść wyświetla się poprawnie
5. **Prześlij Pull Request**: Podaj klarowny opis swoich zmian

### Rodzaje Wkładów

Z przyjemnością przyjmujemy następujące rodzaje wkładów:

#### Ulepszenia Treści
- Popraw błędy literowe, gramatyczne i formatowanie
- Popraw jasność istniejącej dokumentacji
- Aktualizuj przestarzałe informacje
- Dodaj brakujące wyjaśnienia lub kontekst

#### Nowe Przykłady
- Dodaj scenariusze wdrożeń z życia wziętych
- Stwórz nowe szablony AZD dla typowych przypadków użycia
- Dostarcz dodatkowe przykłady kodu i ćwiczenia

#### Wsparcie Tłumaczeniowe
- Pomóż utrzymać istniejące tłumaczenia
- Popraw jakość tłumaczeń
- Dodaj tłumaczenia do nowej zawartości

#### Raporty o Błędach
- Zgłaszaj zepsute linki lub niepoprawne przykłady kodu
- Wykrywaj niespójności w dokumentacji
- Zgłaszaj problemy z dostępnością

## Wytyczne dla Współtwórców

### Standardy Dokumentacji

- Używaj jasnego, przyjaznego dla początkujących języka
- Zawieraj cele nauki i oczekiwane rezultaty
- Podawaj instrukcje krok po kroku wraz z oczekiwanymi wynikami
- Dodaj linki nawigacyjne do powiązanych treści
- Stosuj spójne formatowanie i styl markdown

### Przykłady Kodów

- Upewnij się, że wszystkie przykłady kodu są przetestowane i działają
- Dołącz komentarze wyjaśniające kluczowe koncepcje
- Przestrzegaj najlepszych praktyk Azure i AZD
- Podawaj oczekiwany wynik tam, gdzie to możliwe

### Weryfikacja Dokumentacji w Języku Angielskim

Z poziomu katalogu głównego repozytorium, zainstaluj istniejące wymagania rozwojowe i uruchom:

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

Offline checker linków sprawdza ścieżki w Markdown/HTML w języku angielskim, nagłówki, jawne kotwice oraz puste miejsca na linki. Wyklucza wygenerowane `translations/` oraz `translated_images/`, włączając linki do tych katalogów. Nie pobiera zewnętrznych witryn ani nie weryfikuje wdrożeń Azure. Użyj `--json <report-path>` do eksportu błędów i zewnętrznego spisu URL do oddzielnej weryfikacji sieci. Weryfikuj aktualne polecenia upstream i przykładowe wymagania przy zmianie instrukcji technicznych; rozróżniaj przetestowane aplikacje od planów projektowych.

### Komentarze Do Commitów

Używaj jasnych, opisowych komentarzy do commitów:
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## Kodeks Postępowania

Prosimy o zapoznanie się i przestrzeganie naszego [Kodeksu Postępowania](CODE_OF_CONDUCT.md), aby utrzymać gościnne i inkluzywne środowisko społeczności.

## Uzyskiwanie Pomocy

- **Pytania**: Szukaj lub otwórz [problem na GitHub](https://github.com/microsoft/AZD-for-beginners/issues)
- **Społeczność**: Dołącz do [Azure Discord](https://discord.gg/microsoft-azure)
- **Dokumentacja**: Przejrzyj [dokumentację Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## Licencja

Wnosząc wkład do tego repozytorium wyrażasz zgodę, że Twoje wkłady będą licencjonowane na warunkach [Licencji MIT](../../LICENSE).

---

Dziękujemy za pomoc w uczynieniu AZD For Beginners lepszym zasobem edukacyjnym dla społeczności!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->