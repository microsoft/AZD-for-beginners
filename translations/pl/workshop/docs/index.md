# Warsztat AZD dla deweloperów AI

> Zweryfikowano na `azd 1.27.1` w lipcu 2026.

> [!IMPORTANT]  
> **Ten warsztat jest wyposażony w przewodnik warsztatowy, który możesz przeglądać w lokalnej przeglądarce. Aby rozpocząć, otwórz repozytorium w GitHub Codespaces, kontenerze deweloperskim lub lokalnym klonie z zainstalowanym MkDocs — a następnie poczekaj, aż zobaczysz aktywny terminal VS Code i wpisz:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **Powinno pojawić się okno dialogowe z możliwością otwarcia podglądu strony w przeglądarce.**

Witamy na praktycznym warsztacie, na którym poznasz Azure Developer CLI (AZD) ze szczególnym uwzględnieniem wdrażania aplikacji AI. Ten warsztat pomoże Ci zdobyć praktyczną wiedzę na temat szablonów AZD w 3 krokach:

1. **Odkrywanie** – znajdź szablon odpowiedni dla siebie.
1. **Wdrażanie** – wdroż i zweryfikuj, czy działa
1. **Dostosowywanie** – modyfikuj i iteruj, aby uczynić go swoim!

W trakcie warsztatu poznasz również podstawowe narzędzia i przepływy pracy dla deweloperów, które pomogą usprawnić Twoją kompleksową ścieżkę rozwoju.

| | | 
|:---|:---|
| **📚 Strona kursu**| [AZD dla początkujących](../README.md)|
| **📖 Dokumentacja** | [Rozpocznij pracę z szablonami AI](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ Szablony AI** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
|**🚀 Kolejne kroki** | [Wykonaj wyzwanie](#workshop-challenge) |
| | |

## Przegląd warsztatu

**Czas trwania:** 3–4 godziny  
**Poziom:** od początkującego do średniozaawansowanego  
**Wymagania wstępne:** Znajomość Azure, koncepcji AI, VS Code i narzędzi wiersza poleceń.

Jest to warsztat praktyczny, podczas którego uczysz się poprzez działanie. Po ukończeniu ćwiczeń zalecamy zapoznanie się z programem AZD dla początkujących, aby kontynuować naukę najlepszych praktyk dotyczących bezpieczeństwa i produktywności.

| Czas| Moduł  | Cel |
|:---|:---|:---|
| 15 min | Wprowadzenie | Ustalenie ram, zrozumienie celów |
| 30 min | Wybór szablonu AI | Poznaj opcje i wybierz startowy | 
| 30 min | Walidacja szablonu AI | Wdróż domyślne rozwiązanie w Azure |
| 30 min | Rozbiórka szablonu AI | Poznaj strukturę i konfigurację |
| 30 min | Konfiguracja szablonu AI | Aktywuj i wypróbuj dostępne funkcje |
| 30 min | Dostosowanie szablonu AI | Dopasuj szablon do swoich potrzeb |
| 30 min | Demontaż infrastruktury | Sprzątanie i zwolnienie zasobów |
| 15 min | Podsumowanie i kolejne kroki | Zasoby edukacyjne, wyzwanie warsztatowe |
| | |

## Czego się nauczysz

Traktuj szablon AZD jako piaskownicę do nauki, w której możesz eksplorować różne możliwości i narzędzia do kompleksowego tworzenia na platformie Microsoft Foundry. Pod koniec warsztatu powinieneś mieć intuicyjne zrozumienie różnych narzędzi i koncepcji w tym kontekście.

| Koncepcja  | Cel |
|:---|:---|
| **Azure Developer CLI** | Zrozumienie poleceń narzędzia i przepływów pracy |
| **Szablony AZD**| Zrozumienie struktury projektu i konfiguracji |
| **Azure AI Agent**| Provisionowanie i wdrażanie projektu Microsoft Foundry |
| **Azure AI Search**| Umożliwienie inżynierii kontekstu za pomocą agentów |
| **Obserwowalność**| Poznaj śledzenie, monitorowanie i ewaluacje |
| **Red Teaming**| Poznaj testy adwersarzy i metody łagodzenia |
| | |

## Moduły warsztatu

Gotowy, aby zacząć? Przejdź przez moduły warsztatu:

- [Moduł 1: Wybierz szablon AI](instructions/1-Select-AI-Template.md)
- [Moduł 2: Zweryfikuj szablon AI](instructions/2-Validate-AI-Template.md) 
- [Moduł 3: Rozbierz szablon AI](instructions/3-Deconstruct-AI-Template.md)
- [Moduł 4: Skonfiguruj szablon AI](instructions/4-Configure-AI-Template.md)
- [Moduł 5: Dostosuj szablon AI](instructions/5-Customize-AI-Template.md)
- [Moduł 6: Zdemontuj infrastrukturę](instructions/6-Teardown-Infrastructure.md)
- [Moduł 7: Podsumowanie i kolejne kroki](instructions/7-Wrap-up.md)

## Masz uwagi?

Zgłoś problem w tym repozytorium (oznacz go `Workshop`) lub dołącz do nas na [Discordzie](https://aka.ms/foundry/discord) i napisz na kanale `#get-help`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->