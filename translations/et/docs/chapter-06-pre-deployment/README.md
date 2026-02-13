# Peatükk 6: Enne juurutamist planeerimine ja valideerimine

**📚 Kursus**: [AZD algajatele](../../README.md) | **⏱️ Kestus**: 1 tund | **⭐ Keerukus**: Keskmine

---

## Ülevaade

See peatükk käsitleb olulisi planeerimis- ja valideerimisetappe enne rakenduse juurutamist. Õpi vältima kulukaid vigu õige mahtude planeerimise, SKU-de valiku ja eeltäitmiskontrollidega.

## Õpitulemused

Selle peatüki läbimisel sa:
- Käivitad eeltäitmiskontrolle enne juurutamist
- Planeerid mahtusid ja hindad ressursside vajadust
- Valid sobivad SKU-d kulude optimeerimiseks
- Konfigureerid Application Insightsi seiretamiseks
- Mõistad meeskonna koordineerimise mustreid

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|--------|-------------|------|
| 1 | [Eelehituskontrollid](preflight-checks.md) | Konfigureerimise valideerimine enne juurutamist | 15 min |
| 2 | [Võimsuse planeerimine](capacity-planning.md) | Ressursside vajaduse hindamine | 20 min |
| 3 | [SKU valik](sku-selection.md) | Sobivate hinnatasemete valimine | 15 min |
| 4 | [Application Insights](application-insights.md) | Seire konfigureerimine | 20 min |
| 5 | [Koordineerimise mustrid](coordination-patterns.md) | Meeskonna juurutustöövood | 15 min |

---

## 🚀 Kiirstart

```bash
# Kontrolli tellimuse kvotasid
az vm list-usage --location eastus --output table

# Juurutuse eelvaade (ressursse ei looda)
azd provision --preview

# Valideeri Bicepi süntaks
az bicep build --file infra/main.bicep

# Kontrolli keskkonna konfiguratsiooni
azd env get-values
```

---

## ☑️ Enne juurutamist kontrollnimekiri

### Enne `azd provision`

- [ ] Kvoot kontrollitud regiooni jaoks
- [ ] SKU-d valitud sobivalt
- [ ] Kulude hinnang üle vaadatud
- [ ] Nimemääramise konventsioon on järjepidev
- [ ] Turve/RBAC konfigureeritud

### Enne `azd deploy`

- [ ] Keskkonnamuutujad seadistatud
- [ ] Saladused Key Vaultis
- [ ] Ühendusstringid kontrollitud
- [ ] Tervisekontrollid konfigureeritud

---

## 💰 SKU valiku juhend

| Töökoormus | Arendus | Tootmine |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigeerimine

| Suund | Peatükk |
|-----------|---------|
| **Eelmine** | [Peatükk 5: Mitmeagendiline](../chapter-05-multi-agent/README.md) |
| **Järgmine** | [Peatükk 7: Tõrkeotsing](../chapter-07-troubleshooting/README.md) |

---

## 📖 Seotud ressursid

- [Konfiguratsiooni juhend](../chapter-03-configuration/configuration.md)
- [Juurutamise juhend](../chapter-04-infrastructure/deployment-guide.md)
- [Levinud probleemid](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastutusest loobumine:
See dokument on tõlgitud tehisintellektil põhineva tõlketeenuse Co-op Translator (https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada tõlke täpsust, palun arvestage, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument tema emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste ega vääritõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->