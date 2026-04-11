# Luku 1: Perusta ja pika-aloitus

**📚 Kurssi**: [AZD For Beginners](../../README.md) | **⏱️ Kesto**: 30-45 minutes | **⭐ Vaativuus**: Beginner

---

## Yleiskatsaus

Tässä luvussa esitellään Azure Developer CLI (azd) -perusteet. Opit keskeiset käsitteet, asennat työkalut ja otat ensimmäisen sovelluksesi käyttöön Azureen.

> Varmennettu versiolla `azd 1.23.12` maaliskuussa 2026.

## Oppimistavoitteet

Kun suoritat tämän luvun, osaat:
- Ymmärtää, mitä Azure Developer CLI on ja miten se eroaa Azure CLI:stä
- Asentaa ja konfiguroida AZD:n alustallesi
- Ota ensimmäinen sovelluksesi käyttöön Azureen komennolla `azd up`
- Siivoa resurssit komennolla `azd down`

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [AZD:n perusteet](azd-basics.md) | Keskeiset käsitteet, termistö ja projektin rakenne | 15 min |
| 2 | [Asennus ja määritys](installation.md) | Alustakohtaiset asennusohjeet | 10 min |
| 3 | [Ensimmäinen projektisi](first-project.md) | Käytännössä: Ota web-sovellus käyttöön Azureen | 20 min |

---

## ✅ Aloita tästä: Varmista asetuksesi

Ennen kuin aloitat, varmista, että paikallinen koneesi on valmis Luku 1 -mallia varten:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jos skripti ilmoittaa puuttuvista työkaluista, korjaa ne ensin ja jatka sitten luvun parissa.

---

## 🚀 Pika-aloitus

```bash
# Tarkista asennus
azd version

# Todenna AZD:lle
# Valinnainen: az login, jos aiot suorittaa Azure CLI -komentoja suoraan
azd auth login

# Ota ensimmäinen sovelluksesi käyttöön
azd init --template todo-nodejs-mongo
azd up

# Siivoa, kun olet valmis
azd down --force --purge
```

---

## ✅ Onnistumiskriteerit

Tämän luvun suorittamisen jälkeen sinun pitäisi pystyä:

```bash
azd version              # Näyttää asennetun version
azd init --template todo-nodejs-mongo  # Alustaa projektin
azd up                   # Julkaisee Azureen
azd show                 # Näyttää käynnissä olevan sovelluksen URL-osoitteen
azd down --force --purge # Siivoaa resurssit
```

---

## 🔗 Navigointi

| Suunta | Luku |
|-----------|---------|
| **Next** | [Luku 2: AI-etusijainen kehittäminen](../chapter-02-ai-development/README.md) |
| **Skip to** | [Luku 3: Konfigurointi](../chapter-03-configuration/README.md) |

---

## 📖 Aiheeseen liittyvät resurssit

- [Komentojen pikaopas](../../resources/cheat-sheet.md)
- [UKK](../../resources/faq.md)
- [Sanasto](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme täsmällisyyteen, huomioithan, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai virheellisistä tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->