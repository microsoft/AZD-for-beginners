# 6. peatükk: Eelplaneerimine ja valideerimine enne juurutamist

**📚 Kursus**: [AZD algajatele](../../README.md) | **⏱️ Kestus**: 1 tund | **⭐ Tase**: Kesktase

---

## Ülevaade

Selles peatükis käsitletakse olulisi planeerimise ja valideerimise samme enne rakenduse juurutamist. Õppige vältima kulukaid vigu õige mahutavuse planeerimise, SKU valiku ja eelkontrollide abil.

## Õpieesmärgid

Selle peatüki läbimisel:
- Teete eelkontrolle enne juurutamist
- Planeerite mahutavust ja hindate ressursside vajadusi
- Valite sobivad SKU hinnamudelite optimeerimiseks
- Konfigureerite Application Insights monitooringuks
- Mõistate meeskonnatöö koordineerimise mustreid

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|----------|-----------|-----|
| 1 | [Eelkontrollid](preflight-checks.md) | Kinnita konfiguratsioon enne juurutamist | 15 min |
| 2 | [Mahutavuse planeerimine](capacity-planning.md) | Hinda ressursside vajadusi | 20 min |
| 3 | [SKU valik](sku-selection.md) | Vali sobivad hinnatasemed | 15 min |
| 4 | [Application Insights](application-insights.md) | Määra monitooring | 20 min |
| 5 | [Koordineerimismustrid](coordination-patterns.md) | Meeskonna juurutuse töövood | 15 min |

---

## 🚀 Kiire algus

```bash
# Kontrolli tellimuse kvotasid
az vm list-usage --location eastus --output table

# Eelvaade juurutamisest (ressursse ei loo)
azd provision --preview

# Kontrolli Bicepi süntaksit
az bicep build --file infra/main.bicep

# Kontrolli keskkonna seadistust
azd env get-values
```

---

## ☑️ Kontrollnimekiri enne juurutamist

### Enne `azd provision` käsu käivitamist

- [ ] Päritolu kvota kontrollitud
- [ ] Sobivad SKU valitud
- [ ] Kulu prognoos üle vaadatud
- [ ] Nimetuskonventsioon järjepidev
- [ ] Turve/RBAC konfigureeritud

### Enne `azd deploy` käivitamist

- [ ] Keskkonnamuutujad määratud
- [ ] Saladused Key Vaults olemas
- [ ] Ühendusstringid kontrollitud
- [ ] Tervisekontrollid seadistatud

---

## 💰 SKU valiku juhend

| Koormus | Arendus | Tootmine |
|---------|---------|----------|
| Container Apps | Tarbimine | Pühendatud D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry mudelid | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigatsioon

| Suund | Peatükk |
|--------|---------|
| **Eelmine** | [5. peatükk: Mitme agenti kasutamine](../chapter-05-multi-agent/README.md) |
| **Järgmine** | [7. peatükk: Tõrkeotsing](../chapter-07-troubleshooting/README.md) |

---

## 📖 Seotud materjalid

- [Konfiguratsiooni juhend](../chapter-03-configuration/configuration.md)
- [Juurutamise juhend](../chapter-04-infrastructure/deployment-guide.md)
- [Levinumad probleemid](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:  
See dokument on tõlgitud kasutades tehisintellektil põhinevat tõlke teenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüame tagada täpsust, tuleb arvestada, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada usaldusväärseks allikaks. Olulise info puhul soovitatakse kasutada professionaalse inimtõlke teenust. Me ei vastuta ühegi arusaamatuse või valesti mõistmise eest, mis võib tekkida selle tõlke kasutamisel.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->