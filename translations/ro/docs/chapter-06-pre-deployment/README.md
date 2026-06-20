# Capitolul 6: Planificare și Validare Pre-Implementare

**📚 Curs**: [AZD Pentru Începători](../../README.md) | **⏱️ Durată**: 1 oră | **⭐ Complexitate**: Intermediar

---

## Prezentare generală

Acest capitol acoperă pașii esențiali de planificare și validare înainte de implementarea aplicației tale. Învață să eviți greșelile costisitoare prin planificarea corectă a capacității, selectarea SKU-urilor și verificările prealabile.

> Validat cu `azd 1.25.6` în iunie 2026.

## Obiectivele de învățare

Prin parcurgerea acestui capitol, vei:
- Executa verificări prealabile înainte de implementare
- Planifica capacitatea și estima cerințele de resurse
- Selecta SKU-urile potrivite pentru optimizarea costurilor
- Configura Application Insights pentru monitorizare
- Înțelege modelele de coordonare în echipă

---

## 📚 Lecții

| # | Lecție | Descriere | Timp |
|---|--------|------------|------|
| 1 | [Verificări Prealabile](preflight-checks.md) | Validarea configurației înainte de implementare | 15 min |
| 2 | [Planificare Capacitate](capacity-planning.md) | Estimarea cerințelor de resurse | 20 min |
| 3 | [Selectarea SKU](sku-selection.md) | Alegerea nivelurilor de preț potrivite | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurarea monitorizării | 20 min |
| 5 | [Modele de Coordonare](coordination-patterns.md) | Fluxuri de lucru pentru implementare în echipă | 15 min |

---

## 🚀 Pornire Rapidă

```bash
# Verifică cotele abonamentului
az vm list-usage --location eastus --output table

# Previzualizează implementarea (fără resurse create)
azd provision --preview

# Validează sintaxa Bicep
az bicep build --file infra/main.bicep

# Verifică configurația mediului
azd env get-values
```

---

## ☑️ Lista de verificare pre-implementare

### Înainte de `azd provision`

- [ ] Cota verificată pentru regiune
- [ ] SKU-uri selectate corespunzător
- [ ] Estimarea costurilor revizuită
- [ ] Convenția de denumire consistentă
- [ ] Configurare securitate/RBAC

### Înainte de `azd deploy`

- [ ] Variabilele de mediu setate
- [ ] Secrete în Key Vault
- [ ] Șirurile de conexiune verificate
- [ ] Verificări de sănătate configurate

---

## 💰 Ghid de selecție SKU

| Sarcină | Dezvoltare | Producție |
|----------|-------------|-----------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigare

| Direcție | Capitol |
|-----------|---------|
| **Anterior** | [Capitolul 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Următor** | [Capitolul 7: Depanare](../chapter-07-troubleshooting/README.md) |

---

## 📖 Resurse conexe

- [Ghid de Configurare](../chapter-03-configuration/configuration.md)
- [Ghid de Implementare](../chapter-04-infrastructure/deployment-guide.md)
- [Probleme Comune](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->