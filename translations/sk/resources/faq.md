# Často kladené otázky (FAQ)

**Pomoc podľa kapitol**
- **📚 Domov kurzu**: [AZD Pre začiatočníkov](../README.md)
- **🚆 Problémy s inštaláciou**: [Kapitola 1: Inštalácia a nastavenie](../docs/getting-started/installation.md)
- **🤖 Otázky o AI**: [Kapitola 2: Vývoj orientovaný na AI](../docs/ai-foundry/azure-ai-foundry-integration.md)
- **🔧 Riešenie problémov**: [Kapitola 7: Riešenie problémov a ladenie](../docs/troubleshooting/common-issues.md)

## Úvod

Tento komplexný FAQ poskytuje odpovede na najčastejšie otázky týkajúce sa Azure Developer CLI (azd) a nasadení v Azure. Nájdete tu rýchle riešenia bežných problémov, pochopíte osvedčené postupy a získate objasnenie konceptov a pracovných postupov azd.

## Ciele učenia

Preskúmaním tohto FAQ sa naučíte:
- Nájsť rýchle odpovede na bežné otázky a problémy s Azure Developer CLI
- Pochopiť kľúčové koncepty a terminológiu prostredníctvom praktického formátu otázok a odpovedí
- Získať riešenia na riešenie častých problémov a chýb
- Osvojiť si osvedčené postupy prostredníctvom často kladených otázok o optimalizácii
- Objaviť pokročilé funkcie a možnosti prostredníctvom otázok na expertnú úroveň
- Efektívne odkazovať na odporúčania týkajúce sa nákladov, bezpečnosti a stratégie nasadenia

## Výsledky učenia

Pravidelným odkazovaním na tento FAQ budete schopní:
- Samostatne riešiť bežné problémy s Azure Developer CLI pomocou poskytnutých riešení
- Robiť informované rozhodnutia o stratégiách a konfiguráciách nasadenia
- Pochopiť vzťah medzi azd a inými nástrojmi a službami Azure
- Aplikovať osvedčené postupy na základe skúseností komunity a odporúčaní odborníkov
- Efektívne riešiť problémy s autentifikáciou, nasadením a konfiguráciou
- Optimalizovať náklady a výkon pomocou poznatkov a odporúčaní z FAQ

## Obsah

- [Začíname](../../../resources)
- [Autentifikácia a prístup](../../../resources)
- [Šablóny a projekty](../../../resources)
- [Nasadenie a infraštruktúra](../../../resources)
- [Konfigurácia a prostredia](../../../resources)
- [Riešenie problémov](../../../resources)
- [Náklady a fakturácia](../../../resources)
- [Osvedčené postupy](../../../resources)
- [Pokročilé témy](../../../resources)

---

## Začíname

### Otázka: Čo je Azure Developer CLI (azd)?
**Odpoveď**: Azure Developer CLI (azd) je nástroj príkazového riadku zameraný na vývojárov, ktorý urýchľuje čas potrebný na presun vašej aplikácie z lokálneho vývojového prostredia do Azure. Poskytuje osvedčené postupy prostredníctvom šablón a pomáha s celým životným cyklom nasadenia.

### Otázka: Ako sa azd líši od Azure CLI?
**Odpoveď**: 
- **Azure CLI**: Všeobecný nástroj na správu zdrojov Azure
- **azd**: Nástroj zameraný na vývojárov pre pracovné postupy nasadenia aplikácií
- azd používa Azure CLI interne, ale poskytuje vyššie úrovne abstrakcie pre bežné vývojové scenáre
- azd obsahuje šablóny, správu prostredí a automatizáciu nasadenia

### Otázka: Potrebujem mať nainštalovaný Azure CLI na používanie azd?
**Odpoveď**: Áno, azd vyžaduje Azure CLI na autentifikáciu a niektoré operácie. Najskôr nainštalujte Azure CLI a potom azd.

### Otázka: Aké programovacie jazyky podporuje azd?
**Odpoveď**: azd je jazykovo nezávislý. Funguje s:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statické webové stránky
- Kontajnerizované aplikácie

### Otázka: Môžem používať azd s existujúcimi projektmi?
**Odpoveď**: Áno! Môžete:
1. Použiť `azd init` na pridanie konfigurácie azd do existujúcich projektov
2. Prispôsobiť existujúce projekty štruktúre šablóny azd
3. Vytvoriť vlastné šablóny na základe vašej existujúcej architektúry

---

## Autentifikácia a prístup

### Otázka: Ako sa autentifikujem v Azure pomocou azd?
**Odpoveď**: Použite `azd auth login`, ktorý otvorí okno prehliadača na autentifikáciu v Azure. Pre scenáre CI/CD použite servisné identity alebo spravované identity.

