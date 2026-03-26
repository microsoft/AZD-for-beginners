# Capitolul 6: Planificare și Validare Prealabilă Implementării

**📚 Curs**: [AZD Pentru Începători](../../README.md) | **⏱️ Durată**: 1 oră | **⭐ Complexitate**: Intermediar

---

## Prezentare generală

Acest capitol acoperă pași esențiali de planificare și validare înainte de a implementa aplicația ta. Învață să eviți greșelile costisitoare printr-o planificare corectă a capacității, selectarea SKU-urilor și verificări prealabile.

## Obiective de învățare

Prin finalizarea acestui capitol, vei:
- Rula verificări prealabile înainte de implementare
- Planifica capacitatea și estima cerințele de resurse
- Selecta SKU-urile potrivite pentru optimizarea costurilor
- Configura Application Insights pentru monitorizare
- Înțelege tiparele de coordonare în echipă

---

## 📚 Lecții

| # | Lecție | Descriere | Timp |
|---|--------|-----------|------|
| 1 | [Verificări prealabile](preflight-checks.md) | Validarea configurației înainte de implementare | 15 min |
| 2 | [Planificarea capacității](capacity-planning.md) | Estimarea cerințelor de resurse | 20 min |
| 3 | [Selectarea SKU-urilor](sku-selection.md) | Alegerea nivelurilor de preț adecvate | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurarea monitorizării | 20 min |
| 5 | [Tipare de coordonare](coordination-patterns.md) | Fluxuri de lucru pentru echipa de implementare | 15 min |

---

## 🚀 Început rapid

```bash
# Verifică cotele abonamentului
az vm list-usage --location eastus --output table

# Previzualizează implementarea (nu se creează resurse)
azd provision --preview

# Validează sintaxa Bicep
az bicep build --file infra/main.bicep

# Verifică configurația mediului
azd env get-values
```

---

## ☑️ Listă de verificare pre-implementare

### Înainte de `azd provision`

- [ ] Cota verificată pentru regiune
- [ ] SKU-urile selectate corespunzător
- [ ] Estimarea costurilor revizuită
- [ ] Convenția de denumire consistentă
- [ ] Securitatea/RBAC configurată

### Înainte de `azd deploy`

- [ ] Variabilele de mediu setate
- [ ] Secrete în Key Vault
- [ ] Șirurile de conexiune verificate
- [ ] Verificări de sănătate configurate

---

## 💰 Ghid pentru selectarea SKU-urilor

| Sarcină de lucru | Dezvoltare | Producție |
|------------------|------------|-----------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigare

| Direcție | Capitol |
|----------|---------|
| **Anterior** | [Capitolul 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Următor** | [Capitolul 7: Depanare](../chapter-07-troubleshooting/README.md) |

---

## 📖 Resurse conexe

- [Ghid de configurare](../chapter-03-configuration/configuration.md)
- [Ghid de implementare](../chapter-04-infrastructure/deployment-guide.md)
- [Probleme comune](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să aveți în vedere că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot rezulta din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->