# Luku 1: Perusta ja pika-aloitus

**📚 Kurssi**: [AZD aloittelijoille](../../README.md) | **⏱️ Kesto**: 30-45 minuuttia | **⭐ Vaikeustaso**: Aloittelijatason

---

## Yleiskatsaus

Tässä luvussa esitellään Azure Developer CLI (azd) -perusteet. Opit keskeiset käsitteet, asennat työkalut ja otat ensimmäisen sovelluksesi käyttöön Azuren kautta.

> Tarkistettu `azd 1.25.6`:lla kesäkuussa 2026.

## Oppimistavoitteet

Kun olet suorittanut tämän luvun, osaat:
- Ymmärtää, mitä Azure Developer CLI on ja miten se eroaa Azure CLI:stä
- Asentaa ja konfiguroida AZD:n omalle alustallesi
- Ota ensimmäinen sovelluksesi käyttöön Azureen komennolla `azd up`
- Poistaa resurssit komennolla `azd down`

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [AZD perusteet](azd-basics.md) | Peruskäsitteet, terminologia ja projektin rakenne | 15 min |
| 2 | [Asennus ja määritys](installation.md) | Alustakohtaiset asennusohjeet | 10 min |
| 3 | [Ensimmäinen projektisi](first-project.md) | Käytännön harjoitus: Ota verkkosovellus käyttöön Azureen | 20 min |
| 4 | [Tuo oma sovellus](bring-your-own-app.md) | Lisää azd olemassa olevaan projektiin, joka sinulla jo on | 15 min |
| 5 | [Dev-kontit & Codespaces](dev-containers.md) | Toistettavat azd-ympäristöt dev-konteilla | 15 min |

---

## ✅ Aloita tästä: Varmista asennuksesi

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

# Tunnistaudu AZD:lle
# Valinnainen: az login, jos aiot suorittaa Azure CLI -komentoja suoraan
azd auth login

# Ota ensimmäinen sovelluksesi käyttöön
azd init --template todo-nodejs-mongo
azd up

# Siivoa kun olet valmis
azd down --force --purge
```

---

## ✅ Onnistumisen kriteerit

Tämän luvun suorittamisen jälkeen sinun pitäisi osata:

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
| **Seuraava** | [Luku 2: AI-keskeinen kehitys](../chapter-02-ai-development/README.md) |
| **Siirry** | [Luku 3: Konfigurointi](../chapter-03-configuration/README.md) |

---

## 📖 Liittyvät resurssit

- [Komentojen pikavihje](../../resources/cheat-sheet.md)
- [UKK](../../resources/faq.md)
- [Sanasto](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->