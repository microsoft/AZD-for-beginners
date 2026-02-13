<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 Warsztaty AZD dla programistów AI
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Warsztaty praktyczne z budowania aplikacji AI za pomocą Azure Developer CLI.</strong><br>
      Wykonaj 7 modułów, aby opanować szablony AZD i przepływy pracy wdrażania AI.
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Ostatnia aktualizacja: luty 2026
      </span>
    </div>
  </div>
</div>

# Warsztaty AZD dla programistów AI

Witamy na warsztatach praktycznych do nauki Azure Developer CLI (AZD) z naciskiem na wdrażanie aplikacji AI. Te warsztaty pomogą Ci zdobyć praktyczną wiedzę o szablonach AZD w 3 krokach:

1. **Odkrywanie** - znajdź szablon odpowiedni dla siebie.
1. **Wdrożenie** - wdroż i zweryfikuj, że działa
1. **Dostosowanie** - zmodyfikuj i iteruj, aby był Twój!

W trakcie warsztatów poznasz również podstawowe narzędzia i przepływy pracy programisty, które pomogą usprawnić Twój proces tworzenia od początku do końca.

<br/>

## Przewodnik przeglądarkowy

Lekcje warsztatowe są w formacie Markdown. Możesz nawigować po nich bezpośrednio na GitHub - lub uruchomić podgląd w przeglądarce, jak pokazano na zrzucie ekranu poniżej.

![Workshop](../../../translated_images/pl/workshop.75906f133e6f8ba0.webp)

Aby skorzystać z tej opcji — zatwierdź repozytorium do swojego profilu, a następnie uruchom GitHub Codespaces. Gdy terminal VS Code będzie aktywny, wpisz to polecenie:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

W ciągu kilku sekund zobaczysz wyskakujące okienko. Wybierz opcję `Open in browser`. Przewodnik internetowy otworzy się teraz na nowej karcie przeglądarki. Niektóre korzyści tego podglądu:

1. **Wbudowane wyszukiwanie** - szybko znajdź słowa kluczowe lub lekcje.
1. **Ikona kopiowania** - najeżdżaj na bloki kodu, by zobaczyć tę opcję
1. **Przełącznik motywu** - zmieniaj między trybem ciemnym a jasnym
1. **Uzyskaj pomoc** - kliknij ikonę Discord w stopce, aby dołączyć!

<br/>

## Przegląd warsztatów

**Czas trwania:** 3-4 godziny  
**Poziom:** Początkujący do średniozaawansowanego  
**Wymagania wstępne:** Znajomość Azure, koncepcji AI, VS Code i narzędzi wiersza poleceń.

To warsztaty praktyczne, na których uczysz się przez działanie. Po zakończeniu ćwiczeń zalecamy przegląd programu AZD dla początkujących, aby kontynuować naukę na temat najlepszych praktyk związanych z bezpieczeństwem i produktywnością.

| Czas| Moduł  | Cel |
|:---|:---|:---|
| 15 min | [Wprowadzenie](docs/instructions/0-Introduction.md) | Wprowadzenie, cele |
| 30 min | [Wybierz szablon AI](docs/instructions/1-Select-AI-Template.md) | Poznaj opcje i wybierz startowy | 
| 30 min | [Zweryfikuj szablon AI](docs/instructions/2-Validate-AI-Template.md) | Wdróż domyślne rozwiązanie w Azure |
| 30 min | [Rozbierz szablon AI](docs/instructions/3-Deconstruct-AI-Template.md) | Poznaj strukturę i konfigurację |
| 30 min | [Skonfiguruj szablon AI](docs/instructions/4-Configure-AI-Template.md) | Aktywuj i przetestuj dostępne funkcje |
| 30 min | [Dostosuj szablon AI](docs/instructions/5-Customize-AI-Template.md) | Dopasuj szablon do swoich potrzeb |
| 30 min | [Demontaż infrastruktury](docs/instructions/6-Teardown-Infrastructure.md) | Sprzątanie i zwolnienie zasobów |
| 15 min | [Podsumowanie i dalsze kroki](docs/instructions/7-Wrap-up.md) | Materiały edukacyjne, wyzwanie warsztatowe |

<br/>

## Czego się nauczysz

Pomyśl o szablonie AZD jak o piaskownicy do nauki, aby eksplorować różne możliwości i narzędzia do kompleksowego tworzenia na Microsoft Foundry. Po zakończeniu tych warsztatów powinieneś mieć intuicyjne wyczucie różnych narzędzi i koncepcji w tym kontekście.

| Koncepcja  | Cel |
|:---|:---|
| **Azure Developer CLI** | Zrozumienie poleceń narzędzia i przepływów pracy |
| **Szablony AZD** | Poznanie struktury projektu i konfiguracji |
| **Azure AI Agent** | Provisioning & wdrażanie projektów Microsoft Foundry |
| **Azure AI Search** | Umożliwienie inżynierii kontekstu z agentami |
| **Obserwowalność** | Poznaj śledzenie, monitorowanie i ewaluacje |
| **Red Teaming** | Poznaj testy przeciwstawne i środki zaradcze |

