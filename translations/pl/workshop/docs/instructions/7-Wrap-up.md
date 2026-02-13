# 7. Podsumowanie i kolejne kroki

!!! tip "NAJWAŻNIEJSZE WNIOSKI TO"

    - [ ] Szablony AZD przyspieszają rozwój aplikacji AI z dni do godzin
    - [ ] Metodologia Discovery → Deployment → Customization zapewnia uporządkowaną ścieżkę nauki
    - [ ] GitHub Copilot z serwerami MCP umożliwia eksplorację złożonych kodów za pomocą języka naturalnego
    - [ ] Microsoft Foundry oferuje wbudowaną obserwowalność, ocenę i testy bezpieczeństwa

---

## 1. Co osiągnąłeś

Gratulacje! W tym warsztacie udało Ci się:

| Moduł | Osiągnięcie |
|:---|:---|
| **Moduł 1** | Poznałeś Azure Developer CLI i wybrałeś szablon AI |
| **Moduł 2** | Wdrożyłeś i zweryfikowałeś kompletne rozwiązanie z agentami AI |
| **Moduł 3** | Rozłożyłeś szablon, aby zrozumieć jego architekturę |
| **Moduł 4** | Poznałeś konfigurację `azure.yaml` oraz haki cyklu życia |
| **Moduł 5** | Dostosowałeś szablon do własnego scenariusza |
| **Moduł 6** | Bezpiecznie rozłożyłeś infrastrukturę i zarządzałeś zasobami |

---

## 2. Kluczowe pojęcia, które opanowałeś

### Azure Developer CLI (azd)
- `azd init` - Inicjalizacja projektów ze szablonów
- `azd up` - Provisioning i wdrożenie w jednym poleceniu
- `azd env` - Zarządzanie zmiennymi środowiskowymi
- `azd down` - Bezpieczne sprzątanie zasobów

### Struktura szablonu AZD
- `azure.yaml` - Konfiguracja i haki wdrożeniowe
- `infra/` - Infrastruktura jako kod w Bicep
- `src/` - Kod źródłowy aplikacji
- `scripts/` - Skrypty automatyzacji i konfiguracji

### Możliwości Microsoft Foundry
- Usługa AI Agent dla inteligentnych asystentów
- File Search i Azure AI Search do wyszukiwania wiedzy
- Wbudowane śledzenie, monitorowanie i ewaluacja
- Red teaming do walidacji bezpieczeństwa AI

---

## 3. Kontynuuj swoją naukę

### Rekomendowane kolejne kroki

| Ścieżka | Zasób | Czas |
|:---|:---|:---|
| **Ukończ kurs** | [Kurs AZD dla początkujących](../../README.md) | 8-12 godzin |
| **Wypróbuj inny szablon** | [Szablony Microsoft Foundry](https://ai.azure.com/templates) | 1-2 godziny |
| **Zgłębiaj temat** | [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | Cały czas |
| **Społeczność** | [Azure Discord](https://aka.ms/foundry/discord) | Dołącz już dziś! |

### Proponowane następne szablony do wypróbowania

1. **[Rozpocznij z AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Podstawowy czat z Twoimi danymi  
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - Zaawansowane wzorce RAG  
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - Scenariusze dla przedsiębiorstw detalicznych  

---

## 4. Wyzwanie warsztatowe

Gotowy, by sprawdzić swoje umiejętności? Wypróbuj te wyzwania:

| Wyzwanie | Opis | Trudność |
|:---|:---|:---|
| **1. Scenariusz wieloagentowy** | Wdroż i dostosuj dla innej branży (np. zdrowie, finanse) | ⭐⭐ |
| **2. Własna baza wiedzy** | Dodaj własne pliki danych i stwórz niestandardowy indeks wyszukiwania | ⭐⭐⭐ |
| **3. Wdrożenie produkcyjne** | Skonfiguruj CI/CD z GitHub Actions używając `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. Podziel się swoją opinią

Twoja opinia pomaga nam ulepszać ten warsztat!

- **GitHub Issues**: [Zgłoś opinię](https://github.com/microsoft/azd-for-beginners/issues) - oznacz `Workshop`
- **Discord**: Dołącz do [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - napisz na `#get-help`
- **Wkład**: Pomóż ulepszyć warsztat, wysyłając pull requesty!

---

## Dziękujemy! 🎉

Dziękujemy za ukończenie warsztatu AZD dla programistów AI. Mamy nadzieję, że to doświadczenie wyposażyło Cię w umiejętności i pewność siebie do tworzenia i wdrażania aplikacji AI na platformie Azure.

**Buduj dalej, ucz się nadal i witamy w społeczności programistów Azure AI!**

---

| | |
|:---|:---|
| **📚 Strona kursu** | [AZD dla początkujących](../../README.md) |
| **📖 Dokumentacja** | [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ Szablony AI** | [Szablony Microsoft Foundry](https://ai.azure.com/templates) |
| **💬 Społeczność** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mimo że dokładamy starań, aby tłumaczenie było jak najdokładniejsze, prosimy pamiętać, że tłumaczenia automatyczne mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym należy uważać za źródło wiążące. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->