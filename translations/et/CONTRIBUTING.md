# Panustamine AZD Algajatele

Täname, et olete huvitatud panustamisest AZD Algajatele kursusesse! See dokument pakub juhiseid ja teavet panustajatele.

## Kuidas Panustada

### Probleemide Teatamine

Kui leiate vigu, eksimusi või teil on ettepanekuid parandusteks:

1. **Kontrollige Olemasolevaid Probleeme**: Otsige [olemasolevaid probleeme](https://github.com/microsoft/azd-for-beginners/issues), et vältida duplikaate
2. **Looge Uus Probleem**: Kasutage sobivat probleemitamplate
3. **Andke Üksikasjad**: Lisage sammud reprodutseerimiseks, oodatud käitumine ja ekraanipildid, kui see on kohaldatav

### Muudatuste Ettepanek

1. **Tee Fork Repositooriumist**: Looge oma haru antud projektist
2. **Looge Haru**: Looge oma muudatuste jaoks teenusbranch
3. **Tehke Muudatusi**: Järgige meie kodeerimise ja dokumentatsiooni standardeid
4. **Testige Oma Muudatusi**: Veenduge, et kõik lingid töötavad ja sisu kuvamine on korrektne
5. **Esitage Pull Request**: Lisage selge kirjeldus oma muudatustest

### Panustamise Liigid

Me tervitame järgmisi panustamise liike:

#### Sisuanparanded
- Parandage trükivead, grammatikad ja vormindusvead
- Parandage olemasoleva dokumentatsiooni selgust
- Uuendage aegunud informatsiooni
- Lisage puuduvad selgitused või kontekst

#### Uued Näited
- Lisage reaalse maailma juurutamise stsenaariumid
- Looge uusi AZD malle levinud kasutusjuhtude jaoks
- Lisage täiendavaid koodinäiteid ja harjutusi

#### Tõlke Abi
- Aidake olemasolevaid tõlkeid hoida
- Parandage tõlke kvaliteeti
- Lisage tõlkeid uuele sisule

#### Vea Aruanded
- Teatage katkenud linkidest või valedest koodinäidetest
- Tuvastage dokumentatsiooni ebajärjekindlused
- Tõstke esile juurdepääsetavuse probleemid

## Panustamise Juhised

### Dokumentatsiooni Standardid

- Kasutage selget, algajale sõbralikku keelt
- Lisage õpieesmärgid ja tulemused
- Andke samm-sammulised juhised koos oodatavate tulemuste kirjeldustega
- Lisage navigeerimislingid seotud sisule
- Kasutage järjekindlat vormindust ja markdowni stiili

### Koodinäited

- Veenduge, et kõik koodinäited on testitud ja töötavad
- Lisage kommentaarid, mis selgitavad peamisi mõisteid
- Järgige Azure ja AZD parimaid tavasid
- Esitage oodatav väljund, kui see on kohaldatav

### Ingliskeelse Dokumentatsiooni Kontrollimine

Repositooriumi juurest paigaldage olemasolevad arenduse nõuded ja käivitage:

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

Offline lingikontrollija kontrollib ingliskeelse Markdown/HTML teid, pealkirju, eksporditud ankruid ja tühje lingikohti. See välistab genereeritud `translations/` ja `translated_images/`, sh linkid nendesse kaustadesse. See ei küsi väliseid veebisaite ega kontrolli Azure juurutusi. Kasutage `--json <report-path>` vea- ja välise URL-i inventari eksportimiseks eraldi võrgu kontrolli jaoks. Kontrollige jooksvaid tootmis- ja näidisnõudeid tehniliste juhiste muutmisel; eristage testitud rakendusi disainikavanditest.

### Commit Sõnumid

Kasutage selgeid, kirjeldavaid commit sõnumeid:
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## Käitumisjuhend

Palun lugege ja järgige meie [Käitumisjuhendit](CODE_OF_CONDUCT.md), et hoida kogukond vastuvõtva ja kaasavana.

## Abi Saamine

- **Küsimused**: Otsige või avage [GitHubi probleem](https://github.com/microsoft/AZD-for-beginners/issues)
- **Kogukond**: Liituge [Azure Discordiga](https://discord.gg/microsoft-azure)
- **Dokumentatsioon**: Vaadake [Azure Developer CLI dokumentatsiooni](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## Litsents

Panustades sellesse repositooriumisse nõustute, et teie panused litsentseeritakse [MIT litsentsi](../../LICENSE) alusel.

---

Täname, et aitate muuta AZD Algajatele paremaks õppematerjaliks kogukonnale!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->