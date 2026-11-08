# 7. Podsumowanie i kolejne kroki

!!! tip "GŁÓWNE WNIOSKI TO"

    - [ ] AZD templates accelerate AI application development from days to hours
    - [ ] The Discovery → Deployment → Customization methodology provides a structured learning path
    - [ ] GitHub Copilot with MCP servers enables natural language exploration of complex codebases
    - [ ] Microsoft Foundry provides built-in observability, evaluation, and security testing

---

## 1. Co osiągnąłeś

Gratulacje! W tym warsztacie udało Ci się pomyślnie:

| Moduł | Osiągnięcie |
|:---|:---|
| **Moduł 1** | Poznałeś Azure Developer CLI i wybrałeś szablon AI |
| **Moduł 2** | Wdrożyłeś i zweryfikowałeś kompletne rozwiązanie dla agentów AI |
| **Moduł 3** | Przeanalizowałeś szablon, aby zrozumieć jego architekturę |
| **Moduł 4** | Poznałeś konfigurację oraz hooki cyklu życia `azure.yaml` |
| **Moduł 5** | Dostosowałeś szablon do własnego scenariusza |
| **Moduł 6** | Bezpiecznie zakończyłeś infrastrukturę i zarządzałeś zasobami |

---

## 2. Kluczowe pojęcia, które opanowałeś

### Azure Developer CLI (azd)
- `azd init` - Inicjalizacja projektów ze szablonów
- `azd up` - Provisioning i wdrożenie jednym poleceniem
- `azd env` - Zarządzanie zmiennymi środowiskowymi
- `azd down` - Bezpieczne czyszczenie zasobów

### Struktura szablonu AZD
- `azure.yaml` - Hooki konfiguracji i wdrożenia
- `infra/` - Infrastrukturę jako kod w Bicep
- `src/` - Kod źródłowy aplikacji
- `scripts/` - Skrypty automatyzacji i konfiguracji

### Możliwości Microsoft Foundry
- Usługa AI Agent dla inteligentnych asystentów
- Wyszukiwanie plików i Azure AI Search do pozyskiwania wiedzy
- Wbudowane śledzenie, monitorowanie i ewaluacja
- Red teaming dla weryfikacji bezpieczeństwa AI

---

## 3. Kontynuuj swoją podróż edukacyjną

### Rekomendowane kolejne kroki

| Ścieżka | Zasób | Czas |
|:---|:---|:---|
| **Ukończ kurs** | [Kurs AZD dla początkujących](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) | Nauka we własnym tempie |
| **Wypróbuj inny szablon** | [Szablony Microsoft Foundry](https://ai.azure.com/templates) | 1-2 godziny |
| **Zgłębiaj temat** | [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | Ciągłe |
| **Społeczność** | [Azure Discord](https://aka.ms/foundry/discord) | Dołącz już dziś! |

### Proponowane szablony do wypróbowania następnie

1. **[Pierwsze kroki z AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Podstawowy chat na Twoich danych
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - Zaawansowane wzorce RAG
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - Scenariusze dla przedsiębiorstw i handlu detalicznego

---

## 4. Wyzwanie warsztatowe

Gotowy na sprawdzenie swoich umiejętności? Spróbuj tych wyzwań:

| Wyzwanie | Opis | Trudność |
|:---|:---|:---|
| **1. Scenariusz wieloagentowy** | Wdróż i dostosuj do innej branży (np. służba zdrowia, finanse) | ⭐⭐ |
| **2. Niestandardowa baza wiedzy** | Dodaj własne pliki danych i utwórz niestandardowy indeks wyszukiwania | ⭐⭐⭐ |
| **3. Wdrożenie produkcyjne** | Skonfiguruj CI/CD z GitHub Actions używając `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. Podziel się swoją opinią

Twoja opinia pomaga nam ulepszać ten warsztat!

- **GitHub Issues**: [Prześlij opinię](https://github.com/microsoft/azd-for-beginners/issues) - oznacz tagiem `Workshop`
- **Discord**: Dołącz do [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - opublikuj w `#get-help`
- **Wkład**: Pomóż ulepszyć warsztat, wysyłając pull requesty!

---

## Dziękujemy! 🎉

Dziękujemy za ukończenie warsztatów AZD dla programistów AI. Mamy nadzieję, że to doświadczenie wyposażyło Cię w umiejętności i pewność siebie do tworzenia i wdrażania aplikacji AI na platformie Azure.

**Buduj dalej, ucz się dalej i witamy w społeczności programistów AI Azure!**

---

| | |
|:---|:---|
| **📚 Strona kursu** | [AZD dla początkujących](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) |
| **📖 Dokumentacja** | [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ Szablony AI** | [Szablony Microsoft Foundry](https://ai.azure.com/templates) |
| **💬 Społeczność** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->