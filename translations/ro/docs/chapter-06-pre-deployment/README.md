# Capitolul 6: Planificarea și Validarea înainte de Implementare

**📚 Curs**: [AZD Pentru Începători](../../README.md) | **⏱️ Durata**: 1 oră | **⭐ Complexitate**: Intermediar

---

## Prezentare generală

Acest capitol acoperă pașii esențiali de planificare și validare înainte de a implementa aplicația. Învățați să evitați greșelile costisitoare cu planificarea corectă a capacității, selecția SKU și verificările prealabile.

> Validat cu `azd 1.27.1` în iulie 2026.

## Obiective de învățare

Prin finalizarea acestui capitol, veți:
- Rula verificări prealabile înainte de implementare
- Planifica capacitatea și estima cerințele de resurse
- Selecta SKU-urile potrivite pentru optimizarea costurilor
- Configura Application Insights pentru monitorizare
- Înțelege modelele de coordonare în echipă

---

## 📚 Lecții

| # | Lecție | Descriere | Durată |
|---|--------|-------------|------|
| 1 | [Verificări prealabile](preflight-checks.md) | Validarea configurației înainte de implementare | 15 min |
| 2 | [Planificarea capacității](capacity-planning.md) | Estimarea cerințelor de resurse | 20 min |
| 3 | [Selecția SKU](sku-selection.md) | Alegerea nivelurilor de preț potrivite | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurarea monitorizării | 20 min |
| 5 | [Modele de coordonare](coordination-patterns.md) | Fluxuri de lucru în echipa de implementare | 15 min |

---

## 🚀 Pornire rapidă

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

## ☑️ Listă de verificare înainte de implementare

### Înainte de `azd provision`

- [ ] Cotă verificată pentru regiune
- [ ] SKU-urile selectate corespunzător
- [ ] Estimarea costurilor revizuită
- [ ] Convenția de denumire consistentă
- [ ] Securitate/RBAC configurat

### Înainte de `azd deploy`

- [ ] Variabilele de mediu setate
- [ ] Secrete în Key Vault
- [ ] Lanțurile de conexiune verificate
- [ ] Verificări de sănătate configurate

---

## 💰 Ghid de selecție SKU

| Sarcină | Dezvoltare | Producție |
|----------|-------------|------------|
| Container Apps | Consumpție | Dedicat D4 |
| App Service | B1/B2 | P1v3+ |
| Modele Microsoft Foundry | Standard | Standard + PTU |
| Căutare AI | Basic | Standard S2+ |

---

## 🔗 Navigare

| Direcție | Capitol |
|-----------|---------|
| **Anterior** | [Capitolul 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Următor** | [Capitolul 7: Remediere probleme](../chapter-07-troubleshooting/README.md) |

---

## 📖 Resurse conexe

- [Ghid de configurare](../chapter-03-configuration/configuration.md)
- [Ghid de implementare](../chapter-04-infrastructure/deployment-guide.md)
- [Probleme comune](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->