# Κεφάλαιο 8: Πρότυπα Παραγωγής & Επιχείρησης

**📚 Μαθήμα**: [AZD Για Αρχάριους](../../README.md) | **⏱️ Διάρκεια**: 2-3 ώρες | **⭐ Πολυπλοκότητα**: Προχωρημένο

---

## Επισκόπηση

Αυτό το κεφάλαιο καλύπτει πρότυπα ανάπτυξης έτοιμα για επιχειρήσεις, ενίσχυση ασφάλειας, παρακολούθηση και βελτιστοποίηση κόστους για παραγωγικά AI workloads.

> Επαληθεύτηκε έναντι `azd 1.27.1` τον Ιούλιο του 2026.

## Στόχοι Μάθησης

Ολοκληρώνοντας αυτό το κεφάλαιο, θα:
- Αναπτύξετε εφαρμογές ανθεκτικές σε πολλαπλές περιοχές
- Υλοποιήσετε πρότυπα ασφάλειας επιχειρήσεων
- Διαμορφώσετε ολοκληρωμένη παρακολούθηση
- Βελτιστοποιήσετε το κόστος σε μεγάλη κλίμακα
- Ρυθμίσετε pipelines CI/CD με AZD

---

## 📚 Μαθήματα

| # | Μάθημα | Περιγραφή | Χρόνος |
|---|--------|-------------|------|
| 1 | [Βέλτιστες Πρακτικές Παραγωγής AI](production-ai-practices.md) | Πρότυπα ανάπτυξης επιχειρήσεων | 90 λεπτά |

---

## 🚀 Λίστα Ελέγχου Παραγωγής

- [ ] Ανάπτυξη σε πολλαπλές περιοχές για ανθεκτικότητα
- [ ] Διαχειριζόμενη ταυτότητα για έλεγχο ταυτότητας (χωρίς κλειδιά)
- [ ] Application Insights για παρακολούθηση
- [ ] Προϋπολογισμοί κόστους και ειδοποιήσεις διαμορφωμένοι
- [ ] Ενεργοποιημένη σάρωση ασφαλείας
- [ ] Ενσωμάτωση pipeline CI/CD
- [ ] Σχέδιο ανάκαμψης από καταστροφή

---

## 🏗️ Πρότυπα Αρχιτεκτονικής

### Πρότυπο 1: Microservices AI

```mermaid
graph LR
    Gateway[API Gateway] --> AI[AI Service] --> Models[Microsoft Foundry Models]
    Gateway --> Auth[Auth Service]
    AI --> Data[Data Store]
```

### Πρότυπο 2: Event-Driven AI

```mermaid
graph LR
    EventGrid[Event Grid] --> Functions[Functions] --> Pipeline[AI Pipeline]
```

---

## 🔐 Καλύτερες Πρακτικές Ασφάλειας

```bicep
// Use managed identity
identity: {
  type: 'SystemAssigned'
}

// Private endpoints for AI services
properties: {
  publicNetworkAccess: 'Disabled'
  networkAcls: {
    defaultAction: 'Deny'
  }
}
```

---

## 💰 Βελτιστοποίηση Κόστους

| Στρατηγική | Εξοικονόμηση |
|----------|---------|
| Κλιμάκωση μέχρι το μηδέν (Container Apps) | 60-80% |
| Χρήση επιπέδων κατανάλωσης για ανάπτυξη | 50-70% |
| Προγραμματισμένη κλιμάκωση | 30-50% |
| Κράτηση χωρητικότητας | 20-40% |

```bash
# Set budget alerts
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Ρύθμιση Παρακολούθησης

```bash
# Stream logs
azd monitor --logs

# Check Application Insights
azd monitor --overview

# View metrics
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Πλοήγηση

| Κατεύθυνση | Κεφάλαιο |
|-----------|---------|
| **Προηγούμενο** | [Κεφάλαιο 7: Επίλυση Προβλημάτων](../chapter-07-troubleshooting/README.md) |
| **Ολοκλήρωση Μαθήματος** | [Αρχική Μαθήματος](../../README.md) |

---

## 📖 Σχετικοί Πόροι

- [Οδηγός AI Agents](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Λύσεις Πολλαπλών Πρακτόρων](../chapter-05-multi-agent/README.md)
- [Παράδειγμα Microservices](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->