<br/>

## Struktura warsztatu

Warsztaty prowadzą Cię krok po kroku od odkrywania szablonów, przez wdrażanie, rozbiórkę i dostosowywanie — używając oficjalnego szablonu startowego [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) jako podstawy.

### [Moduł 1: Wybierz szablon AI](docs/instructions/1-Select-AI-Template.md) (30 min)

- Czym są szablony AI?
- Gdzie znaleźć szablony AI?
- Jak rozpocząć budowę agentów AI?
- **Laboratorium**: Szybki start z GitHub Codespaces

### [Moduł 2: Zweryfikuj szablon AI](docs/instructions/2-Validate-AI-Template.md) (30 min)

- Jaka jest architektura szablonu AI?
- Jak wygląda przepływ pracy rozwoju AZD?
- Gdzie szukać pomocy przy rozwoju AZD?
- **Laboratorium**: Wdróż i zweryfikuj szablon agentów AI

### [Moduł 3: Rozbierz szablon AI](docs/instructions/3-Deconstruct-AI-Template.md) (30 min)

- Poznaj swoje środowisko w `.azure/`
- Poznaj zainstalowane zasoby w `infra/`
- Poznaj konfigurację AZD w `azure.yaml`
- **Laboratorium**: Modyfikuj zmienne środowiskowe i ponownie wdrażaj

### [Moduł 4: Skonfiguruj szablon AI](docs/instructions/4-Configure-AI-Template.md) (30 min)
- Poznaj: Generowanie wspomagane przez pozyskiwanie (Retrieval Augmented Generation)
- Poznaj: Ewaluacje agentów i Red Teaming
- Poznaj: Śledzenie i monitorowanie
- **Laboratorium**: Eksploruj agenta AI i obserwowalność

### [Moduł 5: Dostosuj szablon AI](docs/instructions/5-Customize-AI-Template.md) (30 min)
- Zdefiniuj: PRD z wymaganiami scenariusza
- Skonfiguruj: zmienne środowiskowe dla AZD
- Wdroż: haki cyklu życia do dodatkowych zadań
- **Laboratorium**: Dostosuj szablon do mojego scenariusza

### [Moduł 6: Demontaż infrastruktury](docs/instructions/6-Teardown-Infrastructure.md) (30 min)
- Przypomnienie: Czym są szablony AZD?
- Przypomnienie: Dlaczego używać Azure Developer CLI?
- Kolejne kroki: Wypróbuj inny szablon!
- **Laboratorium**: Deprowizja infrastruktury i sprzątanie

<br/>

## Wyzwanie warsztatowe

Chcesz podjąć się większego wyzwania? Oto kilka propozycji projektów — lub podziel się swoimi pomysłami z nami!

| Projekt | Opis |
|:---|:---|
|1. **Rozbierz złożony szablon AI** | Użyj opisanych przepływów i narzędzi, sprawdź, czy potrafisz wdrożyć, zweryfikować i dostosować inny szablon rozwiązania AI. _Czego się nauczyłeś?_ |
|2. **Dostosuj do swojego scenariusza**  | Spróbuj napisać PRD (dokument wymagań produktu) dla innego scenariusza. Następnie użyj GitHub Copilot w repozytorium szablonu w trybie Agent Model i poproś o wygenerowanie przepływu pracy dostosowującego. _Czego się nauczyłeś? Jak możesz udoskonalić te sugestie?_ |
| | |

## Masz uwagi?

1. Zgłoś problem w tym repozytorium — oznacz go tagiem `Workshop`, aby ułatwić identyfikację.
1. Dołącz do Discorda Microsoft Foundry — połącz się z innymi uczestnikami!


| | | 
|:---|:---|
| **📚 Strona kursu**| [AZD dla początkujących](../README.md)|
| **📖 Dokumentacja** | [Rozpocznij pracę z szablonami AI](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ Szablony AI** | [Szablony Microsoft Foundry](https://ai.azure.com/templates) |
|**🚀 Kolejne kroki** | [Rozpocznij warsztat](../../../workshop) |
| | |

<br/>

---

**Nawigacja:** [Główny kurs](../README.md) | [Wprowadzenie](docs/instructions/0-Introduction.md) | [Moduł 1: Wybierz szablon](docs/instructions/1-Select-AI-Template.md)

**Gotowy, by zacząć budować aplikacje AI z AZD?**

[Rozpocznij warsztat: Wprowadzenie →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony przy użyciu automatycznej usługi tłumaczeniowej AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mimo że staramy się zapewnić dokładność, prosimy mieć na uwadze, że tłumaczenia automatyczne mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym powinien być traktowany jako źródło autorytatywne. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego, ludzkiego tłumaczenia. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->