### Otázka: Môžem používať azd s viacerými Azure predplatnými?
**Odpoveď**: Áno. Použite `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` na špecifikovanie predplatného pre každé prostredie.

### Otázka: Aké oprávnenia potrebujem na nasadenie pomocou azd?
**Odpoveď**: Typicky potrebujete:
- **Rolu prispievateľa (Contributor)** na skupine zdrojov alebo predplatnom
- **Správcu prístupu používateľov (User Access Administrator)**, ak nasadzujete zdroje, ktoré vyžadujú priradenie rolí
- Konkrétne oprávnenia závisia od šablóny a nasadzovaných zdrojov

### Otázka: Môžem používať azd v CI/CD pipeline?
**Odpoveď**: Samozrejme! azd je navrhnutý na integráciu s CI/CD. Použite servisné identity na autentifikáciu a nastavte premenné prostredia na konfiguráciu.

### Otázka: Ako riešim autentifikáciu v GitHub Actions?
**Odpoveď**: Použite Azure Login akciu so servisnými identitami:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Šablóny a projekty

### Otázka: Kde nájdem šablóny azd?
**Odpoveď**: 
- Oficiálne šablóny: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Komunitné šablóny: Vyhľadajte na GitHube "azd-template"
- Použite `azd template list` na prehliadanie dostupných šablón

### Otázka: Ako vytvorím vlastnú šablónu?
**Odpoveď**: 
1. Začnite so štruktúrou existujúcej šablóny
2. Upravte `azure.yaml`, infraštruktúrne súbory a kód aplikácie
3. Dôkladne otestujte pomocou `azd up`
4. Publikujte na GitHub s príslušnými značkami

### Otázka: Môžem používať azd bez šablóny?
**Odpoveď**: Áno, použite `azd init` v existujúcom projekte na vytvorenie potrebných konfiguračných súborov. Budete musieť manuálne nakonfigurovať `azure.yaml` a infraštruktúrne súbory.

### Otázka: Aký je rozdiel medzi oficiálnymi a komunitnými šablónami?
**Odpoveď**: 
- **Oficiálne šablóny**: Udržiavané Microsoftom, pravidelne aktualizované, s komplexnou dokumentáciou
- **Komunitné šablóny**: Vytvorené vývojármi, môžu mať špecifické použitia, rôznu kvalitu a údržbu

### Otázka: Ako aktualizujem šablónu vo svojom projekte?
**Odpoveď**: Šablóny sa neaktualizujú automaticky. Môžete:
1. Manuálne porovnať a zlúčiť zmeny zo zdrojovej šablóny
2. Začať odznova s `azd init` pomocou aktualizovanej šablóny
3. Vybrať konkrétne vylepšenia z aktualizovaných šablón

---

...
2. **Šablóny**: Vytvárajte šablóny podľa [pokynov pre šablóny](https://github.com/Azure-Samples/awesome-azd)  
3. **Dokumentácia**: Prispievajte do dokumentácie na [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)  

### Otázka: Aký je plán pre azd?  
**Odpoveď**: Pozrite si [oficiálny plán](https://github.com/Azure/azure-dev/projects) pre plánované funkcie a vylepšenia.  

### Otázka: Ako môžem migrovať z iných nástrojov na nasadzovanie na azd?  
**Odpoveď**:  
1. Analyzujte aktuálnu architektúru nasadzovania  
2. Vytvorte ekvivalentné šablóny Bicep  
3. Nakonfigurujte `azure.yaml`, aby zodpovedal aktuálnym službám  
4. Dôkladne otestujte v prostredí pre vývoj  
5. Postupne migrujte prostredia  

---

## Máte stále otázky?  

### **Najprv hľadajte**  
- Prezrite si [oficiálnu dokumentáciu](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Vyhľadajte [problémy na GitHube](https://github.com/Azure/azure-dev/issues) pre podobné problémy  

### **Získajte pomoc**  
- [Diskusie na GitHube](https://github.com/Azure/azure-dev/discussions) - Podpora od komunity  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Technické otázky  
- [Azure Discord](https://discord.gg/azure) - Chat komunity v reálnom čase  

### **Nahláste problémy**  
- [Problémy na GitHube](https://github.com/Azure/azure-dev/issues/new) - Hlásenia chýb a požiadavky na funkcie  
- Priložte relevantné logy, chybové hlásenia a kroky na reprodukciu  

### **Zistite viac**  
- [Dokumentácia k Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Centrum architektúry Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Rámec dobre navrhnutej architektúry Azure](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*Tento FAQ je pravidelne aktualizovaný. Posledná aktualizácia: 9. september 2025*  

---

**Navigácia**  
- **Predchádzajúca lekcia**: [Glosár](glossary.md)  
- **Nasledujúca lekcia**: [Študijný sprievodca](study-guide.md)  

---

**Upozornenie**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.