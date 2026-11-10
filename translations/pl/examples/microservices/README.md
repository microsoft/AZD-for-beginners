# Przykład mikroserwisów

Wykonalna implementacja i jej instrukcje znajdują się w
**[container-app/microservices](../container-app/microservices/README.md)**.

Ten katalog służy wyłącznie do nawigacji. Nie zawiera `azure.yaml`, `infra/` ani `src/`.
Nie uruchamiaj tutaj `azd up`.

Z katalogu głównego repozytorium:

```bash
cd examples/container-app/microservices
```

Następnie postępuj zgodnie z powiązanym plikiem README dotyczącym wymagań wstępnych, wdrożenia, weryfikacji, lokalnego
rozwoju, ćwiczeń praktycznych, kosztów i sprzątania.

Przykład zawiera bramę API w Node.js oraz serwis produktów tylko do odczytu w Pythonie.
Usługi zamówień, użytkowników, powiadomień, bazy danych i komunikacji to pomysły na rozszerzenia,
a nie implementacje zawarte w tym repozytorium.

- [Poprzedni: Proste API Flask](../../../../examples/container-app/simple-flask-api)
- [Następny: Aplikacja bazodanowa](../../../../examples/database-app)
- [Rozwój AI](../../docs/chapter-02-ai-development/README.md)
- [Strona kursu](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->