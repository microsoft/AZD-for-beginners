# Luku 1: Perusta & Pikakäynnistys

**📚 Kurssi**: [AZD Aloittelijoille](../../README.md) | **⏱️ Kesto**: 75-120 minuuttia, mukaan lukien ensimmäinen käyttöönotto; lisäharjoitukset vievät enemmän aikaa | **⭐ Vaikeustaso**: Aloittelija

---

## Yleiskatsaus

Tässä luvussa tutustutaan Azure Developer CLI:n (azd) perusteisiin. Opit keskeiset käsitteet, asennat työkalut ja otat ensimmäisen sovelluksesi käyttöön Azureen.

> Komentojen ja asetusten tarkastelun kohde: `azd 1.37.2` (marraskuu 2026). Live Azure -provisiointia ei suoritettu tarkastuksen aikana.

## Oppimistavoitteet

Tässä luvussa opit:
- Mitä Azure Developer CLI on ja miten se eroaa Azure CLI:stä
- Kuinka asentaa ja konfiguroida AZD omalle alustallesi
- Kuinka ottaa ensimmäinen sovelluksesi käyttöön Azureen `azd up` avulla
- Kuinka siivota resurssit `azd down` avulla

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [AZD:n Perusteet](azd-basics.md) | Keskeiset käsitteet, termistö ja projektin rakenne | 15 min |
| 2 | [Asennus & Asetukset](installation.md) | Alustakohtaiset asennusohjeet | 10 min |
| 3 | [Ensimmäinen Projektisi](first-project.md) | Käytännön harjoitus: verkkosovelluksen käyttöönotto Azureen | 20 min |
| 4 | [Ota Oma Sovelluksesi Mukaan](bring-your-own-app.md) | Lisää azd jo olemassa olevaan projektiisi | 15 min |
| 5 | [Kehitysämpärit & Codespaces](dev-containers.md) | Toistettavat azd-ympäristöt kehitysämpäreiden avulla | 15 min |

---

## ✅ Aloita tästä: Vahvista Asennuksesi

Ennen aloittamista varmista, että paikallinen koneesi on valmis Luvun 1 mallipohjaa varten:

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

## 🚀 Pikakäynnistys

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ Onnistumisen Kriteerit

Luvun suorittamisen jälkeen sinun tulisi osata:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 Navigointi

| Suunta | Luku |
|-----------|---------|
| **Seuraava** | [Luku 2: AI-Ensimmäinen Kehitys](../chapter-02-ai-development/README.md) |
| **Siirry** | [Luku 3: Konfigurointi](../chapter-03-configuration/README.md) |

---

## 📖 Liittyvät Resurssit

- [Komentojen Pikatuki](../../resources/cheat-sheet.md)
- [UKK](../../resources/faq.md)
- [Sanasto](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->