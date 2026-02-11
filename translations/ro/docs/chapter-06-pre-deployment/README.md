# Capitolul 6: Planificare și validare înainte de implementare

**📚 Curs**: [AZD Pentru Începători](../../README.md) | **⏱️ Durată**: 1 oră | **⭐ Complexitate**: Intermediar

---

## Prezentare generală

Acest capitol acoperă pașii esențiali de planificare și validare înainte de a implementa aplicația. Învățați cum să evitați greșelile costisitoare prin planificarea corectă a capacității, selectarea SKU-urilor și verificări prealabile.

## Obiective de învățare

Parcurgând acest capitol, veți:
- Rula verificări prealabile înainte de implementare
- Planifica capacitatea și estima cerințele de resurse
- Selecta SKU-urile potrivite pentru optimizarea costurilor
- Configura Application Insights pentru monitorizare
- Înțelege modele de coordonare a echipei

---

## 📚 Lecții

| # | Lecție | Descriere | Timp |
|---|--------|-----------|------|
| 1 | [Verificări prealabile](preflight-checks.md) | Validați configurația înainte de implementare | 15 min |
| 2 | [Planificarea capacității](capacity-planning.md) | Estimați cerințele de resurse | 20 min |
| 3 | [Selecția SKU](sku-selection.md) | Alegeți nivelurile de preț potrivite | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurați monitorizarea | 20 min |
| 5 | [Modele de coordonare](coordination-patterns.md) | Fluxuri de lucru de echipă pentru implementare | 15 min |

---

## 🚀 Pornire rapidă

```bash
# Verifică cotele abonamentului
az vm list-usage --location eastus --output table

# Previzualizare a implementării (nu se creează resurse)
azd provision --preview

# Validează sintaxa Bicep
az bicep build --file infra/main.bicep

# Verifică configurația mediului
azd env get-values
```

---

## ☑️ Lista de verificare înainte de implementare

### Înainte de `azd provision`

- [ ] Cotă verificată pentru regiune
- [ ] SKU-urile selectate corespunzător
- [ ] Estimarea costurilor revizuită
- [ ] Convenție de denumire consecventă
- [ ] Securitate/RBAC configurate

### Înainte de `azd deploy`

- [ ] Variabile de mediu setate
- [ ] Secrete în Key Vault
- [ ] Șiruri de conexiune verificate
- [ ] Verificări de sănătate configurate

---

## 💰 Ghid de selecție SKU

| Sarcină | Dezvoltare | Producție |
|---------|------------|-----------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
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
Declinare de responsabilitate:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original, în limba sa nativă, trebuie considerat sursa autorizată. Pentru informații critice se recomandă o traducere profesională realizată de un traducător uman. Nu ne asumăm răspunderea pentru eventualele neînțelegeri sau interpretări greșite rezultând din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->