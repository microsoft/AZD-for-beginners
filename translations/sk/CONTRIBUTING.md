# Príspevky do AZD For Beginners

Ďakujeme za váš záujem prispievať do kurzu AZD For Beginners! Tento dokument poskytuje usmernenia a informácie pre prispievateľov.

## Ako prispieť

### Nahlasovanie problémov

Ak nájdete chyby, omyly alebo máte návrhy na vylepšenia:

1. **Skontrolujte existujúce problémy**: Vyhľadajte v [existujúcich problémoch](https://github.com/microsoft/azd-for-beginners/issues), aby ste sa vyhli duplicitám
2. **Vytvorte nový problém**: Použite príslušnú šablónu problému
3. **Poskytnite podrobnosti**: Uveďte kroky na reprodukciu, očakávané správanie a snímky obrazovky, ak sú vhodné

### Navrhovanie zmien

1. **Vytvorte fork repozitára**: Vytvorte si vlastný fork projektu
2. **Vytvorte vetvu**: Vytvorte vetvu pre svoje zmeny
3. **Urobte zmeny**: Dodržujte naše normy pre kódovanie a dokumentáciu
4. **Otestujte svoje zmeny**: Overte, či všetky odkazy fungujú a obsah sa správne zobrazuje
5. **Odošlite pull request**: Poskytnite jasný popis svojich zmien

### Typy príspevkov

Vitame nasledujúce typy príspevkov:

#### Vylepšenia obsahu
- Opravte preklepy, gramatické a formátovacie chyby
- Zlepšite zrozumiteľnosť existujúcej dokumentácie
- Aktualizujte zastarané informácie
- Pridajte chýbajúce vysvetlenia alebo kontext

#### Nové príklady
- Pridajte scenáre nasadenia zo skutočného sveta
- Vytvorte nové AZD šablóny pre bežné použitia
- Poskytnite ďalšie ukážky kódu a cvičenia

#### Podpora prekladov
- Pomáhajte udržiavať existujúce preklady
- Zlepšite kvalitu prekladov
- Pridajte preklady pre nový obsah

#### Hlásenia chýb
- Nahláste zlomené odkazy alebo nesprávne príklady kódu
- Identifikujte nezrovnalosti v dokumentácii
- Označte problémy s prístupnosťou

## Pokyny pre príspevky

### Štandardy dokumentácie

- Používajte jasný, začiatočníkom priateľský jazyk
- Zahrňte ciele učenia a očakávané výsledky
- Poskytujte podrobné pokyny s očakávaným výstupom
- Pridajte navigačné odkazy na súvisiaci obsah
- Používajte konzistentné formátovanie a štýl markdown

### Príklady kódu

- Zabezpečte, aby všetky príklady kódu boli otestované a funkčné
- Zahrňte komentáre vysvetľujúce kľúčové koncepty
- Dodržiavajte najlepšie praktiky Azure a AZD
- Poskytnite očakávaný výstup, kde je to možné

### Overenie anglickej dokumentácie

Zo základného adresára repozitára nainštalujte existujúce vývojové požiadavky a spustite:

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

Offline kontrolór odkazov kontroluje anglické Markdown/HTML cesty, nadpisy, explicitné kotvy a prázdne zástupné odkazy. Vylučuje generované `translations/` a `translated_images/` vrátane odkazov do týchto adresárov. Nezískava externé webstránky ani neoveruje Azure nasadenia. Použite `--json <report-path>` na export chýb a externý inventár URL pre samostatnú sieťovú kontrolu. Overte aktuálne upstream príkazy a prípravy vzoriek pri zmene technických inštrukcií; odlíšte testované aplikácie od návrhových schém.

### Správy commitov

Používajte jasné, popisné správy commitov:
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## Kód správania

Prečítajte si a dodržujte náš [Kód správania](CODE_OF_CONDUCT.md) pre udržanie príjemnej a inkluzívnej komunity.

## Hľadanie pomoci

- **Otázky**: Vyhľadajte alebo otvorte [GitHub issue](https://github.com/microsoft/AZD-for-beginners/issues)
- **Komunita**: Pripojte sa k [Azure Discord](https://discord.gg/microsoft-azure)
- **Dokumentácia**: Prezrite si [dokumentáciu Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## Licencia

Prispievaním do tohto repozitára súhlasíte, že vaše príspevky budú licencované pod [MIT licenciou](../../LICENSE).

---

Ďakujeme, že pomáhate urobiť AZD For Beginners lepším zdrojom učenia pre komunitu!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->