# Přispívání do AZD Pro Začátečníky

Děkujeme za váš zájem přispívat do kurzu AZD Pro Začátečníky! Tento dokument obsahuje pokyny a informace pro přispěvatele.

## Jak přispívat

### Hlásit chyby

Pokud najdete chyby, omyly nebo máte návrhy na vylepšení:

1. **Zkontrolujte stávající problémy**: Prohledejte [stávající problémy](https://github.com/microsoft/azd-for-beginners/issues), abyste předešli duplicitám
2. **Vytvořte nový problém**: Použijte odpovídající šablonu problému
3. **Uveďte podrobnosti**: Začněte kroky ke znovuobjevení chyby, očekávaným chováním a případnými screenshoty

### Navrhování změn

1. **Vytvořte fork repozitáře**: Vytvořte si vlastní fork projektu
2. **Vytvořte větev**: Založte si větev s novými funkcemi pro své změny
3. **Proveďte změny**: Dodržujte naše standardy kódování a dokumentace
4. **Otestujte své změny**: Zkontrolujte, že všechny odkazy fungují a obsah se správně zobrazuje
5. **Odešlete pull request**: Přiložte jasný popis svých změn

### Typy příspěvků

Vítáme následující typy příspěvků:

#### Vylepšení obsahu
- Opravte překlepy, gramatiku a formátování
- Zlepšete srozumitelnost stávající dokumentace
- Aktualizujte zastaralé informace
- Přidejte chybějící vysvětlení nebo kontext

#### Nové příklady
- Přidejte situace z reálného nasazení
- Vytvořte nové šablony AZD pro běžné případy použití
- Poskytněte další ukázky kódu a cvičení

#### Podpora překladů
- Pomozte udržovat stávající překlady
- Zlepšujte kvalitu překladů
- Přidávejte překlady nového obsahu

#### Hlášení chyb
- Hlaste nefunkční odkazy nebo nesprávné příklady kódu
- Identifikujte nesrovnalosti v dokumentaci
- Upozorněte na problémy s přístupností

## Pokyny pro příspěvky

### Standardy dokumentace

- Používejte jasný, pro začátečníky přátelský jazyk
- Uveďte cíle učení a očekávané výsledky
- Poskytněte krok za krokem instrukce s očekávanými výstupy
- Přidejte navigační odkazy na související obsah
- Používejte konzistentní formátování a styl markdown

### Příklady kódu

- Zajistěte, aby všechny příklady kódu byly testované a funkční
- Přidejte komentáře vysvětlující klíčové koncepty
- Dodržujte nejlepší praxe Azure a AZD
- Uveďte očekávaný výstup, pokud je to možné

### Ověření anglické dokumentace

Ze kořenu repozitáře nainstalujte existující požadavky pro vývoj a spusťte:

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

Offline kontrola odkazů testuje anglické Markdown/HTML cesty, nadpisy, explicitní kotvy a prázdná místa odkazů. Vylučuje generované `translations/` a `translated_images/`, včetně odkazů do těchto adresářů. Neprovádí kontroly externích webů ani validaci nasazení Azure. Použijte `--json <report-path>` pro export chyb a externí inventář URL pro samostatnou síťovou kontrolu. Ověřte aktuální upstream příkazy a vzorové předpoklady při změně technických instrukcí; rozlišujte testované aplikace od návrhových plánů.

### Zprávy o commitech

Používejte jasné, popisné zprávy o commitech:
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## Kodex chování

Přečtěte si a dodržujte náš [Kodex chování](CODE_OF_CONDUCT.md), aby byla komunitní atmosféra přátelská a inkluzivní.

## Získání pomoci

- **Dotazy**: Prohledejte nebo založte [GitHub issue](https://github.com/microsoft/AZD-for-beginners/issues)
- **Komunita**: Přidejte se na [Azure Discord](https://discord.gg/microsoft-azure)
- **Dokumentace**: Prohlédněte si [dokumentaci Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## Licence

Přispěním do tohoto repozitáře souhlasíte, že vaše příspěvky budou licencovány pod [licencí MIT](../../LICENSE).

---

Děkujeme, že pomáháte učinit AZD Pro Začátečníky lepším zdrojem pro komunitu!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->